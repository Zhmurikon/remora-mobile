import 'package:drift/drift.dart';

import '../db/app_database.dart';

/// CRUD для review_outbox и card_states — ядро офлайн-обучения.
class StudyRepository {
  StudyRepository(this._db);

  final AppDatabase _db;

  // ── Review Outbox ──

  /// Все неотправленные ответы, отсортированные по времени.
  Future<List<ReviewOutboxData>> getPendingReviews() {
    return (_db.select(_db.reviewOutbox)
          ..orderBy([(r) => OrderingTerm.asc(r.reviewedAt)]))
        .get();
  }

  /// Количество неотправленных ответов.
  Future<int> pendingCount() async {
    final rows = await (_db.selectOnly(_db.reviewOutbox)
          ..addColumns([_db.reviewOutbox.clientReviewId.count()]))
        .getSingle();
    return rows.read(_db.reviewOutbox.clientReviewId.count()) ?? 0;
  }

  /// Записать ответ в outbox. Идемпотентно по clientReviewId.
  Future<void> enqueueReview(ReviewOutboxCompanion entry) {
    return _db.reviewOutbox.insertOnConflictUpdate(entry);
  }

  /// Удалить отправленные ответы по списку clientReviewId.
  Future<void> removeReviews(List<String> clientReviewIds) async {
    if (clientReviewIds.isEmpty) return;
    await (_db.delete(_db.reviewOutbox)
          ..where((r) => r.clientReviewId.isIn(clientReviewIds)))
        .go();
  }

  /// Увеличить счётчик попыток отправки.
  Future<void> bumpAttempts(String clientReviewId) async {
    final row = await (_db.select(_db.reviewOutbox)
          ..where((r) => r.clientReviewId.equals(clientReviewId)))
        .getSingleOrNull();
    if (row == null) return;
    await (_db.update(_db.reviewOutbox)
          ..where((r) => r.clientReviewId.equals(clientReviewId)))
        .write(ReviewOutboxCompanion(
      attempts: Value(row.attempts + 1),
      lastAttemptAt: Value(DateTime.now()),
    ));
  }

  // ── Card States ──

  /// Состояние FSRS для карточки + направление.
  Future<CardStateRow?> getCardState(String cardId, String direction) {
    return (_db.select(_db.cardStates)
          ..where((s) =>
              s.cardId.equals(cardId) & s.direction.equals(direction)))
        .getSingleOrNull();
  }

  /// Все состояния для набора.
  Future<List<CardStateRow>> getSetStates(String setId) async {
    final cardIds = await (_db.selectOnly(_db.cards, distinct: true)
          ..addColumns([_db.cards.id])
          ..where(_db.cards.setId.equals(setId)))
        .map((row) => row.read(_db.cards.id)!)
        .get();

    if (cardIds.isEmpty) return [];
    return (_db.select(_db.cardStates)
          ..where((s) => s.cardId.isIn(cardIds)))
        .get();
  }

  /// Обновить или создать состояние карточки.
  Future<void> upsertCardState(CardStatesCompanion entry) {
    return _db.cardStates.insertOnConflictUpdate(entry);
  }

  /// Массовое обновление состояний после синхронизации с сервером.
  Future<void> upsertCardStates(List<CardStatesCompanion> entries) async {
    await _db.transaction(() async {
      for (final e in entries) {
        await _db.cardStates.insertOnConflictUpdate(e);
      }
    });
  }
}
