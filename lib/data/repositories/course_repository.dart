import 'dart:convert';

import 'package:drift/drift.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';

/// Репозиторий курсов: синхронизация API ↔ локальная БД.
///
/// Чтение теории офлайн-first: экраны читают из Drift, а онлайн-обновление
/// подтягивает структуру и тело статей в фоне. Один `GET /courses/{id}`
/// приносит весь курс сразу (разделы, статьи, медиа), поэтому скачивание —
/// одна транзакция.
class CourseRepository {
  CourseRepository(this._db, this._api);

  final AppDatabase _db;
  final RemoraApiClient _api;

  /// Скачанные курсы из локальной БД (для экрана списка).
  Future<List<CourseRecord>> getDownloadedCourses() {
    return (_db.select(
      _db.courses,
    )..orderBy([(c) => OrderingTerm.desc(c.updatedAt)])).get();
  }

  /// Синхронизирует список моих курсов из API в БД (метаданные без структуры).
  Future<List<CourseRecord>> syncMyCourses() async {
    final summaries = await _api.getMyCourses();

    await _db.batch((batch) {
      for (final c in summaries) {
        // Только метаданные: разделы/статьи и автор приходят при скачивании.
        batch.insert(
          _db.courses,
          CoursesCompanion(
            id: Value(c.id),
            slug: Value(c.slug),
            title: Value(c.title),
            description: Value(c.description),
            isPublished: Value(c.isPublished),
            updatedAt: Value(c.updatedAt),
          ),
          onConflict: DoUpdate(
            (_) => CoursesCompanion(
              slug: Value(c.slug),
              title: Value(c.title),
              description: Value(c.description),
              isPublished: Value(c.isPublished),
              updatedAt: Value(c.updatedAt),
            ),
          ),
        );
      }
    });

    await _db.syncMeta.insertOnConflictUpdate(
      SyncMetaCompanion(
        entityType: const Value('courses_list'),
        entityId: const Value('me'),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );

    return getDownloadedCourses();
  }

  /// Скачанные курсы, структура которых старее серверных метаданных.
  Future<Set<String>> getOutdatedDownloadedCourseIds() async {
    final downloaded = await (_db.select(
      _db.syncMeta,
    )..where((meta) => meta.entityType.equals('course'))).get();
    final coursesById = {
      for (final course in await _db.courses.select().get()) course.id: course,
    };
    return {
      for (final meta in downloaded)
        if (coursesById[meta.entityId] case final course?)
          if (meta.revision != _contentRevision(course.updatedAt))
            meta.entityId,
    };
  }

  /// Скачивает полную структуру курса с теорией и сохраняет в БД.
  ///
  /// Разделы и статьи курса заменяются целиком: сервер — источник правды
  /// структуры, а осиротевшие статьи не должны оставаться в кэше.
  Future<CourseDetailData> downloadCourse(String courseId) async {
    final detail = await _api.getCourseDetail(courseId);

    await _db.transaction(() async {
      await _db.courses.insertOnConflictUpdate(
        CoursesCompanion(
          id: Value(detail.id),
          slug: Value(detail.slug),
          title: Value(detail.title),
          description: Value(detail.description),
          authorName: Value(detail.author.name),
          isPublished: Value(detail.isPublished),
          updatedAt: Value(detail.updatedAt),
        ),
      );

      // Полная замена разделов и статей курса.
      await (_db.delete(
        _db.courseArticles,
      )..where((a) => a.courseId.equals(courseId))).go();
      await (_db.delete(
        _db.courseSections,
      )..where((s) => s.courseId.equals(courseId))).go();

      for (final section in detail.sections) {
        await _db.courseSections.insertOnConflictUpdate(
          CourseSectionsCompanion(
            id: Value(section.id),
            courseId: Value(courseId),
            title: Value(section.title),
            position: Value(section.position),
          ),
        );
        for (final article in section.articles) {
          await _db.courseArticles.insertOnConflictUpdate(
            CourseArticlesCompanion(
              id: Value(article.id),
              sectionId: Value(section.id),
              courseId: Value(courseId),
              setId: Value(article.setId),
              title: Value(article.title),
              body: Value(article.body),
              position: Value(article.position),
              mediaJson: Value(
                jsonEncode(article.media.map((m) => m.toJson()).toList()),
              ),
            ),
          );
        }
      }
    });

    await _db.syncMeta.insertOnConflictUpdate(
      SyncMetaCompanion(
        entityType: const Value('course'),
        entityId: Value(courseId),
        lastSyncedAt: Value(DateTime.now()),
        revision: Value(_contentRevision(detail.updatedAt)),
      ),
    );

    return detail;
  }

  /// Скачана ли теория курса (хотя бы один раздел) — для фонового автоскачивания:
  /// новые курсы качаем сразу, уже скачанные не трогаем при каждом старте.
  Future<bool> hasDownloadedContent(String courseId) async {
    final section =
        await (_db.select(_db.courseSections)
              ..where((s) => s.courseId.equals(courseId))
              ..limit(1))
            .getSingleOrNull();
    return section != null;
  }

  /// Курс из локальной БД.
  Future<CourseRecord?> getCourse(String courseId) {
    return (_db.select(
      _db.courses,
    )..where((c) => c.id.equals(courseId))).getSingleOrNull();
  }

  /// Разделы курса по порядку.
  Future<List<CourseSectionRow>> getSections(String courseId) {
    return (_db.select(_db.courseSections)
          ..where((s) => s.courseId.equals(courseId))
          ..orderBy([(s) => OrderingTerm.asc(s.position)]))
        .get();
  }

  /// Статьи курса по порядку (по разделам и позиции).
  Future<List<CourseArticleRow>> getArticles(String courseId) {
    return (_db.select(_db.courseArticles)
          ..where((a) => a.courseId.equals(courseId))
          ..orderBy([(a) => OrderingTerm.asc(a.position)]))
        .get();
  }

  /// Одна статья теории.
  Future<CourseArticleRow?> getArticle(String articleId) {
    return (_db.select(
      _db.courseArticles,
    )..where((a) => a.id.equals(articleId))).getSingleOrNull();
  }
}

String _contentRevision(DateTime value) =>
    (value.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond).toString();
