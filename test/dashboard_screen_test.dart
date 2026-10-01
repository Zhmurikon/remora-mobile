import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/dashboard/dashboard_provider.dart';
import 'package:remora_mobile/features/dashboard/dashboard_screen.dart';

void main() {
  final testNow = DateTime(2026, 10, 1, 10);

  testWidgets('главная выдерживает длинное имя и масштаб текста 1,3', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      textScale: 1.3,
      name: 'Александра-Мария Константинопольская',
      dashboard: DashboardState(
        summary: _summary(reviewsToday: 240, dailyGoal: 20, totalXp: 987654),
        activity: _activity(testNow),
        isLoading: false,
      ),
      setTitle:
          'Очень длинное название набора о вероятности, статистике и анализе данных',
      setId: 'set-1',
    );

    expect(tester.takeException(), isNull);
    expect(
      find.text('Доброе утро,\nАлександра-Мария Константинопольская'),
      findsOneWidget,
    );
    expect(find.text('240 из 20'), findsOneWidget);
    expect(find.text('987654 XP'), findsOneWidget);
  });

  testWidgets('нулевой прогресс и заморозка имеют отдельные состояния', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      dashboard: DashboardState(
        summary: _summary(),
        activity: _activity(testNow, frozen: true),
        isLoading: false,
      ),
    );

    expect(find.text('0 из 20'), findsOneWidget);
    expect(find.byIcon(Icons.ac_unit_rounded), findsOneWidget);
    expect(find.text('Начните с первого набора'), findsOneWidget);
    expect(find.text('Открыть наборы'), findsOneWidget);
  });

  testWidgets('офлайн без сводки сохраняет пустое состояние и действие', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      dashboard: const DashboardState(isLoading: false, isOffline: true),
    );

    expect(
      find.text('Нет сети — скачанные наборы по-прежнему доступны.'),
      findsOneWidget,
    );
    expect(find.text('Здесь появится ваш прогресс'), findsOneWidget);
    expect(find.text('Открыть наборы'), findsOneWidget);
  });

  testWidgets('загрузка прогресса и библиотеки не ломает композицию', (
    tester,
  ) async {
    await _pumpDashboard(
      tester,
      dashboard: const DashboardState(),
      libraryLoading: true,
    );

    expect(find.text('Готовим продолжение'), findsOneWidget);
    expect(find.text('Загрузка'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });

  testWidgets('кнопка продолжения и pull-to-refresh вызывают колбэки', (
    tester,
  ) async {
    var refreshes = 0;
    var openedSet = '';
    await _pumpDashboard(
      tester,
      dashboard: DashboardState(summary: _summary(), isLoading: false),
      setTitle: 'Английские фразовые глаголы',
      setId: 'set-42',
      onRefresh: () async => refreshes++,
      onOpenSet: (id, title) => openedSet = '$id:$title',
    );

    final continueButton = find.widgetWithText(
      FilledButton,
      'Продолжить обучение',
    );
    await tester.scrollUntilVisible(continueButton, 160);
    await tester.tap(continueButton);
    expect(openedSet, 'set-42:Английские фразовые глаголы');

    await tester.drag(find.byType(ListView), const Offset(0, 400));
    await tester.pumpAndSettle();
    expect(refreshes, 1);
  });
}

Future<void> _pumpDashboard(
  WidgetTester tester, {
  required DashboardState dashboard,
  String name = 'Марина',
  String? setTitle,
  String? setId,
  bool libraryLoading = false,
  double textScale = 1,
  Future<void> Function()? onRefresh,
  void Function(String id, String title)? onOpenSet,
}) async {
  tester.view.physicalSize = const Size(412, 915);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
      child: MaterialApp(
        theme: remoraLightTheme(),
        darkTheme: remoraDarkTheme(),
        home: DashboardView(
          name: name,
          dashboard: dashboard,
          setTitle: setTitle,
          setId: setId,
          libraryLoading: libraryLoading,
          now: DateTime(2026, 10, 1, 10),
          onRefresh: onRefresh ?? () async {},
          onOpenSets: () {},
          onOpenSet: onOpenSet ?? (_, _) {},
        ),
      ),
    ),
  );
  await tester.pump();
}

RetentionSummary _summary({
  int reviewsToday = 0,
  int dailyGoal = 20,
  int totalXp = 0,
}) {
  return RetentionSummary(
    date: DateTime(2026, 10, 1),
    dailyGoal: dailyGoal,
    reviewsToday: reviewsToday,
    correctToday: 0,
    xpToday: 0,
    goalCompleted: reviewsToday >= dailyGoal,
    currentStreakDays: 0,
    longestStreakDays: 4,
    freezesLeft: 2,
    totalXp: totalXp,
    level: 1,
  );
}

List<ActivityDay> _activity(DateTime today, {bool frozen = false}) {
  return [
    ActivityDay(
      date: DateTime(today.year, today.month, today.day - 1),
      reviewsCount: frozen ? 0 : 20,
      correctCount: frozen ? 0 : 18,
      xpEarned: frozen ? 0 : 40,
      goalReached: !frozen,
      isFrozen: frozen,
    ),
  ];
}
