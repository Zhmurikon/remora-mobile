import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for UsersApi
void main() {
  final instance = RemoraApi().getUsersApi();

  group(UsersApi, () {
    // Запросить полный экспорт аккаунта
    //
    //Future<AccountExportPublic> createAccountExportApiV1UsersMeExportPost() async
    test('test createAccountExportApiV1UsersMeExportPost', () async {
      // TODO
    });

    // Статус экспорта аккаунта
    //
    //Future<AccountExportPublic> getAccountExportApiV1UsersMeExportJobIdGet(String jobId) async
    test('test getAccountExportApiV1UsersMeExportJobIdGet', () async {
      // TODO
    });

    // Последний экспорт аккаунта
    //
    //Future<AccountExportPublic> latestAccountExportApiV1UsersMeExportLatestGet() async
    test('test latestAccountExportApiV1UsersMeExportLatestGet', () async {
      // TODO
    });

  });
}
