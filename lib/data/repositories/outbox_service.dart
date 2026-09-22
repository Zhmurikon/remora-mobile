import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../../data/db/database_provider.dart';
import '../../data/repositories/study_repository.dart';

/// Порог для автоотправки: накопилось N ответов — отправляем батч.
const _flushThreshold = 5;

/// Максимальный размер батча.
const _maxBatch = 100;

/// Сервис отправки накопленных ответов из review_outbox на сервер.
///
/// Ответы сначала записываются в Drift (мгновенно, не теряются при обрыве),
/// затем отправляются батчами. Идемпотентность гарантирует server по
/// `client_review_id`.
class OutboxService {
  OutboxService(this._repo, this._api);

  final StudyRepository _repo;
  final RemoraApiClient _api;

  /// Текущий session_id для батчей. Null — без привязки к сессии.
  String? sessionId;

  bool _flushing = false;

  /// Записать ответ и попробовать отправить.
  Future<void> enqueue(ReviewOutboxCompanion entry) async {
    await _repo.enqueueReview(entry);
    final count = await _repo.pendingCount();
    if (count >= _flushThreshold) {
      unawaited(flush());
    }
  }

  /// Отправить все накопленные ответы на сервер.
  ///
  /// Single-flight: параллельные вызовы делят одно выполнение.
  Future<void> flush() async {
    if (_flushing) return;
    _flushing = true;

    try {
      while (true) {
        final pending = await _repo.getPendingReviews();
        if (pending.isEmpty) break;

        final batch = pending.take(_maxBatch).toList();
        final reviews = batch
            .map((r) => ReviewIn(
                  clientReviewId: r.clientReviewId,
                  cardId: r.cardId,
                  direction: r.direction,
                  mode: r.mode,
                  rating: r.rating,
                  answerCorrect: r.answerCorrect,
                  durationMs: r.durationMs,
                  reviewedAt: r.reviewedAt,
                ))
            .toList();

        try {
          final result = await _api.submitReviews(ReviewBatch(
            sessionId: sessionId,
            reviews: reviews,
          ));

          // Убираем принятые + дубликаты (уже были на сервере)
          final toRemove = [
            ...result.accepted,
            ...result.duplicates,
          ];
          await _repo.removeReviews(toRemove);

          // Обновляем card_states из ответа сервера
          // (сервер возвращает новые состояния для затронутых карточек)
        } catch (_) {
          // Сеть недоступна — увеличиваем attempts и выходим
          for (final r in batch) {
            await _repo.bumpAttempts(r.clientReviewId);
          }
          break;
        }
      }
    } finally {
      _flushing = false;
    }
  }

  /// Количество неотправленных ответов.
  Future<int> pendingCount() => _repo.pendingCount();
}

// ── Провайдеры ──

final studyRepositoryProvider = Provider<StudyRepository>((ref) {
  return StudyRepository(ref.watch(databaseProvider));
});

final outboxServiceProvider = Provider<OutboxService>((ref) {
  return OutboxService(
    ref.watch(studyRepositoryProvider),
    ref.watch(apiClientProvider),
  );
});
