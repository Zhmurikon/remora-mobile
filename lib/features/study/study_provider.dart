import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/log.dart';
import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../../data/network_errors.dart';
import '../../data/repositories/outbox_service.dart';
import '../../data/repositories/study_repository.dart';
import '../dashboard/dashboard_provider.dart';

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
    this.learnQuestionTypes = const ['choice', 'recall'],
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

  QueueItem? get currentItem => index < items.length ? items[index] : null;

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
  StudySessionNotifier(
    this._api,
    this._outbox,
    this._study, [
    this._onProgressSynced,
  ]) : super(
         StudySessionState(
           mode: StudyMode.flashcards,
           items: [],
           index: 0,
           total: 0,
           answered: 0,
           correct: 0,
           pending: 0,
           isOnline: true,
           isLoading: true,
         ),
       );

  final RemoraApiClient _api;
  final OutboxService _outbox;
  final StudyRepository _study;
  final void Function()? _onProgressSynced;

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
      items: [],
      total: 0,
      answered: 0,
      correct: 0,
    );

    try {
      // «Карточки» — свободный просмотр всего набора, поэтому дневные квоты
      // планировщика не должны оставлять этот режим с пустой очередью.
      final scope = mode == StudyMode.flashcards ? 'all' : 'due';
      final queue = await _api.getStudyQueue(
        setId: setId,
        mode: mode.name,
        scope: scope,
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
      if (queue.items.isEmpty) {
        state = state.copyWith(error: _emptyQueueMessage(mode));
      }
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
        logRemora(
          'study',
          local == null
              ? 'офлайн: набор не скачан'
              : 'офлайн: на сегодня пусто',
        );
      }
    }
  }

  Future<void> beginCourse(String courseId, StudyMode mode) async {
    state = state.copyWith(
      mode: mode,
      items: [],
      index: 0,
      total: 0,
      answered: 0,
      correct: 0,
      isLoading: true,
      isFinished: false,
    );
    try {
      StudyQueue? queue;
      List<QueueItem> items;
      var online = true;
      try {
        queue = await _api.getCourseStudyQueue(courseId);
        items = await _allCourseItems(queue);
        try {
          await _study.saveStudySettings('course/$courseId', queue);
          await _study.persistQueueStates(items);
        } catch (_) {
          // Сбой обновления офлайн-кэша не должен прерывать готовую тренировку.
        }
      } catch (error) {
        if (!isNetworkFailure(error)) rethrow;
        online = false;
        queue = await _study.offlineCourseQueue(courseId);
        if (queue == null) {
          state = state.copyWith(
            isLoading: false,
            isOnline: false,
            error:
                'Чтобы учиться без интернета, сначала скачайте курс целиком.',
          );
          return;
        }
        items = queue.items;
      }
      if (!mounted) return;
      _outbox.sessionId = null;
      final shuffled = {
        for (final item in items) item.card.id: item,
      }.values.toList()..shuffle();
      _applyQueue(queue, isOnline: online, items: shuffled);
      if (shuffled.isEmpty) {
        state = state.copyWith(error: 'В материалах курса пока нет карточек.');
      }
      unawaited(_refreshPendingCount());
    } catch (_) {
      if (mounted) {
        state = state.copyWith(
          isLoading: false,
          error:
              'Не удалось загрузить все карточки курса. Проверьте доступ к курсу и попробуйте ещё раз.',
        );
      }
    }
  }

  Future<List<QueueItem>> _allCourseItems(StudyQueue queue) async {
    if (queue.items.length >= queue.newTotal + queue.dueTotal) {
      return queue.items;
    }
    // API чередует материалы. В курсе до 100 статей, поэтому первая порция
    // из 200 карточек содержит каждый непустой набор.
    final setIds = queue.items
        .map((item) => item.sourceSetId!)
        .toSet()
        .toList();
    final items = <QueueItem>[];
    // Не посылаем сотню запросов одновременно на больших курсах.
    for (var i = 0; i < setIds.length; i += 4) {
      final parts = await Future.wait(
        setIds.skip(i).take(4).map(_fullCourseSet),
      );
      items.addAll(parts.expand((part) => part));
    }
    return items;
  }

  Future<List<QueueItem>> _fullCourseSet(String setId) async {
    final part = await _api.getStudyQueue(
      setId: setId,
      mode: 'flashcards',
      scope: 'all',
      limit: 200,
    );
    final total = part.newTotal + part.dueTotal;
    if (part.items.length >= total) {
      return part.items;
    }
    // Полная карточка материала приходит без лимита учебной очереди.
    await _study.downloadFullSet(_api, setId);
    final all = await _study.fullSetItems(setId);
    final byId = {for (final item in all ?? <QueueItem>[]) item.card.id: item};
    if (byId.length != total ||
        !part.items.every((item) => byId.containsKey(item.card.id))) {
      throw StateError('Состав материала изменился');
    }
    for (final item in part.items) {
      byId[item.card.id] = item;
    }
    return byId.values.toList();
  }

  String _emptyQueueMessage(StudyMode mode) {
    if (mode == StudyMode.write) {
      return 'На сегодня всё повторено. Откройте «Карточки», '
          'чтобы повторить весь набор.';
    }
    return 'В этом наборе нет доступных карточек.';
  }

  /// Применить очередь (онлайн или офлайн) к состоянию сессии.
  void _applyQueue(
    StudyQueue queue, {
    required bool isOnline,
    List<QueueItem>? items,
  }) {
    state = state.copyWith(
      items: items ?? queue.items,
      total: (items ?? queue.items).length,
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
    await _outbox.enqueue(
      ReviewOutboxCompanion(
        clientReviewId: Value(clientReviewId),
        cardId: Value(item.card.id),
        direction: Value(item.direction),
        mode: Value(state.mode.name),
        rating: Value(rating),
        answerCorrect: Value(answerCorrect),
        durationMs: Value(durationMs),
        reviewedAt: Value(now),
      ),
    );

    // Продвигаем локальное состояние FSRS — для следующих офлайн-сессий.
    // Не блокируем UI: онлайн сервер всё равно перезапишет due/stability
    // через outbox, а локальный шаг learning сохранится.
    unawaited(
      _study.applyLocalReview(
        cardId: item.card.id,
        direction: item.direction,
        rating: rating,
        reviewedAt: now,
      ),
    );

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

    // Экран результатов читает серверную статистику сразу после завершения.
    // Поэтому последний ответ должен дождаться текущего flush, включая уже
    // запущенную автоотправку, иначе прогресс и XP на экране будут устаревшими.
    if (state.index >= state.items.length) {
      await _outbox.flush();
      final pending = await _outbox.pendingCount();
      if (!mounted) return;
      state = state.copyWith(pending: pending, isFinished: true);
      if (pending == 0) _onProgressSynced?.call();
    } else {
      unawaited(_refreshPendingCount());
    }
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
    final pending = await _outbox.pendingCount();
    if (!mounted) return;
    state = state.copyWith(pending: pending, isFinished: true);
    if (pending == 0) _onProgressSynced?.call();
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
        () => ref.invalidate(dashboardProvider),
      );
    });
