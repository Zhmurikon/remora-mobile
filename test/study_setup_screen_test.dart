import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/study/flashcards_screen.dart';
import 'package:remora_mobile/features/study/study_setup_screen.dart';
import 'package:remora_mobile/features/study/test_setup_screen.dart';

void main() {
  QueueItem queueItem() => QueueItem(
    card: QueueCard(
      id: 'card-1',
      position: 0,
      term: 'Одинаковые границы осей при сравнении графиков',
      definition:
          'Чтобы визуальное сравнение не искажало различия между графиками.',
      hint: 'Сравните шкалы по обеим осям',
    ),
    direction: 'term_to_def',
    state: CardStateData(
      cardId: 'card-1',
      direction: 'term_to_def',
      state: 'new',
      dueAt: DateTime(2026),
    ),
    previews: [
      RatingPreview(rating: 1, intervalSeconds: 60),
      RatingPreview(rating: 2, intervalSeconds: 360),
      RatingPreview(rating: 3, intervalSeconds: 600),
      RatingPreview(rating: 4, intervalSeconds: 691200),
    ],
  );

  Widget app(Widget child, {double textScale = 1}) {
    return MaterialApp(
      theme: remoraLightTheme(),
      darkTheme: remoraDarkTheme(),
      builder: (context, widget) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(textScale)),
        child: widget!,
      ),
      home: Scaffold(body: child),
    );
  }

  testWidgets('показывает четыре основных режима и свой квиз', (tester) async {
    var openedQuiz = false;
    await tester.pumpWidget(
      app(
        StudyModeView(
          starting: null,
          enabled: true,
          onFlashcards: () {},
          onLearn: () {},
          onWrite: () {},
          onTest: () {},
          onCustomQuiz: () => openedQuiz = true,
        ),
      ),
    );

    expect(find.text('Как будем учиться?'), findsOneWidget);
    expect(find.text('Карточки'), findsOneWidget);
    expect(find.text('Учить'), findsOneWidget);
    expect(find.text('Писать'), findsOneWidget);
    expect(find.text('Тест'), findsOneWidget);
    expect(find.text('Свой квиз'), findsOneWidget);
    await tester.tap(find.text('Свой квиз'));
    expect(openedQuiz, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('режимы выдерживают масштаб 1,3 и landscape', (tester) async {
    tester.view.physicalSize = const Size(900, 420);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      app(
        StudyModeView(
          starting: 'learn',
          enabled: false,
          onFlashcards: () {},
          onLearn: () {},
          onWrite: () {},
          onTest: () {},
          onCustomQuiz: () {},
        ),
        textScale: 1.3,
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('свой квиз собирает конфигурацию и не снимает последний формат', (
    tester,
  ) async {
    TestConfig? changed;
    var started = false;
    await tester.pumpWidget(
      app(
        QuizSetupView(
          config: TestConfig(
            questionCount: 10,
            kinds: const ['choice'],
            writeToSchedule: false,
          ),
          isLoading: false,
          error: null,
          customQuiz: true,
          onChanged: (value) => changed = value,
          onStart: () => started = true,
        ),
      ),
    );

    expect(find.text('Свой квиз'), findsOneWidget);
    await tester.tap(find.text('Выбор ответа'));
    expect(changed, isNull);

    await tester.tap(find.text('Ввод ответа'));
    expect(changed?.kinds, containsAll(['choice', 'typing']));

    await tester.tap(find.text('Начать квиз · до 10 вопросов'));
    expect(started, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('карточка показывает вопрос и доступное действие ответа', (
    tester,
  ) async {
    var flipped = false;
    await tester.pumpWidget(
      app(
        FlashcardStudyView(
          item: queueItem(),
          isFlipped: false,
          submitting: false,
          onFlip: () => flipped = true,
          onRate: (_) {},
        ),
      ),
    );

    expect(find.text('ВОПРОС'), findsOneWidget);
    expect(find.text('Показать ответ'), findsOneWidget);
    await tester.tap(find.text('Показать ответ'));
    expect(flipped, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('ответ и оценки выдерживают масштаб 1,3', (tester) async {
    tester.view.physicalSize = const Size(412, 820);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    var rating = 0;

    await tester.pumpWidget(
      app(
        FlashcardStudyView(
          item: queueItem(),
          isFlipped: true,
          submitting: false,
          onFlip: () {},
          onRate: (value) => rating = value,
        ),
        textScale: 1.3,
      ),
    );

    expect(find.text('ОТВЕТ'), findsOneWidget);
    expect(find.text('Не помню'), findsOneWidget);
    expect(find.text('Хорошо'), findsOneWidget);
    await tester.tap(find.text('Хорошо'));
    expect(rating, 3);
    expect(tester.takeException(), isNull);
  });
}
