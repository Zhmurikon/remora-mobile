import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';

void main() {
  group('тема Remora', () {
    test('светлая и тёмная схемы используют разные тональные поверхности', () {
      final light = remoraLightTheme();
      final dark = remoraDarkTheme();
      final lightTokens = light.extension<RemoraThemeTokens>()!;
      final darkTokens = dark.extension<RemoraThemeTokens>()!;

      expect(light.brightness, Brightness.light);
      expect(dark.brightness, Brightness.dark);
      expect(
        light.scaffoldBackgroundColor,
        isNot(dark.scaffoldBackgroundColor),
      );
      expect(lightTokens.surfaceMuted, isNot(light.colorScheme.surface));
      expect(darkTokens.surfaceMuted, isNot(dark.colorScheme.surface));
      expect(darkTokens.surfaceElevated, isNot(darkTokens.surfaceMuted));
    });

    test('состояния и дополнительные акценты заданы в обеих темах', () {
      for (final theme in [remoraLightTheme(), remoraDarkTheme()]) {
        final tokens = theme.extension<RemoraThemeTokens>();
        final typography = theme.extension<RemoraTypography>();
        expect(tokens, isNotNull);
        expect(typography, isNotNull);
        expect(tokens!.success, isNot(tokens.warning));
        expect(tokens.warning, isNot(tokens.ochreContainer));
        expect(
          theme.colorScheme.errorContainer,
          isNot(theme.colorScheme.error),
        );
        expect(typography!.readingBody.height, greaterThanOrEqualTo(1.7));
        expect(typography.studyCard.fontSize, greaterThanOrEqualTo(24));
        expect(typography.studyCard.fontFamily, 'NotoSerifDisplay');
        expect(theme.textTheme.bodyLarge?.fontFamily, 'NotoSans');
      }
    });

    test('основные пары цветов проходят WCAG AA', () {
      for (final theme in [remoraLightTheme(), remoraDarkTheme()]) {
        final scheme = theme.colorScheme;
        final tokens = theme.extension<RemoraThemeTokens>()!;
        expect(
          _contrast(scheme.onSurface, tokens.background),
          greaterThanOrEqualTo(4.5),
        );
        expect(
          _contrast(scheme.onSurfaceVariant, tokens.background),
          greaterThanOrEqualTo(4.5),
        );
        expect(
          _contrast(scheme.onPrimary, scheme.primary),
          greaterThanOrEqualTo(4.5),
        );
        expect(
          _contrast(scheme.onSecondary, scheme.secondary),
          greaterThanOrEqualTo(4.5),
        );
      }
    });

    testWidgets('интерактивные компоненты имеют цель не меньше 48 dp', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: remoraLightTheme(),
          home: Scaffold(
            body: Column(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                FilledButton(onPressed: () {}, child: const Text('Продолжить')),
              ],
            ),
          ),
        ),
      );

      final iconSize = tester.getSize(find.byType(IconButton));
      final buttonSize = tester.getSize(find.byType(FilledButton));
      expect(iconSize.width, greaterThanOrEqualTo(RemoraSizes.minTouchTarget));
      expect(iconSize.height, greaterThanOrEqualTo(RemoraSizes.minTouchTarget));
      expect(
        buttonSize.height,
        greaterThanOrEqualTo(RemoraSizes.minTouchTarget),
      );
    });

    testWidgets('нижняя навигация читается при масштабе шрифта 1,3', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(412, 915);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(1.3)),
          child: MaterialApp(
            theme: remoraLightTheme(),
            home: Scaffold(
              bottomNavigationBar: NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Главная',
                  ),
                  NavigationDestination(icon: Icon(Icons.book), label: 'Курсы'),
                  NavigationDestination(
                    icon: Icon(Icons.style),
                    label: 'Наборы',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Каталог',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    label: 'Ещё',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.text('Ещё'), findsOneWidget);
    });
  });
}

double _contrast(Color first, Color second) {
  final light = first.computeLuminance() > second.computeLuminance()
      ? first
      : second;
  final dark = light == first ? second : first;
  return (light.computeLuminance() + 0.05) / (dark.computeLuminance() + 0.05);
}
