import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for CoursesApi
void main() {
  final instance = RemoraApi().getCoursesApi();

  group(CoursesApi, () {
    // Copy Course
    //
    //Future<CourseEditorDetail> copyCourseApiV1CoursesCourseIdCopyPost(String courseId, String idempotencyKey, CourseCopyRequest courseCopyRequest) async
    test('test copyCourseApiV1CoursesCourseIdCopyPost', () async {
      // TODO
    });

    // Course Editor
    //
    //Future<CourseEditorDetail> courseEditorApiV1CoursesCourseIdEditorGet(String courseId) async
    test('test courseEditorApiV1CoursesCourseIdEditorGet', () async {
      // TODO
    });

    // Карта публичных курсов
    //
    //Future<BuiltList<CourseSitemapEntry>> courseSitemapApiV1CoursesSitemapGet() async
    test('test courseSitemapApiV1CoursesSitemapGet', () async {
      // TODO
    });

    // Создать курс из набора
    //
    //Future<CourseDetail> createCourseApiV1CoursesPost(CourseCreate courseCreate) async
    test('test createCourseApiV1CoursesPost', () async {
      // TODO
    });

    // Структура моего курса
    //
    //Future<CourseDetail> getCourseApiV1CoursesCourseIdGet(String courseId) async
    test('test getCourseApiV1CoursesCourseIdGet', () async {
      // TODO
    });

    // Поставить лайк курсу
    //
    //Future<CourseDetail> likeCourseApiV1CoursesPublicSlugLikePost(String slug) async
    test('test likeCourseApiV1CoursesPublicSlugLikePost', () async {
      // TODO
    });

    // Мои курсы
    //
    //Future<BuiltList<CourseSummary>> listCoursesApiV1CoursesGet() async
    test('test listCoursesApiV1CoursesGet', () async {
      // TODO
    });

    // Карточки статьи курса
    //
    //Future<PublicSet> publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet(String slug, String articleId, { int after, DateTime revision }) async
    test('test publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet', () async {
      // TODO
    });

    // Опубликованный курс
    //
    //Future<CourseDetail> publicCourseApiV1CoursesPublicSlugGet(String slug) async
    test('test publicCourseApiV1CoursesPublicSlugGet', () async {
      // TODO
    });

    // Опубликовать курс
    //
    //Future<CourseDetail> publishCourseApiV1CoursesCourseIdPublishPost(String courseId, CoursePublication coursePublication) async
    test('test publishCourseApiV1CoursesCourseIdPublishPost', () async {
      // TODO
    });

    // Похожие курсы
    //
    //Future<BuiltList<CourseSearchItem>> relatedCoursesApiV1CoursesPublicSlugRelatedGet(String slug, { int limit }) async
    test('test relatedCoursesApiV1CoursesPublicSlugRelatedGet', () async {
      // TODO
    });

    // Пожаловаться на курс
    //
    //Future<ReportSubmitted> reportCourseApiV1CoursesPublicSlugReportPost(String slug, ReportCreate reportCreate) async
    test('test reportCourseApiV1CoursesPublicSlugReportPost', () async {
      // TODO
    });

    // Save Structure
    //
    //Future<CourseEditorDetail> saveStructureApiV1CoursesCourseIdStructurePut(String courseId, String idempotencyKey, CourseStructureWrite courseStructureWrite) async
    test('test saveStructureApiV1CoursesCourseIdStructurePut', () async {
      // TODO
    });

    // Убрать лайк с курса
    //
    //Future<CourseDetail> unlikeCourseApiV1CoursesPublicSlugLikeDelete(String slug) async
    test('test unlikeCourseApiV1CoursesPublicSlugLikeDelete', () async {
      // TODO
    });

    // Снять курс с публикации
    //
    //Future<CourseDetail> unpublishCourseApiV1CoursesCourseIdUnpublishPost(String courseId) async
    test('test unpublishCourseApiV1CoursesCourseIdUnpublishPost', () async {
      // TODO
    });

    // Изменить описание курса
    //
    //Future<CourseDetail> updateCourseApiV1CoursesCourseIdPut(String courseId, CourseMetadata courseMetadata) async
    test('test updateCourseApiV1CoursesCourseIdPut', () async {
      // TODO
    });

  });
}
