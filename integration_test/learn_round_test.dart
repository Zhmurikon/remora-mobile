import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'learn_pairs_scenario.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  registerLearnPairsScenario();
  testWidgets('системный синтез запускается и прерывается', (_) async {
    const channel = MethodChannel('remora/learn-speech');
    expect(
      await channel.invokeMethod<bool>('speak', [
        {'text': 'Вопрос', 'lang': 'ru'},
        {'text': 'Ответ', 'lang': 'ru'},
      ]),
      isTrue,
    );
    await channel.invokeMethod<void>('stop');
    expect(
      await channel.invokeMethod<bool>('speak', [
        {'text': 'Следующая карточка', 'lang': 'ru'},
      ]),
      isTrue,
    );
    await channel.invokeMethod<void>('stop');
  });
}
