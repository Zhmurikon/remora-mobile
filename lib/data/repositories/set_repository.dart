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

  /// Синхронизирует список наборов пользователя из API в БД.
  Future<List<SetRecord>> syncMySets() async {
    final summaries = await _api.getMySets();
    final now = DateTime.now();

    for (final s in summaries) {
      await _db.sets.insertOnConflictUpdate(SetsCompanion(
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
      ));
    }

    await _db.syncMeta.insertOnConflictUpdate(SyncMetaCompanion(
      entityType: const Value('sets_list'),
      entityId: const Value('me'),
      lastSyncedAt: Value(now),
    ));

    return getDownloadedSets();
  }

  /// Скачивает набор с карточками и состояниями FSRS из API, сохраняет в БД.
  Future<SetDetail> downloadSet(String setId) async {
    final detail = await _api.getSetDetail(setId);
    final now = DateTime.now();

    // Обновляем метаданные набора
    await _db.sets.insertOnConflictUpdate(SetsCompanion(
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
    ));

    // Удаляем старые карточки набора и вставляем новые
    await (_db.delete(_db.cards)..where((c) => c.setId.equals(setId))).go();

    for (final card in detail.cards) {
      await _db.cards.insertOnConflictUpdate(CardsCompanion(
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
        wrongDefinitionAnswers: Value(jsonEncode(card.wrongDefinitionAnswers)),
        termImageUrl: Value(card.termImageUrl),
        definitionImageUrl: Value(card.definitionImageUrl),
      ));
    }

    // Помечаем как синхронизированный
    await _db.syncMeta.insertOnConflictUpdate(SyncMetaCompanion(
      entityType: const Value('set'),
      entityId: Value(setId),
      lastSyncedAt: Value(now),
    ));

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
