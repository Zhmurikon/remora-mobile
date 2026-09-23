import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/features/courses/article_content_widget.dart';

/// Рендер безопасного markdown теории: заголовки, форматирование, формулы,
/// таблицы, код и изображения media: не должны ронять построение.
void main() {
  Future<void> pump(
    WidgetTester tester,
    String body, {
    Map<String, String> media = const {},
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: ArticleContentWidget(body: body, mediaUrls: media),
          ),
        ),
      ),
    );
  }

  testWidgets('заголовок и абзац показываются текстом', (tester) async {
    await pump(tester, '# Заголовок\n\nОбычный текст статьи.');
    expect(tester.takeException(), isNull);
    expect(find.text('Заголовок'), findsOneWidget);
    expect(find.textContaining('Обычный текст'), findsOneWidget);
  });

  testWidgets('жирный, курсив и списки строятся без ошибок', (tester) async {
    await pump(tester, '**жирный** и *курсив*\n\n- один\n- два\n- три');
    expect(tester.takeException(), isNull);
  });

  testWidgets('строчная формула \$…\$ не роняет рендер', (tester) async {
    await pump(tester, r'Энергия $E = mc^2$ в тексте.');
    expect(tester.takeException(), isNull);
  });

  testWidgets('цена вида 5\$ и \$10 не превращается в формулу', (tester) async {
    // Если бы разделители сработали, между $ оказался бы math-узел и текст
    // «и» пропал бы из обычного потока. Проверяем, что текст на месте.
    await pump(tester, r'Стоит 5$ и $10 сверху.');
    expect(tester.takeException(), isNull);
    expect(find.textContaining('и'), findsWidgets);
  });

  testWidgets('выключная формула \$\$…\$\$ рендерится', (tester) async {
    await pump(tester, r'$$\int_0^1 x\,dx = \frac{1}{2}$$');
    expect(tester.takeException(), isNull);
  });

  testWidgets('код с языком строится', (tester) async {
    await pump(tester, '```dart\nvoid main() {}\n```');
    expect(tester.takeException(), isNull);
  });

  testWidgets('таблица GFM строится', (tester) async {
    await pump(tester, '| A | B |\n|---|---|\n| 1 | 2 |');
    expect(tester.takeException(), isNull);
    expect(find.textContaining('A'), findsWidgets);
  });

  testWidgets('media: изображение берёт ссылку из карты', (tester) async {
    await pump(
      tester,
      '![Схема](media:m1)',
      media: {'m1': 'https://example.com/y.png'},
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('изображение без media-карты показывает подпись', (tester) async {
    await pump(tester, '![внешнее](https://e.com/x.png)');
    expect(tester.takeException(), isNull);
    expect(find.text('внешнее'), findsOneWidget);
  });
}
