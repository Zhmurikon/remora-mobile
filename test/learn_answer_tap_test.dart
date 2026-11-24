import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/outbox_service.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';
import 'package:remora_mobile/features/study/card_content_widget.dart';
import 'package:remora_mobile/features/study/learn_screen.dart';
import 'package:remora_mobile/features/study/study_provider.dart';

class _Session extends StudySessionNotifier {
  _Session(RemoraApiClient api, StudyRepository repo, String answer)
    : super(api, OutboxService(repo, api), repo) {
    final item = QueueItem(
      card: QueueCard(
        id: 'card',
        position: 0,
        term: 'Выберите выражение',
        definition: answer,
        wrongDefinitionAnswers: const ['Альфа', 'Бета', 'Гамма'],
      ),
      direction: 'term_to_def',
      previews: [],
      state: CardStateData(
        cardId: 'card',
        direction: 'term_to_def',
        state: 'new',
        dueAt: DateTime.utc(2026),
      ),
    );
    state = state.copyWith(
      mode: StudyMode.learn,
      items: [item],
      total: 1,
      isLoading: false,
    );
  }

  final submitted = <bool?>[];
  final saved = Completer<void>();

  @override
  Future<void> answer({
    required QueueItem item,
    required int rating,
    bool? answerCorrect,
    int? durationMs,
    bool requeue = false,
  }) async {
    submitted.add(answerCorrect);
    await saved.future;
  }
}

void main() {
  for (final target in ['текст', 'формулу', 'край карточки']) {
    testWidgets(
      'нажатие на $target сразу выбирает ответ, двойное касание не дублирует его',
      (tester) async {
        final answer = target == 'формулу' ? r'$a^2+b^2$' : 'Правильный ответ';
        final db = AppDatabase.forTesting(NativeDatabase.memory());
        addTearDown(db.close);
        final session = _Session(
          RemoraApiClient(Dio()),
          StudyRepository(db),
          answer,
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [studySessionProvider.overrideWith((_) => session)],
            child: MaterialApp(
              theme: remoraLightTheme(),
              home: const LearnScreen(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final content = find.byWidgetPredicate(
          (w) => w is CardContentWidget && w.value == answer,
        );
        final row = find
            .ancestor(of: content, matching: find.byType(InkWell))
            .first;
        await tester.ensureVisible(row);
        final point = switch (target) {
          'формулу' => tester.getCenter(
            find.descendant(of: content, matching: find.byType(Math)),
          ),
          'край карточки' => tester.getTopLeft(row) + const Offset(5, 10),
          _ => tester.getCenter(find.text(answer)),
        };
        await tester.tapAt(point);
        await tester.pump();
        expect(find.text('Дальше'), findsOneWidget);
        await tester.pump(const Duration(milliseconds: 70));
        await tester.tapAt(point);
        await tester.pump();
        expect(find.byType(SelectableRegion), findsNothing);
        final next = find.text('Дальше');
        await tester.ensureVisible(next);
        await tester.tap(next);
        await tester.pump(const Duration(milliseconds: 70));
        await tester.tap(next);
        expect(session.submitted, [true]);
        session.saved.complete();
        await tester.pumpAndSettle();
      },
    );
  }
}
