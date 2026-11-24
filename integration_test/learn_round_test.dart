import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/study/learn_pairs.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'раунд на устройстве: свайп, ошибка, исключение вариантов и завершение',
    (tester) async {
      const names = [
        'Компиляция',
        'Интерпретация',
        'Машинный код',
        'Язык ассемблера',
      ];
      const definitions = [
        'Преобразование всего исходного кода программы до её запуска.',
        'Построчное выполнение инструкций программы во время её работы.',
        'Последовательность двоичных команд, которые процессор может исполнить напрямую.',
        'Низкоуровневый язык, команды которого записываются символьными обозначениями и близки к машинным инструкциям процессора.',
      ];
      final items = [
        for (var i = 0; i < 4; i++)
          QueueItem(
            card: QueueCard(
              id: '$i',
              position: i,
              term: names[i],
              definition: definitions[i],
            ),
            direction: 'term_to_def',
            state: CardStateData(
              cardId: '$i',
              direction: 'term_to_def',
              state: 'new',
              dueAt: DateTime.utc(2026),
            ),
            previews: [],
          ),
      ];
      final grades = <String>[];
      final spoken = <String>[];
      var finished = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: LearnPairs(
                pairs: items,
                seed: 'pixel',
                grade: (it, ok) async {
                  grades.add('${it.card.id}:$ok');
                  return true;
                },
                onSpeak: (it, answer) => spoken.add('${it.card.id}:$answer'),
                onNext: () => finished = true,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      Future<void> tap(String label) async {
        final finder = find.text(label).hitTestable().first;
        await tester.tap(finder);
        await tester.pumpAndSettle();
      }

      await tester.drag(find.byType(PageView), const Offset(-340, 0));
      await tester.pumpAndSettle();
      expect(find.text(definitions[1]).hitTestable(), findsOneWidget);
      await tap(names[0]);
      expect(find.text('Попробуйте другую пару').hitTestable(), findsOneWidget);
      await tap(names[1]);
      await tester.tap(find.byTooltip('Предыдущее определение'));
      await tester.pumpAndSettle();
      final used = find.text(names[1]).hitTestable().first;
      expect(
        tester.widget<Text>(used).style?.decoration,
        TextDecoration.lineThrough,
      );
      await tap(names[0]);
      await tap('4');
      await tap(names[3]);
      await tap('3');
      await tap(names[2]);
      await tap('Дальше');
      expect(finished, isTrue);
      expect(grades, ['1:false', '0:true', '3:true', '2:true']);
      expect(
        spoken,
        containsAllInOrder(['1:false', '1:true', '0:false', '0:true']),
      );
    },
  );
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
