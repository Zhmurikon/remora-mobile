import 'dart:convert';
import 'dart:math' as math;

import 'package:drift/drift.dart';

import '../../core/domain.dart';
import '../../core/fsrs.dart';
import '../api_client.dart';
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

  // ── Офлайн-очередь ──
  //
  // Когда сети нет, очередь строится локально из Drift + Dart-порт FSRS.
  // Порядок и scope зеркалят серверный `StudyService.get_queue` (scope=due —
  // значение по умолчанию клиента). Онлайн-порядок сервер всё равно тасует
  // (`shuffle=True`), поэтому точное совпадение порядка не требуется —
  // важны состав очереди, состояния и интервалы на кнопках.

  static const _settingsEntity = 'study_settings';

  /// Карточки набора из локальной БД, по порядку позиции.
  Future<List<Card>> _cards(String setId) {
    return (_db.select(_db.cards)
          ..where((c) => c.setId.equals(setId))
          ..orderBy([(c) => OrderingTerm.asc(c.position)]))
        .get();
  }

  /// Строит очередь обучения из скачанного набора без обращения к сети.
  ///
  /// Возвращает `null`, если набор не скачан (карточек в БД нет) — вызывающий
  /// код отличает «нечего учить офлайн» от «на сегодня пусто».
  Future<StudyQueue?> buildOfflineQueue(
    String setId, {
    required String mode,
    String direction = 'term_to_def',
    int limit = 60,
  }) async {
    final cards = await _cards(setId);
    if (cards.isEmpty) return null;

    final setRow = await (_db.select(_db.sets)
          ..where((s) => s.id.equals(setId)))
        .getSingleOrNull();
    final settings = await _readStudySettings(setId);
    final states = <String, CardStateRow>{
      for (final s in await getSetStates(setId)) '${s.cardId}|${s.direction}': s,
    };
    final now = DateTime.now().toUtc();
    final directions = direction == 'both'
        ? const ['term_to_def', 'def_to_term']
        : <String>[direction];

    final due = <_OfflineEntry>[];
    final fresh = <_OfflineEntry>[];
    // Направление снаружи, карточки внутри — как на сервере.
    for (final dir in directions) {
      for (final card in cards) {
        final row = states['${card.id}|$dir'];
        final fsrs = row != null ? _fsrsFromRow(row) : initialState(now);
        final isNew = fsrs.state == cardStateNew;
        // scope=due: новая карточка или срок уже наступил.
        if (!isNew && fsrs.dueAt.isAfter(now)) continue;
        (isNew ? fresh : due).add(_OfflineEntry(card, dir, fsrs));
      }
    }

    final selected = _interleaveOffline(due, fresh).take(limit).toList();
    final items = [
      for (final e in selected)
        QueueItem(
          card: _queueCardFromRow(e.card),
          direction: e.direction,
          state: _stateData(e.card.id, e.direction, e.fsrs),
          previews: [
            for (final p in previewIntervals(e.fsrs, now))
              RatingPreview(rating: p.rating, intervalSeconds: p.intervalSeconds),
          ],
        ),
    ];

    return StudyQueue(
      setId: setId,
      setTitle: setRow?.title ?? 'Набор',
      langTerm: setRow?.langTerm ?? 'ru',
      langDefinition: setRow?.langDefinition ?? 'ru',
      answerStrictness: settings.answerStrictness,
      learnQuestionTypes: settings.learnQuestionTypes,
      learnSuccessesRequired: settings.learnSuccessesRequired,
      learnTypingCheck: settings.learnTypingCheck,
      learnMatchPercent: settings.learnMatchPercent,
      mode: mode,
      schedulerVersion: schedulerVersion,
      items: items,
      dueTotal: due.length,
      newTotal: fresh.length,
      // Офлайн дневные лимиты не применяем: обучение резать нельзя
      // (docs/04-limits.md, раздел 3). Сервер догонит счётчики при синхронизации.
      newLeftToday: fresh.length,
      reviewsLeftToday: due.length,
    );
  }

  /// Сохраняет содержимое карточек из онлайн-очереди — чтобы набор потом
  /// открывался офлайн даже без явного скачивания. Upsert не удаляет уже
  /// скачанные карточки, поэтому покрытие только растёт.
  Future<void> cacheQueueCards(String setId, List<QueueItem> items) async {
    if (items.isEmpty) return;
    await _db.transaction(() async {
      for (final it in items) {
        final c = it.card;
        await _db.cards.insertOnConflictUpdate(CardsCompanion(
          id: Value(c.id),
          setId: Value(setId),
          position: Value(c.position),
          term: Value(c.term),
          definition: Value(c.definition),
          termTranscription: Value(c.termTranscription),
          definitionTranscription: Value(c.definitionTranscription),
          hint: Value(c.hint),
          contentType: Value(c.contentType),
          codeLanguage: Value(c.codeLanguage),
          altAnswers: Value(jsonEncode(c.altAnswers)),
          wrongTermAnswers: Value(jsonEncode(c.wrongTermAnswers)),
          wrongDefinitionAnswers: Value(jsonEncode(c.wrongDefinitionAnswers)),
          termImageUrl: Value(c.termImageUrl),
          definitionImageUrl: Value(c.definitionImageUrl),
        ));
      }
    });
  }

  /// Кэширует состояния FSRS из онлайн-очереди (сервер — источник правды).
  /// `step` не трогаем: сервер его не присылает, а локальный шаг learning
  /// нужен офлайн-планировщику.
  Future<void> persistQueueStates(List<QueueItem> items) async {
    if (items.isEmpty) return;
    await upsertCardStates([
      for (final it in items)
        CardStatesCompanion(
          cardId: Value(it.state.cardId),
          direction: Value(it.state.direction),
          state: Value(it.state.state),
          stability: Value(it.state.stability),
          difficulty: Value(it.state.difficulty),
          dueAt: Value(it.state.dueAt),
          lastReviewedAt: Value(it.state.lastReviewedAt),
        ),
    ]);
  }

  /// Продвигает локальное состояние FSRS после ответа — чтобы следующая
  /// офлайн-сессия увидела новый срок. Онлайн сервер пересчитает и перезапишет
  /// stability/due через outbox; локальный `step` при этом сохраняется.
  Future<void> applyLocalReview({
    required String cardId,
    required String direction,
    required int rating,
    required DateTime reviewedAt,
  }) async {
    final moment = reviewedAt.toUtc();
    final row = await getCardState(cardId, direction);
    final before = row != null ? _fsrsFromRow(row) : initialState(moment);
    final after = review(before, rating, moment);
    await upsertCardState(CardStatesCompanion(
      cardId: Value(cardId),
      direction: Value(direction),
      state: Value(after.state),
      stability: Value(after.stability),
      difficulty: Value(after.difficulty),
      step: Value(after.step),
      dueAt: Value(after.dueAt),
      lastReviewedAt: Value(after.lastReviewedAt),
    ));
  }

  /// Кэширует настройки проверки/заучивания набора (строгость, режим learn)
  /// в SyncMeta — офлайн-очередь берёт их оттуда, а не из дефолтов.
  Future<void> saveStudySettings(String setId, StudyQueue q) async {
    await _db.syncMeta.insertOnConflictUpdate(SyncMetaCompanion(
      entityType: const Value(_settingsEntity),
      entityId: Value(setId),
      lastSyncedAt: Value(DateTime.now()),
      revision: Value(jsonEncode({
        'answer_strictness': q.answerStrictness,
        'learn_question_types': q.learnQuestionTypes,
        'learn_successes_required': q.learnSuccessesRequired,
        'learn_typing_check': q.learnTypingCheck,
        'learn_match_percent': q.learnMatchPercent,
      })),
    ));
  }

  Future<_StudySettings> _readStudySettings(String setId) async {
    final row = await (_db.select(_db.syncMeta)
          ..where((m) =>
              m.entityType.equals(_settingsEntity) & m.entityId.equals(setId)))
        .getSingleOrNull();
    final raw = row?.revision;
    if (raw == null) return const _StudySettings.defaults();
    try {
      final j = jsonDecode(raw) as Map<String, dynamic>;
      return _StudySettings(
        answerStrictness: j['answer_strictness'] as String? ?? 'moderate',
        learnQuestionTypes:
            (j['learn_question_types'] as List?)?.map((e) => e.toString()).toList() ??
                const ['choice', 'typing', 'recall'],
        learnSuccessesRequired: j['learn_successes_required'] as int? ?? 1,
        learnTypingCheck: j['learn_typing_check'] as String? ?? 'automatic',
        learnMatchPercent: j['learn_match_percent'] as int? ?? 90,
      );
    } catch (_) {
      return const _StudySettings.defaults();
    }
  }

  FsrsState _fsrsFromRow(CardStateRow r) => FsrsState(
        state: r.state,
        stability: r.stability,
        difficulty: r.difficulty,
        step: r.step,
        dueAt: r.dueAt.toUtc(),
        lastReviewedAt: r.lastReviewedAt?.toUtc(),
      );

  CardStateData _stateData(String cardId, String direction, FsrsState f) =>
      CardStateData(
        cardId: cardId,
        direction: direction,
        state: f.state,
        stability: f.stability,
        difficulty: f.difficulty,
        dueAt: f.dueAt,
        lastReviewedAt: f.lastReviewedAt,
      );

  // ── Настройки заучивания офлайн ──
  //
  // Экран настроек читает и пишет напрямую через API; если сети нет, PUT/DELETE
  // откладываются сюда и досылаются при восстановлении связи (см. OutboxService).
  // Локальный кэш (`saveStudySettings`) обновляется сразу же, чтобы следующая
  // офлайн-сессия заучивания уже видела изменение, не дожидаясь синхронизации.

  /// Действующие для набора настройки заучивания из локального кэша —
  /// то же, чем пользуется офлайн-очередь. Годится для показа в настройках,
  /// когда сети нет.
  Future<
      ({
        List<String> questionTypes,
        int successesRequired,
        String typingCheck,
        int matchPercent,
      })> getCachedLearnSettings(String setId) async {
    final s = await _readStudySettings(setId);
    return (
      questionTypes: s.learnQuestionTypes,
      successesRequired: s.learnSuccessesRequired,
      typingCheck: s.learnTypingCheck,
      matchPercent: s.learnMatchPercent,
    );
  }

  /// Несинхронизированное изменение настроек для набора, если есть.
  Future<PendingLearnSettingsRow?> getPendingLearnSettings(String setId) {
    return (_db.select(_db.pendingLearnSettings)
          ..where((t) => t.setId.equals(setId)))
        .getSingleOrNull();
  }

  /// Все несинхронизированные изменения настроек — для отправки при
  /// восстановлении связи.
  Future<List<PendingLearnSettingsRow>> getAllPendingLearnSettings() {
    return _db.select(_db.pendingLearnSettings).get();
  }

  Future<void> clearPendingLearnSettings(String setId) async {
    await (_db.delete(_db.pendingLearnSettings)
          ..where((t) => t.setId.equals(setId)))
        .go();
  }

  /// Отложить изменение настроек набора и сразу применить его к локальному
  /// кэшу — офлайн-очередь заучивания подхватит новые значения немедленно.
  Future<void> stagePendingLearnSettingsUpdate(
    String setId,
    List<String> questionTypes,
    int successesRequired,
    String typingCheck,
    int matchPercent,
  ) async {
    await _db.pendingLearnSettings.insertOnConflictUpdate(
      PendingLearnSettingsCompanion(
        setId: Value(setId),
        action: const Value('update'),
        questionTypes: Value(jsonEncode(questionTypes)),
        successesRequired: Value(successesRequired),
        typingCheck: Value(typingCheck),
        matchPercent: Value(matchPercent),
        updatedAt: Value(DateTime.now()),
      ),
    );

    final current = await _readStudySettings(setId);
    await _db.syncMeta.insertOnConflictUpdate(SyncMetaCompanion(
      entityType: const Value(_settingsEntity),
      entityId: Value(setId),
      lastSyncedAt: Value(DateTime.now()),
      revision: Value(jsonEncode({
        'answer_strictness': current.answerStrictness,
        'learn_question_types': questionTypes,
        'learn_successes_required': successesRequired,
        'learn_typing_check': typingCheck,
        'learn_match_percent': matchPercent,
      })),
    ));
  }

  /// Отложить возврат к общим настройкам. Какими будут общие значения,
  /// офлайн неизвестно — локальный кэш не трогаем, он обновится при
  /// следующей успешной синхронизации очереди.
  Future<void> stagePendingLearnSettingsReset(String setId) async {
    await _db.pendingLearnSettings.insertOnConflictUpdate(
      PendingLearnSettingsCompanion(
        setId: Value(setId),
        action: const Value('reset'),
        questionTypes: const Value(null),
        successesRequired: const Value(null),
        typingCheck: const Value(null),
        matchPercent: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  QueueCard _queueCardFromRow(Card c) => QueueCard(
        id: c.id,
        position: c.position,
        term: c.term,
        definition: c.definition,
        termTranscription: c.termTranscription,
        definitionTranscription: c.definitionTranscription,
        hint: c.hint,
        contentType: c.contentType,
        codeLanguage: c.codeLanguage,
        termImageUrl: c.termImageUrl,
        definitionImageUrl: c.definitionImageUrl,
        altAnswers: _decodeStringList(c.altAnswers),
        wrongTermAnswers: _decodeStringList(c.wrongTermAnswers),
        wrongDefinitionAnswers: _decodeStringList(c.wrongDefinitionAnswers),
      );
}

/// Одна запись очереди: карточка, направление и её состояние FSRS.
class _OfflineEntry {
  _OfflineEntry(this.card, this.direction, this.fsrs);

  final Card card;
  final String direction;
  final FsrsState fsrs;
}

/// Настройки проверки/заучивания набора для офлайн-очереди.
class _StudySettings {
  const _StudySettings({
    required this.answerStrictness,
    required this.learnQuestionTypes,
    required this.learnSuccessesRequired,
    required this.learnTypingCheck,
    required this.learnMatchPercent,
  });

  const _StudySettings.defaults()
      : answerStrictness = 'moderate',
        learnQuestionTypes = const ['choice', 'typing', 'recall'],
        learnSuccessesRequired = 1,
        learnTypingCheck = 'automatic',
        learnMatchPercent = 90;

  final String answerStrictness;
  final List<String> learnQuestionTypes;
  final int learnSuccessesRequired;
  final String learnTypingCheck;
  final int learnMatchPercent;
}

List<String> _decodeStringList(String raw) {
  try {
    final v = jsonDecode(raw);
    return v is List ? v.map((e) => e.toString()).toList() : const [];
  } catch (_) {
    return const [];
  }
}

/// Раскладывает новые карточки равномерно по просроченным — порт серверного
/// `_interleave` (ветка без перемешивания) и `_separate_neighbours`.
List<_OfflineEntry> _interleaveOffline(
  List<_OfflineEntry> due,
  List<_OfflineEntry> fresh,
) {
  if (fresh.isEmpty || due.isEmpty) {
    return _separateNeighbours([...due, ...fresh]);
  }
  final total = due.length + fresh.length;
  final step = total / fresh.length;
  final slots = <int>{
    for (var index = 0; index < fresh.length; index++)
      math.min(total - 1, (step * index + step / 2).floor()),
  };
  var di = 0;
  var fi = 0;
  final merged = <_OfflineEntry>[];
  for (var index = 0; index < total; index++) {
    _OfflineEntry? item;
    if (slots.contains(index)) {
      item = fi < fresh.length ? fresh[fi++] : (di < due.length ? due[di++] : null);
    } else {
      item = di < due.length ? due[di++] : (fi < fresh.length ? fresh[fi++] : null);
    }
    if (item == null) break;
    merged.add(item);
  }
  return _separateNeighbours(merged);
}

/// Разводит две стороны одной карточки: рядом они работают как подсказка.
List<_OfflineEntry> _separateNeighbours(List<_OfflineEntry> items) {
  final remaining = [...items];
  final ordered = <_OfflineEntry>[];
  while (remaining.isNotEmpty) {
    var index = 0;
    for (var c = 0; c < remaining.length; c++) {
      if (ordered.isEmpty || remaining[c].card.id != ordered.last.card.id) {
        index = c;
        break;
      }
    }
    ordered.add(remaining.removeAt(index));
  }
  return ordered;
}
