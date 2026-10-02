import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/course_repository.dart';

class _CourseApiClient extends RemoraApiClient {
  _CourseApiClient(this.courses, [this.saved = const []]) : super(Dio());

  final List<CourseSummaryData> courses;
  final List<SavedCourseSummaryData> saved;

  @override
  Future<List<CourseSummaryData>> getMyCourses() async => courses;

  @override
  Future<List<SavedCourseSummaryData>> getSavedCourses() async => saved;
}

/// Офлайн-чтение курсов из локальной БД — DoD M6 «чтение теории офлайн».
/// Методы чтения не трогают сеть, поэтому клиент здесь фиктивный.
void main() {
  late AppDatabase db;
  late CourseRepository repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = CourseRepository(db, RemoraApiClient(Dio()));
  });

  tearDown(() async {
    await db.close();
  });

  Future<void> seedCourse() async {
    await db.courses.insertOnConflictUpdate(
      CoursesCompanion(
        id: const Value('c1'),
        slug: const Value('bio'),
        title: const Value('Биология'),
        description: const Value('Клетки и ткани'),
        authorName: const Value('Иван Автор'),
        isPublished: const Value(true),
        updatedAt: Value(DateTime(2026, 1, 1)),
      ),
    );
    // Разделы вставлены в обратном порядке — проверяем сортировку по position.
    await db.courseSections.insertOnConflictUpdate(
      CourseSectionsCompanion(
        id: const Value('s2'),
        courseId: const Value('c1'),
        title: const Value('Второй раздел'),
        position: const Value(1),
      ),
    );
    await db.courseSections.insertOnConflictUpdate(
      CourseSectionsCompanion(
        id: const Value('s1'),
        courseId: const Value('c1'),
        title: const Value('Первый раздел'),
        position: const Value(0),
      ),
    );
    await db.courseArticles.insertOnConflictUpdate(
      CourseArticlesCompanion(
        id: const Value('a2'),
        sectionId: const Value('s1'),
        courseId: const Value('c1'),
        setId: const Value('set-a2'),
        title: const Value('Статья 2'),
        body: const Value('Тело 2'),
        position: const Value(1),
      ),
    );
    await db.courseArticles.insertOnConflictUpdate(
      CourseArticlesCompanion(
        id: const Value('a1'),
        sectionId: const Value('s1'),
        courseId: const Value('c1'),
        setId: const Value('set-a1'),
        title: const Value('Статья 1'),
        body: const Value('# Теория\n\nТекст статьи.'),
        position: const Value(0),
        mediaJson: const Value('[{"id":"m1","url":"https://cdn/x.png"}]'),
      ),
    );
  }

  test('getCourse читает метаданные и автора', () async {
    await seedCourse();
    final course = await repo.getCourse('c1');
    expect(course, isNotNull);
    expect(course!.title, 'Биология');
    expect(course.authorName, 'Иван Автор');
    expect(course.isPublished, true);
  });

  test('getSections возвращает разделы по позиции', () async {
    await seedCourse();
    final sections = await repo.getSections('c1');
    expect(sections.map((s) => s.id).toList(), ['s1', 's2']);
  });

  test('getArticles возвращает статьи по позиции с ссылкой на набор', () async {
    await seedCourse();
    final articles = await repo.getArticles('c1');
    expect(articles.map((a) => a.id).toList(), ['a1', 'a2']);
    expect(articles.first.setId, 'set-a1');
  });

  test('getArticle читает тело теории и media-карту', () async {
    await seedCourse();
    final article = await repo.getArticle('a1');
    expect(article, isNotNull);
    expect(article!.body, contains('Теория'));
    expect(article.mediaJson, contains('m1'));
  });

  test('getArticle возвращает null для отсутствующей статьи', () async {
    await seedCourse();
    expect(await repo.getArticle('нет'), isNull);
  });

  test('getDownloadedCourses пуст на чистой БД', () async {
    expect(await repo.getDownloadedCourses(), isEmpty);
  });

  test(
    'syncMyCourses удаляет исчезнувший на сервере курс и его теорию',
    () async {
      await seedCourse();
      await db.syncMeta.insertOnConflictUpdate(
        SyncMetaCompanion(
          entityType: const Value('course'),
          entityId: const Value('c1'),
          lastSyncedAt: Value(DateTime(2026, 1, 1)),
          revision: const Value('1'),
        ),
      );

      final synced = await CourseRepository(
        db,
        _CourseApiClient(const []),
      ).syncMyCourses();

      expect(synced, isEmpty);
      expect(await repo.getCourse('c1'), isNull);
      expect(await repo.getSections('c1'), isEmpty);
      expect(await repo.getArticles('c1'), isEmpty);
      final revision =
          await (db.select(db.syncMeta)..where(
                (meta) =>
                    meta.entityType.equals('course') &
                    meta.entityId.equals('c1'),
              ))
              .getSingleOrNull();
      expect(revision, isNull);
    },
  );

  test('syncMyCourses обновляет существующий и добавляет новый курс', () async {
    await seedCourse();
    final updatedAt = DateTime.utc(2026, 2, 1);
    final synced = await CourseRepository(
      db,
      _CourseApiClient([
        CourseSummaryData(
          id: 'c1',
          slug: 'biology',
          title: 'Новая биология',
          description: 'Обновлённое описание',
          isPublished: true,
          updatedAt: updatedAt,
        ),
        CourseSummaryData(
          id: 'c2',
          slug: 'physics',
          title: 'Физика',
          description: '',
          isPublished: false,
          updatedAt: updatedAt,
        ),
      ]),
    ).syncMyCourses();

    expect(synced.map((course) => course.id).toSet(), {'c1', 'c2'});
    expect((await repo.getCourse('c1'))!.title, 'Новая биология');
    expect((await repo.getCourse('c2'))!.title, 'Физика');
    // Метаданные списка не должны стирать уже скачанную теорию.
    expect(await repo.getSections('c1'), hasLength(2));
  });

  test(
    'syncMyCourses добавляет сохранённый курс и его статус обновления',
    () async {
      final acceptedAt = DateTime.utc(2026, 3, 1);
      final synced = await CourseRepository(
        db,
        _CourseApiClient(const [], [
          SavedCourseSummaryData(
            id: 'saved-1',
            slug: 'saved-course',
            title: 'Сохранённый курс',
            description: 'Описание',
            author: CourseAuthorData(username: 'author'),
            saveId: 'save-1',
            acceptedAt: acceptedAt,
            hasUpdates: true,
          ),
        ]),
      ).syncMyCourses();

      expect(synced, hasLength(1));
      expect(synced.single.isSaved, isTrue);
      expect(synced.single.saveId, 'save-1');
      expect(synced.single.hasUpdates, isTrue);
      expect(synced.single.authorName, 'author');
    },
  );

  test(
    'syncMyCourses не затирает ревизию скачанного сохранённого курса',
    () async {
      final downloadedAt = DateTime.utc(2026, 3, 10);
      await db.courses.insertOne(
        CoursesCompanion.insert(
          id: 'saved-1',
          slug: 'saved-course',
          title: 'Сохранённый курс',
          updatedAt: downloadedAt,
          isSaved: const Value(true),
          saveId: const Value('save-1'),
        ),
      );
      await db.syncMeta.insertOne(
        SyncMetaCompanion.insert(
          entityType: 'course_bundle',
          entityId: 'saved-1',
          lastSyncedAt: downloadedAt,
          revision: Value(
            (downloadedAt.millisecondsSinceEpoch ~/
                    Duration.millisecondsPerSecond)
                .toString(),
          ),
        ),
      );

      await CourseRepository(
        db,
        _CourseApiClient(const [], [
          SavedCourseSummaryData(
            id: 'saved-1',
            slug: 'saved-course',
            title: 'Сохранённый курс',
            author: CourseAuthorData(username: 'author'),
            saveId: 'save-1',
            acceptedAt: DateTime.utc(2026, 2, 1),
            hasUpdates: true,
          ),
        ]),
      ).syncMyCourses();

      expect((await repo.getCourse('saved-1'))!.updatedAt, downloadedAt);
      expect(await repo.getOutdatedDownloadedCourseIds(), isEmpty);
    },
  );
}
