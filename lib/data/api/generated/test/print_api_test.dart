import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for PrintApi
void main() {
  final instance = RemoraApi().getPrintApi();

  group(PrintApi, () {
    // Карточки для вырезания
    //
    //Future<JsonObject> printCardsApiV1PrintSetsSetIdCardsGet(String setId, { String layout }) async
    test('test printCardsApiV1PrintSetsSetIdCardsGet', () async {
      // TODO
    });

    // Список терминов
    //
    //Future<JsonObject> printTermsApiV1PrintSetsSetIdTermsGet(String setId) async
    test('test printTermsApiV1PrintSetsSetIdTermsGet', () async {
      // TODO
    });

    // Тест на печать
    //
    //Future<JsonObject> printTestApiV1PrintTestsAttemptIdGet(String attemptId, { bool answers }) async
    test('test printTestApiV1PrintTestsAttemptIdGet', () async {
      // TODO
    });

  });
}
