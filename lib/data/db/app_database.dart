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
  TextColumn get contentType =>
      text().withDefault(const Constant('text'))(); // text | code
  TextColumn get codeLanguage => text().nullable()();
  TextColumn get altAnswers =>
      text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get wrongTermAnswers =>
      text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get wrongDefinitionAnswers =>
      text().withDefault(const Constant('[]'))(); // JSON
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

/// Несинхронизированное изменение настроек заучивания набора: сделано офлайн,
/// ждёт отправки на сервер. Одна запись на набор — последнее изменение
/// побеждает, промежуточные состояния синхронизировать не нужно.
@DataClassName('PendingLearnSettingsRow')
class PendingLearnSettings extends Table {
  TextColumn get setId => text()();
  TextColumn get action => text()(); // 'update' | 'reset'
  TextColumn get questionTypes =>
      text().nullable()(); // JSON-массив, для update
  IntColumn get successesRequired => integer().nullable()();
  IntColumn get sessionSize => integer().nullable()();
  TextColumn get typingCheck => text().nullable()();
  IntColumn get matchPercent => integer().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {setId};
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

/// Курс: метаданные и автор. Карточки статей лежат в Sets/Cards, теория — в CourseArticles.
@DataClassName('CourseRecord')
class Courses extends Table {
  TextColumn get id => text()();
  TextColumn get slug => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get authorName => text().withDefault(const Constant(''))();
  BoolColumn get isPublished => boolean().withDefault(const Constant(false))();
  BoolColumn get isSaved => boolean().withDefault(const Constant(false))();
  TextColumn get saveId => text().nullable()();
  BoolColumn get hasUpdates => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Раздел курса. Зеркало серверного CourseSectionPublic.
@DataClassName('CourseSectionRow')
class CourseSections extends Table {
  TextColumn get id => text()();
  TextColumn get courseId => text().references(Courses, #id)();
  TextColumn get title => text()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Статья теории: markdown-тело и ссылка на набор карточек (`setId`).
/// `mediaJson` — карта подписанных ссылок изображений (протокол media:UUID в теле).
@DataClassName('CourseArticleRow')
class CourseArticles extends Table {
  TextColumn get id => text()();
  TextColumn get sectionId => text().references(CourseSections, #id)();
  TextColumn get courseId => text()();
  TextColumn get setId => text()();
  TextColumn get title => text()();
  TextColumn get body => text().withDefault(const Constant(''))();
  IntColumn get position => integer()();
  TextColumn get mediaJson => text().withDefault(
    const Constant('[]'),
  )(); // JSON [{id,url,width,height}]

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Sets,
    Cards,
    CardStates,
    SyncMeta,
    ReviewOutbox,
    Courses,
    CourseSections,
    CourseArticles,
    PendingLearnSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase.forUser(String userId) : super(_openConnection(userId));

  /// Пустая временная БД до определения пользователя. Защищённые экраны
  /// не должны случайно открыть кэш последнего вошедшего аккаунта.
  AppDatabase.anonymous() : super(NativeDatabase.memory());

  /// In-memory БД для тестов.
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // v2 — таблицы теории курсов (M6). Наборы и состояния FSRS не трогаем.
      if (from < 2) {
        await m.createTable(courses);
        await m.createTable(courseSections);
        await m.createTable(courseArticles);
      }
      // v3 — офлайн-очередь изменений настроек заучивания.
      if (from < 3) {
        await m.createTable(pendingLearnSettings);
      }
      if (from < 4) {
        await customStatement(
          'ALTER TABLE pending_learn_settings ADD COLUMN session_size INTEGER',
        );
      }
      if (from < 5) {
        await m.addColumn(courses, courses.isSaved);
        await m.addColumn(courses, courses.saveId);
        await m.addColumn(courses, courses.hasUpdates);
      }
    },
  );
}

LazyDatabase _openConnection(String userId) {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, databaseFileName(userId)));
    final legacy = File(p.join(dir.path, 'remora.sqlite'));
    // До разделения кэша по аккаунтам база была общей. На первом запуске
    // переносим её текущему владельцу сессии, не оставляя общей копии.
    if (!await file.exists() && await legacy.exists()) {
      await legacy.rename(file.path);
    }
    return NativeDatabase.createInBackground(file);
  });
}

String databaseFileName(String userId) {
  final safe = userId.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
  return 'remora-$safe.sqlite';
}
