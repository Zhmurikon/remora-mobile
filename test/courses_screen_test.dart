import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/features/courses/courses_provider.dart';
import 'package:remora_mobile/features/courses/courses_screen.dart';

void main() {
  testWidgets('длинный курс выдерживает масштаб текста 1,3', (tester) async {
    await _pumpCourses(
      tester,
      textScale: 1.3,
      courses: [
        _course(
          title:
              'Сбор и анализ данных в Python — неделя первая и очень длинное продолжение',
          description:
              'Подробный конспект курса для инженера сопровождения с примерами и практикой.',
        ),
      ],
    );

    expect(find.textContaining('Сбор и анализ данных'), findsOneWidget);
    expect(find.text('Скачать для офлайна'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('скачанный сохранённый курс показывает оба статуса', (
    tester,
  ) async {
    final course = _course(isSaved: true);
    await _pumpCourses(tester, courses: [course], downloadedIds: {course.id});

    expect(find.text('Сохранённый курс'), findsOneWidget);
    expect(find.text('Доступен офлайн'), findsOneWidget);
  });

  testWidgets('пустое онлайн-состояние ведёт в каталог', (tester) async {
    var searches = 0;
    await _pumpCourses(tester, courses: const [], onSearch: () => searches++);

    expect(find.text('Курсов пока нет'), findsOneWidget);
    await tester.tap(find.text('Найти курс'));
    expect(searches, 1);
  });

  testWidgets('офлайн-состояние объясняет отсутствие курсов', (tester) async {
    await _pumpCourses(tester, courses: const [], isOnline: false);

    expect(find.text('Курсы недоступны офлайн'), findsOneWidget);
    expect(find.textContaining('Подключитесь к сети'), findsOneWidget);
  });

  testWidgets('обновление офлайн-копии вызывает загрузку курса', (
    tester,
  ) async {
    var downloaded = '';
    final course = _course(hasUpdates: true);
    await _pumpCourses(
      tester,
      courses: [course],
      downloadedIds: {course.id},
      outdatedIds: {course.id},
      onDownload: (id) => downloaded = id,
    );

    await tester.tap(find.text('Обновить офлайн-копию'));
    expect(downloaded, course.id);
  });

  testWidgets(
    'обновление оригинала не помечает актуальную офлайн-копию устаревшей',
    (tester) async {
      final course = _course(isSaved: true, hasUpdates: true);
      await _pumpCourses(tester, courses: [course], downloadedIds: {course.id});

      expect(find.text('Доступен офлайн'), findsOneWidget);
      expect(find.text('Обновить офлайн-копию'), findsNothing);
      expect(find.text('У автора есть непринятое обновление'), findsOneWidget);
    },
  );

  testWidgets('строка курса и pull-to-refresh вызывают колбэки', (
    tester,
  ) async {
    var opened = '';
    var refreshes = 0;
    final course = _course();
    await _pumpCourses(
      tester,
      courses: [course],
      onOpenCourse: (value) => opened = value.id,
      onRefresh: () async => refreshes++,
    );

    await tester.tap(find.text(course.title));
    expect(opened, course.id);
    await tester.drag(find.byType(ListView), const Offset(0, 400));
    await tester.pumpAndSettle();
    expect(refreshes, 1);
  });
}

Future<void> _pumpCourses(
  WidgetTester tester, {
  required List<CourseRecord> courses,
  bool isOnline = true,
  double textScale = 1,
  Set<String> downloadedIds = const {},
  Set<String> outdatedIds = const {},
  void Function()? onSearch,
  void Function(String id)? onDownload,
  void Function(CourseRecord course)? onOpenCourse,
  Future<void> Function()? onRefresh,
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
        home: CoursesView(
          state: CoursesListState(
            courses: courses,
            isLoading: false,
            isOnline: isOnline,
            downloadedCourseIds: downloadedIds,
            outdatedCourseIds: outdatedIds,
          ),
          courses: courses,
          customOrder: false,
          sortAction: const SizedBox.square(dimension: 48),
          onRefresh: onRefresh ?? () async {},
          onSearch: onSearch ?? () {},
          onOpenCourse: onOpenCourse ?? (_) {},
          onDownload: onDownload ?? (_) {},
          onReorder: (_, _) {},
        ),
      ),
    ),
  );
  await tester.pump();
}

CourseRecord _course({
  String title = 'Сбор и анализ данных в Python',
  String description = 'Конспект первой недели курса.',
  bool isSaved = false,
  bool hasUpdates = false,
}) {
  return CourseRecord(
    id: 'course-1',
    slug: 'python-data',
    title: title,
    description: description,
    authorName: 'Remora',
    isPublished: true,
    isSaved: isSaved,
    hasUpdates: hasUpdates,
    updatedAt: DateTime(2026, 10, 1),
  );
}
