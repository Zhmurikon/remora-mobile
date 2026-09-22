import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for SearchApi
void main() {
  final instance = RemoraApi().getSearchApi();

  group(SearchApi, () {
    // Поиск публичных курсов
    //
    //Future<CourseSearchResult> coursesApiV1SearchCoursesGet({ String q, String tag, String language, String authorId, int minCards, int maxCards, DateTime updatedAfter, String sort, int cursor, int limit }) async
    test('test coursesApiV1SearchCoursesGet', () async {
      // TODO
    });

    // Выбранные публичные курсы
    //
    //Future<BuiltList<CourseSearchItem>> selectedApiV1SearchCoursesSelectedGet(BuiltList<String?> ids) async
    test('test selectedApiV1SearchCoursesSelectedGet', () async {
      // TODO
    });

  });
}
