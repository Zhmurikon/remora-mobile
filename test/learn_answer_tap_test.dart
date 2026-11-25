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
import 'package:remora_mobile/features/study/study_flip_card.dart';
import 'package:remora_mobile/features/study/study_provider.dart';

class _Session extends StudySessionNotifier {
  _Session(
    RemoraApiClient api,
    StudyRepository repo,
    String answer, {
    List<String> types = const ['choice'],
  }) : super(api, OutboxService(repo, api), repo) {
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
      learnQuestionTypes: types,
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
    QueueItem? consume,
    String? given,
  }) async {
    submitted.add(answerCorrect);
    await saved.future;
  }
}

void main() {
  for (final reduced in [false, true]) {
    testWidgets('одна двухсторонняя карточка, уменьшение движения $reduced', (
      tester,
    ) async {
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final session = _Session(
        RemoraApiClient(Dio()),
        StudyRepository(db),
        'Обратная сторона',
        types: ['recall'],
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [studySessionProvider.overrideWith((_) => session)],
          child: MaterialApp(
            theme: remoraDarkTheme(),
            home: MediaQuery(
              data: MediaQueryData(
                size: const Size(390, 840),
                disableAnimations: reduced,
              ),
              child: const LearnScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final card = find.byType(StudyFlipCard);
      expect(card, findsOneWidget);
      expect(find.text('Обратная сторона'), findsNothing);
      final rect = tester.getRect(card);
      await tester.tap(find.text('Показать ответ'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 80));
      if (reduced) {
        expect(find.text('Обратная сторона'), findsOneWidget);
      } else {
        final transform = tester
            .widgetList<Transform>(
              find.descendant(of: card, matching: find.byType(Transform)),
            )
            .first;
        expect(transform.transform.entry(0, 0), inExclusiveRange(0.0, 1.0));
        expect(find.text('Обратная сторона'), findsNothing);
      }
      await tester.pumpAndSettle();
      expect(tester.getRect(card), rect);
      expect(find.text('Выберите выражение'), findsNothing);
      expect(find.text('Обратная сторона'), findsOneWidget);
      expect(session.submitted, isEmpty);
      await tester.tap(find.text('Не помню'));
      session.saved.complete();
      await tester.pumpAndSettle();
      expect(find.text('Повторим ещё раз'), findsNothing);
      expect(find.text('Дальше'), findsNothing);
      expect(session.submitted, [false]);
    });
  }
  testWidgets('знакомство показывает по одной стороне и не записывает ответ', (
    tester,
  ) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final session = _Session(
      RemoraApiClient(Dio()),
      StudyRepository(db),
      'Определение карточки',
      types: ['choice', 'recall'],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [studySessionProvider.overrideWith((_) => session)],
        child: MaterialApp(
          theme: remoraLightTheme(),
          home: const LearnScreen(seed: 'intro'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final next = find.widgetWithText(FilledButton, 'Дальше');
    final card = find.byType(StudyFlipCard);
    expect(tester.getCenter(next).dx, closeTo(tester.getCenter(card).dx, 1));
    expect(
      tester.getTopLeft(next).dy - tester.getBottomLeft(card).dy,
      greaterThanOrEqualTo(16),
    );
    expect(find.text('Определение карточки'), findsNothing);
    await tester.tap(next);
    await tester.pumpAndSettle();
    expect(find.text('ОПРЕДЕЛЕНИЕ'), findsOneWidget);
    expect(find.text('Выберите выражение'), findsNothing);
    await tester.tap(next);
    await tester.pumpAndSettle();
    expect(find.text('Знакомство с карточкой'), findsNothing);
    expect(session.submitted, isEmpty);
  });

  testWidgets('ошибка выделяет оба варианта и ждёт Дальше без сдвига', (
    tester,
  ) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final session = _Session(
      RemoraApiClient(Dio()),
      StudyRepository(db),
      'Правильный ответ',
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [studySessionProvider.overrideWith((_) => session)],
        child: MaterialApp(
          theme: remoraLightTheme(),
          home: const LearnScreen(seed: 'choice-test'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final right = find.text('Правильный ответ');
    final wrong = find.text('Альфа');
    final rect = tester.getRect(right);
    Color? background(Finder widget) => tester
        .widget<Material>(
          find.ancestor(of: widget, matching: find.byType(Material)).first,
        )
        .color;
    final neutral = background(right);
    await tester.tap(wrong);
    session.saved.complete();
    await tester.pumpAndSettle();
    expect(tester.getRect(right), rect);
    expect(background(right), isNot(neutral));
    expect(background(wrong), isNot(background(right)));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Дальше'), findsOneWidget);
    expect(find.text('Повторим ещё раз'), findsNothing);
    expect(session.submitted, [false]);
    await tester.tap(find.text('Дальше'));
    await tester.pumpAndSettle();
    expect(find.text('Дальше'), findsNothing);
  });

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
              home: const LearnScreen(seed: 'choice-test'),
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
        expect(find.text('Дальше'), findsNothing);
        await tester.pump(const Duration(milliseconds: 70));
        await tester.tapAt(point);
        await tester.pump();
        expect(find.byType(SelectableRegion), findsNothing);
        expect(session.submitted, [true]);
        session.saved.complete();
        await tester.pump();
        await tester.pump(const Duration(seconds: 2));
        await tester.pumpAndSettle();
      },
    );
  }
}
