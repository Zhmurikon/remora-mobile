import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';

// tests for TestConfig
void main() {
  final instance = TestConfigBuilder();
  // TODO add properties to the builder and call build()

  group(TestConfig, () {
    // DirectionMode direction (default value: DirectionMode.termToDef)
    test('to test the property `direction`', () async {
      // TODO
    });

    // BuiltList<TestQuestionKind> kinds (default value: ListBuilder())
    test('to test the property `kinds`', () async {
      // TODO
    });

    // int questionCount (default value: 20)
    test('to test the property `questionCount`', () async {
      // TODO
    });

    // TestSource source_ (default value: TestSource.all)
    test('to test the property `source_`', () async {
      // TODO
    });

    // bool writeToSchedule (default value: true)
    test('to test the property `writeToSchedule`', () async {
      // TODO
    });

  });
}
