import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/widgets/ink_motion.dart';

void main() {
  testWidgets('Смена содержимого сохраняет ввод, фокус и активное поле', (
    tester,
  ) async {
    final field = GlobalKey();
    final focus = FocusNode();
    addTearDown(focus.dispose);
    Future<void> frame(int revision, {bool reduced = false}) =>
        tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MediaQuery(
                data: MediaQueryData(disableAnimations: reduced),
                child: InkReveal(
                  change: revision,
                  onMount: false,
                  child: TextField(key: field, focusNode: focus),
                ),
              ),
            ),
          ),
        );
    Finder fade() => find
        .descendant(
          of: find.byType(InkReveal),
          matching: find.byType(FadeTransition),
        )
        .first;
    double opacity() => tester.widget<FadeTransition>(fade()).opacity.value;
    await frame(0);
    await tester.enterText(find.byType(TextField), 'Ответ');
    final original = field.currentState;
    await frame(1);
    await tester.pump(const Duration(milliseconds: 60));
    expect(opacity(), inExclusiveRange(0.55, 1));
    await frame(2);
    expect(field.currentState, same(original));
    expect(focus.hasFocus, isTrue);
    expect(find.text('Ответ'), findsOneWidget);
    await frame(2, reduced: true);
    expect(opacity(), 1);
    await frame(3, reduced: true);
    expect(opacity(), 1);
  });

  testWidgets(
    'Полоса показывает новый результат при быстрых ответах и отключении движения',
    (tester) async {
      Future<void> frame(double progress, {bool reduced = false}) =>
          tester.pumpWidget(
            MaterialApp(
              home: MediaQuery(
                data: MediaQueryData(disableAnimations: reduced),
                child: InkProgressBar(value: progress),
              ),
            ),
          );
      LinearProgressIndicator bar() =>
          tester.widget(find.byType(LinearProgressIndicator));
      await frame(0);
      await frame(.5);
      await tester.pump(const Duration(milliseconds: 50));
      expect(bar().value, inExclusiveRange(0, .5));
      expect(bar().semanticsValue, '50%');
      await frame(1);
      await tester.pump(InkMotion.duration);
      expect(bar().value, 1);
      await frame(.5);
      await frame(.5, reduced: true);
      expect(bar().value, .5);
    },
  );

  testWidgets(
    'Переход Android открывает экран и возвращается в обоих режимах',
    (tester) async {
      for (final reduced in [false, true]) {
        final navigator = GlobalKey<NavigatorState>();
        await tester.pumpWidget(
          MaterialApp(
            navigatorKey: navigator,
            themeAnimationDuration: reduced
                ? Duration.zero
                : InkMotion.duration,
            theme: remoraLightTheme(reducedMotion: reduced),
            home: const Scaffold(body: Text('Главная')),
          ),
        );
        final route = MaterialPageRoute<void>(
          builder: (_) => const Scaffold(body: Text('Курс')),
        );
        navigator.currentState!.push(route);
        await tester.pump();
        expect(
          route.transitionDuration,
          reduced ? Duration.zero : InkMotion.duration,
        );
        await tester.pumpAndSettle();
        expect(find.text('Курс'), findsOneWidget);
        navigator.currentState!.pop();
        await tester.pumpAndSettle();
        expect(find.text('Главная'), findsOneWidget);
      }
    },
  );
}
