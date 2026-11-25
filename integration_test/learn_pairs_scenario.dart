import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/study/learn_pairs.dart';

void registerLearnPairsScenario() {
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
      final spoken = <String>[], directions = <String>[];
      final reward = Completer<void>();
      var advances = 0, rewards = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: LearnPairs(
                pairs: items,
                seed: 'pixel',
                onComplete: () async {
                  rewards++;
                  await reward.future;
                },
                onRepeatedMistake: () {},
                grade: (it, facing, ok, given) async {
                  directions.add(facing.direction);
                  grades.add('${it.card.id}:$ok');
                  return true;
                },
                onSpeak: (it, answer) => spoken.add('${it.card.id}:$answer'),
                onNext: () => advances++,
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

      final pageWidth = tester.getSize(find.byType(PageView)).width;
      await tester.drag(find.byType(PageView), Offset(-pageWidth * .85, 0));
      await tester.pumpAndSettle();
      expect(find.text(definitions[1]).hitTestable(), findsOneWidget);
      await tap(names[0]);
      await tester.pump(const Duration(milliseconds: 1100));
      expect(find.text(definitions[1]).hitTestable(), findsOneWidget);
      expect(rewards, 0);
      await tester.tap(find.byTooltip('Предыдущее определение'));
      await tester.pumpAndSettle();
      await tap(names[0]);
      await tap('4');
      await tester.pump(const Duration(milliseconds: 1100));
      expect(find.text(definitions[3]).hitTestable(), findsOneWidget);
      final used = find.text(names[0]).hitTestable().first;
      expect(
        tester.widget<Text>(used).style?.decoration,
        TextDecoration.lineThrough,
      );
      await tester.tap(find.text(names[3]).hitTestable().first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text(definitions[3]).hitTestable(), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();
      expect(find.text(definitions[1]).hitTestable(), findsOneWidget);
      await tap('3');
      await tap('Начать с термина');
      expect(rewards, 0);
      await tap(definitions[2]);
      expect(rewards, 0);
      await tester.pump(const Duration(milliseconds: 1100));
      await tester.pumpAndSettle();
      expect(find.text(names[1]).hitTestable(), findsOneWidget);
      await tap(definitions[1]);
      expect(rewards, 1);
      expect(find.text('Дальше'), findsNothing);
      await tester.pump(const Duration(seconds: 2));
      expect(advances, 0);
      reward.complete();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 799));
      expect(advances, 0);
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pumpAndSettle();
      expect(advances, 1);
      expect(rewards, 1);
      expect(directions, [
        'def_to_term',
        'def_to_term',
        'def_to_term',
        'term_to_def',
      ]);
      expect(grades, ['1:false', '0:true', '3:true', '2:true']);
      expect(
        spoken,
        containsAllInOrder([
          '1:false',
          '0:false',
          '0:true',
          '1:false',
          '1:true',
        ]),
      );
    },
  );
}
