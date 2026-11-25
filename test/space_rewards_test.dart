import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/features/study/space_rewards.dart';
import 'package:remora_mobile/features/study/study_result_card.dart';

void main() {
  test('пять ступеней космической серии', () {
    expect(
      [for (var n = 1; n <= 9; n++) SpaceScene.forStreak(n)],
      [
        SpaceScene.spark,
        SpaceScene.doubleStar,
        SpaceScene.comet,
        SpaceScene.comet,
        SpaceScene.orbit,
        SpaceScene.orbit,
        SpaceScene.orbit,
        SpaceScene.nova,
        SpaceScene.nova,
      ],
    );
  });

  for (final size in [const Size(320, 640), const Size(840, 410)]) {
    testWidgets('итоги, повтор и досрочное завершение при размере $size', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final (correct, total, complete, scene) in [
        (0, 0, false, null),
        (0, 3, true, SpaceScene.failed),
        (2, 3, true, SpaceScene.partial),
        (2, 2, false, SpaceScene.partial),
        (3, 3, true, SpaceScene.perfect),
      ]) {
        await tester.pumpWidget(
          MaterialApp(
            theme: size.width < 500 ? remoraDarkTheme() : remoraLightTheme(),
            home: Scaffold(
              body: SingleChildScrollView(
                child: StudyResultCard(
                  correct: correct,
                  total: total,
                  complete: complete,
                  answers: [for (var i = 0; i < total; i++) i < correct],
                ),
              ),
            ),
          ),
        );
        final sprite = find.byType(SpaceSprite);
        if (scene == null) {
          expect(sprite, findsNothing);
          expect(find.text('0%'), findsNothing);
        } else {
          final initial = tester.widget<SpaceSprite>(sprite);
          expect(initial.scene, scene);
          await tester.tap(find.byTooltip('Повторить анимацию'));
          await tester.pump();
          expect(tester.widget<SpaceSprite>(sprite).key, isNot(initial.key));
          expect(find.text('Верно $correct из $total'), findsOneWidget);
        }
        expect(tester.takeException(), isNull);
      }
    });
  }

  for (final reduced in [false, true]) {
    testWidgets(
      'награда держится до следующего задания, сокращение движения $reduced',
      (tester) async {
        final key = GlobalKey<SpaceFieldState>();
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MediaQuery(
                data: MediaQueryData(disableAnimations: reduced),
                child: SpaceField(
                  key: key,
                  child: const Center(child: Text('Вопрос')),
                ),
              ),
            ),
          ),
        );
        await tester.runAsync(
          () => precacheImage(
            const AssetImage('assets/rewards/double.png'),
            key.currentContext!,
          ),
        );
        var finished = false;
        key.currentState!.reward(2).then((_) => finished = true);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));
        expect(finished, isFalse);
        await tester.pump(const Duration(milliseconds: 150));
        expect(finished, reduced);
        await tester.pump(const Duration(milliseconds: 451));
        expect(finished, isTrue);
        expect(find.byType(SpaceSprite), findsOneWidget);
        key.currentState!.fade();
        await tester.pump();
        if (!reduced) {
          await tester.pump(const Duration(milliseconds: 150));
          expect(find.byType(SpaceSprite), findsOneWidget);
        }
        await tester.pumpAndSettle();
        expect(find.byType(SpaceSprite), findsNothing);
      },
    );
  }
}
