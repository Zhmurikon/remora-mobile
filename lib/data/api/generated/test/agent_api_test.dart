import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for AgentApi
void main() {
  final instance = RemoraApi().getAgentApi();

  group(AgentApi, () {
    // Copy Course
    //
    //Future<CourseEditorDetail> copyCourseApiV1AgentCoursesCourseIdCopyPost(String courseId, String idempotencyKey, CourseCopyRequest courseCopyRequest) async
    test('test copyCourseApiV1AgentCoursesCourseIdCopyPost', () async {
      // TODO
    });

    // Create Course
    //
    //Future<AgentCourseDetail> createCourseApiV1AgentCoursesPost(String idempotencyKey, AgentCourseWrite agentCourseWrite) async
    test('test createCourseApiV1AgentCoursesPost', () async {
      // TODO
    });

    // Create Set
    //
    //Future<AgentSetDetail> createSetApiV1AgentSetsPost(String idempotencyKey, AgentSetWrite agentSetWrite) async
    test('test createSetApiV1AgentSetsPost', () async {
      // TODO
    });

    // Delete Course Article
    //
    //Future<CourseEditorDetail> deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost(String courseId, String articleId, String idempotencyKey, AgentStructureDelete agentStructureDelete) async
    test('test deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost', () async {
      // TODO
    });

    // Delete Course Section
    //
    //Future<CourseEditorDetail> deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost(String courseId, String sectionId, String idempotencyKey, AgentStructureDelete agentStructureDelete) async
    test('test deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost', () async {
      // TODO
    });

    // Get Course
    //
    //Future<AgentCourseDetail> getCourseApiV1AgentCoursesCourseIdGet(String courseId) async
    test('test getCourseApiV1AgentCoursesCourseIdGet', () async {
      // TODO
    });

    // Get Course Structure
    //
    //Future<CourseEditorDetail> getCourseStructureApiV1AgentCoursesCourseIdStructureGet(String courseId) async
    test('test getCourseStructureApiV1AgentCoursesCourseIdStructureGet', () async {
      // TODO
    });

    // Get Set
    //
    //Future<AgentSetDetail> getSetApiV1AgentSetsSetIdGet(String setId) async
    test('test getSetApiV1AgentSetsSetIdGet', () async {
      // TODO
    });

    // List Courses
    //
    //Future<BuiltList<CourseSummary>> listCoursesApiV1AgentCoursesGet({ int offset, int limit }) async
    test('test listCoursesApiV1AgentCoursesGet', () async {
      // TODO
    });

    // List Sets
    //
    //Future<BuiltList<SetSummary>> listSetsApiV1AgentSetsGet({ int offset, int limit }) async
    test('test listSetsApiV1AgentSetsGet', () async {
      // TODO
    });

    // Publish Course
    //
    //Future<CourseDetail> publishCourseApiV1AgentCoursesCourseIdPublishPost(String courseId, String idempotencyKey, CoursePublication coursePublication) async
    test('test publishCourseApiV1AgentCoursesCourseIdPublishPost', () async {
      // TODO
    });

    // Unpublish Course
    //
    //Future<CourseDetail> unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost(String courseId, String idempotencyKey) async
    test('test unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost', () async {
      // TODO
    });

    // Update Course
    //
    //Future<AgentCourseDetail> updateCourseApiV1AgentCoursesCourseIdPut(String courseId, String idempotencyKey, AgentCourseUpdate agentCourseUpdate) async
    test('test updateCourseApiV1AgentCoursesCourseIdPut', () async {
      // TODO
    });

    // Update Course Structure
    //
    //Future<CourseEditorDetail> updateCourseStructureApiV1AgentCoursesCourseIdStructurePut(String courseId, String idempotencyKey, CourseStructureWrite courseStructureWrite) async
    test('test updateCourseStructureApiV1AgentCoursesCourseIdStructurePut', () async {
      // TODO
    });

    // Update Set
    //
    //Future<AgentSetDetail> updateSetApiV1AgentSetsSetIdPut(String setId, String idempotencyKey, AgentSetUpdate agentSetUpdate) async
    test('test updateSetApiV1AgentSetsSetIdPut', () async {
      // TODO
    });

  });
}
