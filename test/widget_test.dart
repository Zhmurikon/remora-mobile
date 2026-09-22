import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/db/database_provider.dart';
import 'package:remora_mobile/main.dart';

void main() {
  testWidgets('RemoraApp запускается без ошибок', (tester) async {
    final testDb = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(testDb),
        ],
        child: const RemoraApp(),
      ),
    );

    // Даём время на инициализацию auth-state и router
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    // Приложение стартует — показывает login (неавторизован) или библиотеку
    expect(find.byType(MaterialApp), findsOneWidget);

    await testDb.close();
  });
}
