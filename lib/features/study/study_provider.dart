import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/log.dart';
import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../../data/repositories/outbox_service.dart';
import '../../data/repositories/study_repository.dart';

const _uuid = Uuid();

/// Режим обучения.
enum StudyMode { flashcards, learn, write }

/// Состояние текущей сессии обучения.
class StudySessionState {
  StudySessionState({
    required this.mode,
    required this.items,
    required this.index,
    required this.total,
    required this.answered,
    required this.correct,
    required this.pending,
    required this.isOnline,
    required this.isLoading,
    this.error,
    this.setTitle = '',
    this.langTerm = 'ru',
    this.langDefinition = 'ru',
    this.answerStrictness = 'moderate',
    this.learnQuestionTypes = const ['choice', 'typing', 'recall'],
    this.learnSuccessesRequired = 1,
    this.learnTypingCheck = 'automatic',
    this.learnMatchPercent = 90,
    this.isFinished = false,
  });

  final StudyMode mode;
  final List<QueueItem> items;
  final int index;
  final int total;
  final int answered;
  final int correct;
  final int pending;
  final bool isOnline;
  final bool isLoading;
  final String? error;
  final String setTitle;
  final String langTerm;
  final String langDefinition;
  final String answerStrictness;
  final List<String> learnQuestionTypes;
  final int learnSuccessesRequired;
  final String learnTypingCheck;
  final int learnMatchPercent;
  final bool isFinished;

  double get progress => total > 0 ? answered / total : 0;

  QueueItem? get currentItem =>
      index < items.length ? items[index] : null;

