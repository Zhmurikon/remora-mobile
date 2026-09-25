import 'dart:convert';

import 'package:drift/drift.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';

/// Репозиторий наборов: синхронизация API ↔ локальная БД.
class SetRepository {
  SetRepository(this._db, this._api);

  final AppDatabase _db;
  final RemoraApiClient _api;

  /// Все скачанные наборы из локальной БД.
  Future<List<SetRecord>> getDownloadedSets() {
    return _db.sets.select().get();
  }

  /// ID наборов, у которых карточки реально скачаны (не только метаданные).
  Future<Set<String>> getDownloadedSetIds() async {
    final rows = await (_db.select(
      _db.syncMeta,
    )..where((s) => s.entityType.equals('set'))).get();
    return rows.map((r) => r.entityId).toSet();
  }

  /// Скачанные наборы, для которых сервер уже сообщил более свежую версию.
  ///
  /// `revision` фиксируется только после полной загрузки карточек. Поэтому
  /// обновление метаданных списка не маскирует устаревшее офлайн-содержимое.
  Future<Set<String>> getOutdatedDownloadedSetIds() async {
    final downloaded = await (_db.select(
      _db.syncMeta,
    )..where((meta) => meta.entityType.equals('set'))).get();
    final setsById = {
      for (final set in await _db.sets.select().get()) set.id: set,
    };
    return {
      for (final meta in downloaded)
        if (setsById[meta.entityId] case final set?)
          if (meta.revision != _contentRevision(set.updatedAt)) meta.entityId,
    };
  }

  /// Синхронизирует список наборов пользователя из API в БД.
  Future<List<SetRecord>> syncMySets() async {
    final summaries = await _api.getMySets();
    final now = DateTime.now();

    for (final s in summaries) {
      await _db.sets.insertOnConflictUpdate(
        SetsCompanion(
          id: Value(s.id),
          title: Value(s.title),
          description: Value(s.description),
          visibility: Value(s.visibility),
          slug: Value(s.slug),
          cardsCount: Value(s.cardsCount),
          folderId: Value(s.folderId),
          createdAt: Value(s.createdAt),
          updatedAt: Value(s.updatedAt),
          // langTerm/langDefinition берутся из SetDetail при скачивании
        ),
      );
    }

    await _db.syncMeta.insertOnConflictUpdate(
      SyncMetaCompanion(
        entityType: const Value('sets_list'),
        entityId: const Value('me'),
        lastSyncedAt: Value(now),
      ),
    );

    return getDownloadedSets();
  }

  /// Скачивает набор с карточками и состояниями FSRS из API, сохраняет в БД.
  Future<SetDetail> downloadSet(String setId) async {
    final detail = await _api.getSetDetail(setId);
    final now = DateTime.now();

    await _db.transaction(() async {
      await _db.sets.insertOnConflictUpdate(
        SetsCompanion(
          id: Value(detail.id),
          title: Value(detail.title),
          description: Value(detail.description),
          visibility: Value(detail.visibility),
          slug: Value(detail.slug),
          cardsCount: Value(detail.cardsCount),
          langTerm: Value(detail.langTerm),
          langDefinition: Value(detail.langDefinition),
          folderId: Value(detail.folderId),
          createdAt: Value(detail.createdAt),
          updatedAt: Value(detail.updatedAt),
        ),
      );

      final currentIds =
          (await (_db.select(
                _db.cards,
              )..where((card) => card.setId.equals(setId))).get())
              .map((card) => card.id)
              .toSet();
      final incomingIds = detail.cards.map((card) => card.id).toSet();
      final removedIds = currentIds.difference(incomingIds).toList();

      // Состояния неизменившихся карточек сохраняют учебный прогресс. Для
      // удалённых карточек сначала убираем состояния, чтобы не нарушить FK.
      if (removedIds.isNotEmpty) {
        await (_db.delete(
          _db.cardStates,
        )..where((state) => state.cardId.isIn(removedIds))).go();
        await (_db.delete(
          _db.cards,
        )..where((card) => card.id.isIn(removedIds))).go();
      }

      for (final card in detail.cards) {
        await _db.cards.insertOnConflictUpdate(
          CardsCompanion(
            id: Value(card.id),
            setId: Value(setId),
            position: Value(card.position),
            term: Value(card.term),
            definition: Value(card.definition),
            termTranscription: Value(card.termTranscription),
            definitionTranscription: Value(card.definitionTranscription),
            hint: Value(card.hint),
            contentType: Value(card.contentType),
            codeLanguage: Value(card.codeLanguage),
            altAnswers: Value(jsonEncode(card.altAnswers)),
            wrongTermAnswers: Value(jsonEncode(card.wrongTermAnswers)),
            wrongDefinitionAnswers: Value(
              jsonEncode(card.wrongDefinitionAnswers),
            ),
            termImageUrl: Value(card.termImageUrl),
            definitionImageUrl: Value(card.definitionImageUrl),
          ),
        );
      }

      await _db.syncMeta.insertOnConflictUpdate(
        SyncMetaCompanion(
          entityType: const Value('set'),
          entityId: Value(setId),
          lastSyncedAt: Value(now),
          revision: Value(_contentRevision(detail.updatedAt)),
        ),
      );
    });

    return detail;
  }

  /// Карточки набора из локальной БД.
  Future<List<Card>> getCards(String setId) {
    return (_db.select(_db.cards)
          ..where((c) => c.setId.equals(setId))
          ..orderBy([(c) => OrderingTerm.asc(c.position)]))
        .get();
  }
}

String _contentRevision(DateTime value) =>
    (value.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond).toString();
