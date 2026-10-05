import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/features/study/card_content_widget.dart';

void main() {
  Future<void> pump(WidgetTester tester, String value) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CardContentWidget(value: value, contentType: 'text'),
        ),
      ),
    );
  }

  testWidgets('рендерит формулы внутри обычного текста', (tester) async {
    await pump(tester, r'Почему $Q_1$ меньше $Q_3$?');

    expect(tester.takeException(), isNull);
    expect(find.byType(Math), findsNWidgets(2));
    expect(find.textContaining('Почему'), findsOneWidget);
  });

  testWidgets('рендерит блочную формулу внутри обычного текста', (
    tester,
  ) async {
    await pump(
      tester,
      r'Размах:'
      '\n\n'
      r'$$IQR = Q_3 - Q_1$$',
    );

    expect(tester.takeException(), isNull);
    expect(find.byType(Math), findsOneWidget);
    expect(find.textContaining('Размах'), findsOneWidget);
  });

  testWidgets('не принимает цену за формулу', (tester) async {
    await pump(tester, r'Цена 5$ и $10 сверху.');

    expect(tester.takeException(), isNull);
    expect(find.byType(Math), findsNothing);
    expect(find.textContaining(r'Цена 5$'), findsOneWidget);
  });
}
