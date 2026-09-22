import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for ImportsApi
void main() {
  final instance = RemoraApi().getImportsApi();

  group(ImportsApi, () {
    // Поставить импорт Anki в очередь
    //
    //Future<ImportJobPublic> createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost(String setId, String filename) async
    test('test createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost', () async {
      // TODO
    });

    // Статус импорта
    //
    //Future<ImportJobPublic> getImportJobApiV1ImportsJobsJobIdGet(String jobId) async
    test('test getImportJobApiV1ImportsJobsJobIdGet', () async {
      // TODO
    });

    // Импортировать Anki
    //
    //Future<AnkiImportResult> importAnkiApiV1ImportsSetsSetIdAnkiPost(String setId, String filename) async
    test('test importAnkiApiV1ImportsSetsSetIdAnkiPost', () async {
      // TODO
    });

    // Последние импорты набора
    //
    //Future<BuiltList<ImportJobPublic>> listImportJobsApiV1ImportsSetsSetIdJobsGet(String setId) async
    test('test listImportJobsApiV1ImportsSetsSetIdJobsGet', () async {
      // TODO
    });

  });
}
