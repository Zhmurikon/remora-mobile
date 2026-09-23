import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/course_repository.dart';

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
}
