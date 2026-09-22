import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for ExportsApi
void main() {
  final instance = RemoraApi().getExportsApi();

  group(ExportsApi, () {
    // Экспортировать набор
    //
    //Future<JsonObject> exportSetApiV1SetsSetIdExportGet(String setId, String format, { String sideSeparator, String cardSeparator, String layout }) async
    test('test exportSetApiV1SetsSetIdExportGet', () async {
      // TODO
    });

  });
}