  StudySessionState copyWith({
    StudyMode? mode,
    List<QueueItem>? items,
    int? index,
    int? total,
    int? answered,
    int? correct,
    int? pending,
    bool? isOnline,
    bool? isLoading,
    String? error,
    String? setTitle,
    String? langTerm,
    String? langDefinition,
    String? answerStrictness,
    List<String>? learnQuestionTypes,
    int? learnSuccessesRequired,
    String? learnTypingCheck,
    int? learnMatchPercent,
    bool? isFinished,
  }) {
    return StudySessionState(
      mode: mode ?? this.mode,
      items: items ?? this.items,
      index: index ?? this.index,
      total: total ?? this.total,
      answered: answered ?? this.answered,
      correct: correct ?? this.correct,
      pending: pending ?? this.pending,
      isOnline: isOnline ?? this.isOnline,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      setTitle: setTitle ?? this.setTitle,
      langTerm: langTerm ?? this.langTerm,
      langDefinition: langDefinition ?? this.langDefinition,
      answerStrictness: answerStrictness ?? this.answerStrictness,
      learnQuestionTypes: learnQuestionTypes ?? this.learnQuestionTypes,
      learnSuccessesRequired:
          learnSuccessesRequired ?? this.learnSuccessesRequired,
      learnTypingCheck: learnTypingCheck ?? this.learnTypingCheck,
      learnMatchPercent: learnMatchPercent ?? this.learnMatchPercent,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}

/// Провайдер сессии обучения.
///
/// Загружает очередь из API, управляет продвижением по карточкам,
/// записывает ответы в outbox (Drift → сервер), отслеживает прогресс.
class StudySessionNotifier extends StateNotifier<StudySessionState> {
  StudySessionNotifier(this._api, this._outbox, this._study)
      : super(StudySessionState(
          mode: StudyMode.flashcards,
          items: [],
          index: 0,
          total: 0,
          answered: 0,
          correct: 0,
          pending: 0,
          isOnline: true,
          isLoading: true,
        ));

  final RemoraApiClient _api;
  final OutboxService _outbox;
  final StudyRepository _study;

  /// Загрузить очередь и начать сессию.
  ///
  /// Онлайн — берём очередь с сервера и кэшируем её (карточки, состояния FSRS,
  /// настройки) для будущих офлайн-сессий. Офлайн — строим очередь локально из
  /// Drift + Dart-порт FSRS.
  Future<void> begin(String setId, StudyMode mode) async {
    state = state.copyWith(
      mode: mode,
      isLoading: true,
      isFinished: false,
      error: null,
      index: 0,
      answered: 0,
      correct: 0,
    );

    try {
      final queue = await _api.getStudyQueue(
        setId: setId,
        mode: mode.name,
      );

      _outbox.sessionId = null;

      // Кэшируем набор для офлайна. Не блокируем показ очереди при сбое записи.
      try {
        await _study.cacheQueueCards(setId, queue.items);
        await _study.persistQueueStates(queue.items);
        await _study.saveStudySettings(setId, queue);
      } catch (_) {
        // Кэш — вспомогательный; онлайн-сессия работает и без него.
      }

      _applyQueue(queue, isOnline: true);
      logRemora('study', 'онлайн-очередь: ${queue.items.length} карт.');
      unawaited(_refreshPendingCount());
    } catch (e) {
      // Сеть недоступна — пробуем собрать очередь из скачанного набора.
      StudyQueue? local;
      try {
        local = await _study.buildOfflineQueue(setId, mode: mode.name);
      } catch (_) {
        local = null;
      }
      if (local != null && local.items.isNotEmpty) {
        _outbox.sessionId = null;
        _applyQueue(local, isOnline: false);
        logRemora('study', 'офлайн-очередь: ${local.items.length} карт.');
        unawaited(_refreshPendingCount());
      } else {
        state = state.copyWith(
          isLoading: false,
          isOnline: false,
          error: local == null
              ? 'Набор не скачан для офлайна. Откройте его один раз при сети.'
              : 'На сегодня карточек нет. Продолжите, когда появится сеть.',
        );
        logRemora('study',
            local == null ? 'офлайн: набор не скачан' : 'офлайн: на сегодня пусто');
      }
    }
  }

  /// Применить очередь (онлайн или офлайн) к состоянию сессии.
  void _applyQueue(StudyQueue queue, {required bool isOnline}) {
    state = state.copyWith(
      items: queue.items,
      total: queue.items.length,
      isLoading: false,
      isOnline: isOnline,
      setTitle: queue.setTitle,
      langTerm: queue.langTerm,
      langDefinition: queue.langDefinition,
      answerStrictness: queue.answerStrictness,
      learnQuestionTypes: queue.learnQuestionTypes,
      learnSuccessesRequired: queue.learnSuccessesRequired,
      learnTypingCheck: queue.learnTypingCheck,
      learnMatchPercent: queue.learnMatchPercent,
    );
  }

  /// Записать ответ и продвинуться дальше.
  Future<void> answer({
    required QueueItem item,
    required int rating,
    bool? answerCorrect,
    int? durationMs,
    bool requeue = false,
  }) async {
    final now = DateTime.now();
    final clientReviewId = _uuid.v4();

    // Записываем в outbox (Drift — мгновенно, не теряется при обрыве)
    await _outbox.enqueue(ReviewOutboxCompanion(
      clientReviewId: Value(clientReviewId),
      cardId: Value(item.card.id),
      direction: Value(item.direction),
      mode: Value(state.mode.name),
      rating: Value(rating),
      answerCorrect: Value(answerCorrect),
      durationMs: Value(durationMs),
      reviewedAt: Value(now),
    ));

    // Продвигаем локальное состояние FSRS — для следующих офлайн-сессий.
    // Не блокируем UI: онлайн сервер всё равно перезапишет due/stability
    // через outbox, а локальный шаг learning сохранится.
    unawaited(_study.applyLocalReview(
      cardId: item.card.id,
      direction: item.direction,
      rating: rating,
      reviewedAt: now,
    ));

    final isCorrect = answerCorrect ?? (rating >= 3);

    if (requeue) {
      // Возвращаем карточку в конец очереди (learn mode при ошибке)
      final newItems = [...state.items, item];
      state = state.copyWith(
        items: newItems,
        index: state.index + 1,
        total: newItems.length,
        answered: state.answered + 1,
        correct: state.correct + (isCorrect ? 1 : 0),
      );
    } else {
      state = state.copyWith(
        index: state.index + 1,
        answered: state.answered + 1,
        correct: state.correct + (isCorrect ? 1 : 0),
      );
    }

    // Проверяем, не закончилась ли очередь
    if (state.index >= state.items.length) {
      state = state.copyWith(isFinished: true);
    }

    unawaited(_refreshPendingCount());
  }

  /// Пропустить карточку без записи ответа.
  void skip() {
    if (state.index >= state.items.length) return;
    final newItems = [...state.items, state.items[state.index]];
    state = state.copyWith(
      items: newItems,
      index: state.index + 1,
      total: newItems.length,
    );
  }

  /// Принудительно отправить накопленные ответы.
  Future<void> flushOutbox() async {
    await _outbox.flush();
    await _refreshPendingCount();
  }

  /// Завершить сессию: отправить все ответы.
  Future<void> finish() async {
    await _outbox.flush();
    await _refreshPendingCount();
    state = state.copyWith(isFinished: true);
  }

  Future<void> _refreshPendingCount() async {
    final count = await _outbox.pendingCount();
    if (mounted) {
      state = state.copyWith(pending: count);
    }
  }
}

/// Провайдер сессии — создаётся при старте обучения.
final studySessionProvider =
    StateNotifierProvider<StudySessionNotifier, StudySessionState>((ref) {
  return StudySessionNotifier(
    ref.watch(apiClientProvider),
    ref.watch(outboxServiceProvider),
    ref.watch(studyRepositoryProvider),
  );
});
