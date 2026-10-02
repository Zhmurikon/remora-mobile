import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/study/test_result_screen.dart';

void main() {
  testWidgets('округляет серверный процент результата', (tester) async {
    final result = TestResult(
      attemptId: 'attempt-1',
      setId: 'set-1',
      score: 66.7,
      correctCount: 4,
      total: 6,
      finishedAt: DateTime.utc(2026, 10, 2),
      review: const [],
      wrongCardIds: const ['card-5', 'card-6'],
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: TestResultScreen(
            setId: 'set-1',
            attemptId: 'attempt-1',
            result: result,
          ),
        ),
      ),
    );

    expect(find.text('67%'), findsOneWidget);
    expect(find.text('6670%'), findsNothing);
  });
}
