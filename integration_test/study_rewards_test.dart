import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/outbox_service.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';
import 'package:remora_mobile/features/study/flashcards_screen.dart';
import 'package:remora_mobile/features/study/session_result_screen.dart';
import 'package:remora_mobile/features/study/study_provider.dart';

import 'package:remora_mobile/features/study/write_screen.dart';
import 'package:remora_mobile/features/study/learn_screen.dart';
import 'package:remora_mobile/features/workspace/workspace.dart';

import 'learn_pairs_scenario.dart';

class _Api extends RemoraApiClient {
  _Api() : super(Dio());
  @override
  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async =>
      ReviewBatchResult(
        accepted: [for (final review in batch.reviews) review.clientReviewId],
        duplicates: const [],
        rejected: const [],
        states: const [],
      );
}

class _Session extends StudySessionNotifier {
  _Session(_Api api, StudyRepository repository, StudyMode mode)
    : super(api, OutboxService(repository, api), repository) {
    final items = [
      for (var i = 1; i <= 2; i++)
        QueueItem(
          card: QueueCard(
            id: '$i',
            position: i,
            term: 'Чему равна $i?',
            definition: '$i',
          ),
          direction: 'term_to_def',
          previews: const [],
          state: CardStateData(
            cardId: '$i',
            direction: 'term_to_def',
            state: 'new',
            dueAt: DateTime.utc(2026),
          ),
        ),
    ];
    state = state.copyWith(
      mode: mode,
      learnQuestionTypes: const ['typing'],
      items: items,
      total: items.length,
      isLoading: false,
    );
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  registerLearnPairsScenario();
  for (final (mode, answers, title) in [
    (StudyMode.flashcards, [true, true], 'Звёздная печать'),
    (StudyMode.flashcards, [true, false], 'Выход на орбиту'),
    (StudyMode.flashcards, [false, false], 'Мягкая посадка'),
    (StudyMode.learn, [false, true, true], 'Выход на орбиту'),
    (StudyMode.write, [false, true, true], 'Выход на орбиту'),
  ]) {
    testWidgets('${mode.name}, сохранение, финал «$title» и повтор', (
      tester,
    ) async {
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final session = _Session(_Api(), StudyRepository(db), mode);
      final router = GoRouter(
        initialLocation: '/folder/debug/study/${mode.name}',
        routes: [
          GoRoute(
            path: '/folder/:folderId/study/${mode.name}',
            builder: (_, _) => switch (mode) {
              StudyMode.flashcards => const FlashcardsScreen(),
              StudyMode.learn => const LearnScreen(seed: 'round'),
              StudyMode.write => const WriteScreen(),
            },
          ),
          GoRoute(
            path: '/folder/:folderId/study/result',
            builder: (_, _) =>
                const SessionResultScreen.folder(folderId: 'debug'),
          ),
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            studySessionProvider.overrideWith((_) => session),
            workspaceDocument(
              'billing/entitlements',
            ).overrideWith((_) async => {}),
          ],
          child: MaterialApp.router(
            theme: remoraLightTheme(),
            routerConfig: router,
          ),
        ),
      );
      Future<void> waitFor(Finder finder) async {
        for (var i = 0; i < 120 && finder.evaluate().isEmpty; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        expect(
          finder,
          findsOneWidget,
          reason:
              'Записано ${session.state.answered} ответов, на экране ${tester.widgetList<Text>(find.byType(Text)).map((w) => w.data).whereType<String>().join(' | ')}',
        );
      }

      for (var i = 0; i < answers.length; i++) {
        final number = i % 2 + 1;
        await waitFor(find.text('Чему равна $number?'));
        if (mode == StudyMode.flashcards) {
          await tester.tap(find.text('Показать ответ'));
          final button = find
              .text(answers[i] ? 'Помню' : 'Не помню')
              .hitTestable();
          await waitFor(button);
          await tester.tap(button);
        } else {
          await tester.enterText(
            find.byType(TextField),
            answers[i] ? '$number' : 'другой ответ',
          );
          await tester.pumpAndSettle();
          expect(
            tester.widget<TextField>(find.byType(TextField)).controller!.text,
            answers[i] ? '$number' : 'другой ответ',
            reason: 'Ввод в задании $i',
          );
          final submit = find.text('Проверить');
          await tester.ensureVisible(submit);
          await tester.pumpAndSettle();
          await tester.tap(submit);
          await tester.pumpAndSettle();
          for (var tick = 0; tick < 30 && session.state.answered <= i; tick++) {
            await tester.pump(const Duration(milliseconds: 100));
          }
          expect(
            session.state.answered,
            i + 1,
            reason:
                'Проверка задания $i: ${tester.widgetList<Text>(find.byType(Text)).map((w) => w.data ?? w.textSpan?.toPlainText()).join(" | ")}',
          );
          if (!answers[i]) {
            final next = find.text('Дальше');
            await tester.ensureVisible(next);
            await tester.tap(next);
            await tester.pumpAndSettle();
          }
        }
        await tester.pump();
      }
      await waitFor(find.text(title));
      expect(session.state.history.map((attempt) => attempt.correct), answers);
      final before = session.state.history;
      await tester.tap(find.byTooltip('Повторить анимацию'));
      await tester.pumpAndSettle();
      expect(session.state.history, same(before));
      expect(tester.takeException(), isNull);
    });
  }
}
