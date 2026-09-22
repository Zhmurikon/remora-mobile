import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:remora_mobile/main.dart';

void main() {
  testWidgets('HomeScreen отображает заголовок Remora', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: RemoraApp()),
    );
    expect(find.text('Remora'), findsWidgets);
    expect(find.text('Каркас приложения (M0)'), findsOneWidget);
  });
}
