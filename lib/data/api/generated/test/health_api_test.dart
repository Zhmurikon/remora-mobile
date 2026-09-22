import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for HealthApi
void main() {
  final instance = RemoraApi().getHealthApi();

  group(HealthApi, () {
    // Живость приложения
    //
    //Future<HealthResponse> healthApiV1HealthGet() async
    test('test healthApiV1HealthGet', () async {
      // TODO
    });

    // Готовность зависимостей
    //
    //Future<ReadinessResponse> readyApiV1ReadyGet() async
    test('test readyApiV1ReadyGet', () async {
      // TODO
    });

  });
}
