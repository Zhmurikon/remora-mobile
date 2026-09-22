import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Метаданные набора. Зеркало серверного SetDetail.
@DataClassName('SetRecord')
class Sets extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get visibility => text()(); // private | unlisted | public
  TextColumn get slug => text()();
  IntColumn get cardsCount => integer()();
  TextColumn get langTerm => text().withDefault(const Constant('ru'))();
  TextColumn get langDefinition => text().withDefault(const Constant('ru'))();
  TextColumn get folderId => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Содержимое карточки. Зеркало серверного PublicCard.
class Cards extends Table {
  TextColumn get id => text()();
  TextColumn get setId => text().references(Sets, #id)();
  IntColumn get position => integer()();
  TextColumn get term => text()();
  TextColumn get definition => text()();
  TextColumn get termTranscription => text().nullable()();
  TextColumn get definitionTranscription => text().nullable()();
  TextColumn get hint => text().nullable()();
  TextColumn get contentType => text().withDefault(const Constant('text'))(); // text | code
  TextColumn get codeLanguage => text().nullable()();
  TextColumn get altAnswers => text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get wrongTermAnswers => text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get wrongDefinitionAnswers => text().withDefault(const Constant('[]'))(); // JSON
  TextColumn get termImageUrl => text().nullable()();
  TextColumn get definitionImageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Состояние FSRS по паре (карточка, направление). Зеркало CardStateOut.
@DataClassName('CardStateRow')
class CardStates extends Table {
  TextColumn get cardId => text().references(Cards, #id)();
  TextColumn get direction => text()(); // term_to_def | def_to_term
  TextColumn get state => text()(); // new | learning | review | relearning
  RealColumn get stability => real().nullable()();
  RealColumn get difficulty => real().nullable()();
  IntColumn get step => integer().nullable()();
  DateTimeColumn get dueAt => dateTime()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {cardId, direction};
}

/// Курсоры и ревизии инкрементальной синхронизации.
class SyncMeta extends Table {
  TextColumn get entityType => text()(); // 'sets', 'set:{id}', etc.
  TextColumn get entityId => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();
  TextColumn get revision => text().nullable()();

  @override
  Set<Column> get primaryKey => {entityType, entityId};
}

/// Очередь неотправленных ответов. Никогда не очищается до подтверждения сервером.
class ReviewOutbox extends Table {
  TextColumn get clientReviewId => text()();
  TextColumn get cardId => text()();
  TextColumn get direction => text()();
  TextColumn get mode => text()(); // flashcards | learn | write
  IntColumn get rating => integer()(); // 1-4
  BoolColumn get answerCorrect => boolean().nullable()();
  IntColumn get durationMs => integer().nullable()();
  DateTimeColumn get reviewedAt => dateTime()();
  TextColumn get sessionId => text().nullable()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {clientReviewId};
}

@DriftDatabase(tables: [Sets, Cards, CardStates, SyncMeta, ReviewOutbox])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// In-memory БД для тестов.
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'remora.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
