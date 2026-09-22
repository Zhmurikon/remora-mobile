import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:remora_mobile/main.dart';

void main() {
  testWidgets('RemoraApp запускается без ошибок', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: RemoraApp()),
    );
    // Приложение стартует — либо login (неавторизован), либо home (авторизован)
    await tester.pump();
    expect(find.text('Remora'), findsWidgets);
  });
}
