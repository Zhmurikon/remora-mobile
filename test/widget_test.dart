import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/db/database_provider.dart';
import 'package:remora_mobile/data/preferences.dart';
import 'package:remora_mobile/main.dart';

void main() {
  testWidgets('RemoraApp запускается без ошибок', (tester) async {
    final testDb = AppDatabase.forTesting(NativeDatabase.memory());
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(testDb),
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const RemoraApp(),
      ),
    );

    // Splash содержит постоянную анимацию, поэтому pumpAndSettle здесь
    // принципиально не завершится.
    await tester.pump(const Duration(milliseconds: 500));

    // Приложение стартует — показывает login (неавторизован) или библиотеку
    expect(find.byType(MaterialApp), findsOneWidget);

    await testDb.close();
  });
}
