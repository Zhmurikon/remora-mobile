import 'dart:convert';

import 'package:drift/drift.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../media_cache.dart';
import 'set_repository.dart';

/// Репозиторий курсов: синхронизация API ↔ локальная БД.
///
/// Чтение теории офлайн-first: экраны читают из Drift, а онлайн-обновление
/// подтягивает структуру и тело статей в фоне. Один `GET /courses/{id}`
/// приносит весь курс сразу (разделы, статьи, медиа), поэтому скачивание —
/// одна транзакция.
class CourseRepository {
  CourseRepository(this._db, this._api, [this._mediaCache, this._sets]);

  final AppDatabase _db;
  final RemoraApiClient _api;
  final MediaCache? _mediaCache;
  final SetRepository? _sets;

  /// Скачанные курсы из локальной БД (для экрана списка).
  Future<List<CourseRecord>> getDownloadedCourses() {
    return (_db.select(
      _db.courses,
    )..orderBy([(c) => OrderingTerm.desc(c.updatedAt)])).get();
  }

  /// Синхронизирует список моих курсов из API в БД (метаданные без структуры).
  Future<List<CourseRecord>> syncMyCourses() async {
    // Оба ответа должны успешно прийти до удаления локальных записей: иначе
    // краткий сбой одного endpoint мог бы стереть рабочую офлайн-копию.
    final results = await Future.wait([
      _api.getMyCourses(),
      _api.getSavedCourses(),
    ]);
    final summaries = results[0] as List<CourseSummaryData>;
    final saved = results[1] as List<SavedCourseSummaryData>;
    final serverIds = {
      ...summaries.map((course) => course.id),
      ...saved.map((course) => course.id),
    };

    await _db.transaction(() async {
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
              isSaved: const Value(false),
              saveId: const Value(null),
              hasUpdates: const Value(false),
              updatedAt: Value(c.updatedAt),
            ),
            onConflict: DoUpdate(
              (_) => CoursesCompanion(
                slug: Value(c.slug),
                title: Value(c.title),
                description: Value(c.description),
                isPublished: Value(c.isPublished),
                isSaved: const Value(false),
                saveId: const Value(null),
                hasUpdates: const Value(false),
                updatedAt: Value(c.updatedAt),
              ),
            ),
          );
        }
        for (final c in saved) {
          batch.insert(
            _db.courses,
            CoursesCompanion(
              id: Value(c.id),
              slug: Value(c.slug),
              title: Value(c.title),
              description: Value(c.description),
              authorName: Value(c.author.name),
              isPublished: const Value(true),
              isSaved: const Value(true),
              saveId: Value(c.saveId),
              hasUpdates: Value(c.hasUpdates),
              updatedAt: Value(c.acceptedAt),
            ),
            onConflict: DoUpdate(
              (_) => CoursesCompanion(
                slug: Value(c.slug),
                title: Value(c.title),
                description: Value(c.description),
                authorName: Value(c.author.name),
                isPublished: const Value(true),
                isSaved: const Value(true),
                saveId: Value(c.saveId),
                hasUpdates: Value(c.hasUpdates),
                updatedAt: Value(c.acceptedAt),
              ),
            ),
          );
        }
      });

      final localIds = (await _db.courses.select().get())
          .map((course) => course.id)
          .toSet();
      final removedIds = localIds.difference(serverIds).toList();
      if (removedIds.isNotEmpty) {
        // Ответ списка — полный снимок серверного состояния. Локальную теорию
        // удаляем только после успешного ответа, поэтому при проблемах с сетью
        // последняя рабочая офлайн-копия остаётся доступной.
        await (_db.delete(
          _db.courseArticles,
        )..where((article) => article.courseId.isIn(removedIds))).go();
        await (_db.delete(
          _db.courseSections,
        )..where((section) => section.courseId.isIn(removedIds))).go();
        await (_db.delete(_db.syncMeta)..where(
              (meta) =>
                  meta.entityType.isIn(['course', 'course_bundle']) &
                  meta.entityId.isIn(removedIds),
            ))
            .go();
        await (_db.delete(
          _db.courses,
        )..where((course) => course.id.isIn(removedIds))).go();
      }

      await _db.syncMeta.insertOnConflictUpdate(
        SyncMetaCompanion(
          entityType: const Value('courses_list'),
          entityId: const Value('me'),
          lastSyncedAt: Value(DateTime.now()),
        ),
      );
    });

    return getDownloadedCourses();
  }

  /// Скачанные курсы, структура которых старее серверных метаданных.
  Future<Set<String>> getOutdatedDownloadedCourseIds() async {
    final downloaded = await (_db.select(
      _db.syncMeta,
    )..where((meta) => meta.entityType.equals('course_bundle'))).get();
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
    final cachedMedia = <String, List<Map<String, dynamic>>>{};
    for (final section in detail.sections) {
      for (final article in section.articles) {
        final media = <Map<String, dynamic>>[];
        for (final item in article.media) {
          final json = item.toJson();
          final localPath = await _mediaCache?.download(
            item.url,
            key: 'article-${article.id}-${item.id}',
          );
          if (localPath != null) json['local_path'] = localPath;
          media.add(json);
        }
        cachedMedia[article.id] = media;
      }
    }

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
              mediaJson: Value(jsonEncode(cachedMedia[article.id] ?? const [])),
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

  /// Полная офлайн-копия: теория, медиа и наборы всех статей.
  Future<CourseDetailData> downloadCourseForOffline(String courseId) async {
    final detail = await downloadCourse(courseId);
    final sets = _sets;
    if (sets == null) return detail;
    final setIds = <String>{
      for (final section in detail.sections)
        for (final article in section.articles) article.setId,
    };
    for (final setId in setIds) {
      await sets.downloadSet(setId);
    }
    await _db.syncMeta.insertOnConflictUpdate(
      SyncMetaCompanion(
        entityType: const Value('course_bundle'),
        entityId: Value(courseId),
        lastSyncedAt: Value(DateTime.now()),
        revision: Value(_contentRevision(detail.updatedAt)),
      ),
    );
    return detail;
  }

  Future<Set<String>> getDownloadedCourseIds() async {
    final rows = await (_db.select(
      _db.syncMeta,
    )..where((meta) => meta.entityType.equals('course_bundle'))).get();
    return rows.map((row) => row.entityId).toSet();
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
