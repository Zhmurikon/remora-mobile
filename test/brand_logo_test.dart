import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/brand_logo.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('Знак и название доступны при теме ${brightness.name}', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness),
          home: Scaffold(
            body: MediaQuery(
              data: const MediaQueryData(
                disableAnimations: true,
                textScaler: TextScaler.linear(2),
              ),
              child: const SizedBox(width: 220, child: ZapominalnyaLogo()),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Запоминальня'), findsOneWidget);
      expect(find.bySemanticsLabel('Запоминальня'), findsOneWidget);
      final logo = find.byType(ZapominalnyaLogo);
      final image = tester.widget<Image>(
        find.descendant(of: logo, matching: find.byType(Image)),
      );
      final asset = image.image as AssetImage;
      expect(
        asset.assetName,
        brightness == Brightness.dark
            ? 'assets/zapominalnya-ink.png'
            : 'assets/zapominalnya.png',
      );
      expect(
        find.descendant(of: logo, matching: find.byType(Transform)),
        findsNothing,
      );
      expect(tester.takeException(), isNull);
    });
  }
}
