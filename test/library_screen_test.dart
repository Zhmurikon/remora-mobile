import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/features/library/library_provider.dart';
import 'package:remora_mobile/features/library/library_screen.dart';

void main() {
  SetRecord set({
    String id = 'set-1',
    String title = 'Сбор и анализ данных в Python',
    int cardsCount = 173,
    bool isSaved = false,
    bool hasUpdates = false,
    String? courseTitle,
  }) => SetRecord(
    id: id,
    title: title,
    description: '',
    visibility: 'private',
    slug: id,
    cardsCount: cardsCount,
    langTerm: 'ru',
    langDefinition: 'ru',
    isSaved: isSaved,
    courseTitle: courseTitle,
    hasUpdates: hasUpdates,
    createdAt: DateTime(2026),
    updatedAt: DateTime(2026, 2),
  );

  LibraryState state({
    List<SetRecord> sets = const [],
    bool isLoading = false,
    bool isOnline = true,
    Set<String> downloading = const {},
    Set<String> downloaded = const {},
    Set<String> outdated = const {},
    String? error,
  }) => LibraryState(
    sets: sets,
    isLoading: isLoading,
    isOnline: isOnline,
    downloadingSetIds: downloading,
    downloadedSetIds: downloaded,
    outdatedSetIds: outdated,
    error: error,
  );

  Future<void> pumpView(
    WidgetTester tester, {
    required LibraryState value,
    List<SetRecord>? sets,
    bool customOrder = false,
    ThemeMode themeMode = ThemeMode.light,
    double textScale = 1,
    VoidCallback? onSearch,
    void Function(SetRecord)? onOpen,
    void Function(String)? onDownload,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: remoraLightTheme(),
        darkTheme: remoraDarkTheme(),
        themeMode: themeMode,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: LibraryView(
          state: value,
          sets: sets ?? value.sets,
          customOrder: customOrder,
          sortAction: IconButton(
            onPressed: () {},
            tooltip: 'Сортировка',
            icon: const Icon(Icons.sort_rounded),
          ),
          onRefresh: () async {},
          onSearch: onSearch ?? () {},
          onOpenSet: onOpen ?? (_) {},
          onDownload: onDownload ?? (_) {},
          onReorder: (_, _) {},
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
    'показывает плотный список и выдерживает длинное название при 1,3',
    (tester) async {
      final longSet = set(
        title:
            'Очень длинное название набора по визуализации, статистике и анализу данных',
        cardsCount: 14,
        courseTitle: 'Python-справочник курса',
      );
      await pumpView(tester, value: state(sets: [longSet]), textScale: 1.3);

      expect(find.text('Наборы'), findsOneWidget);
      expect(find.text('Наборов: 1'), findsOneWidget);
      expect(find.textContaining('Очень длинное название'), findsOneWidget);
      expect(find.textContaining('14 карточек'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('различает скачанный набор, загрузку и доступное обновление', (
    tester,
  ) async {
    final items = [
      set(id: 'ready', title: 'Скачанный'),
      set(id: 'loading', title: 'Загрузка'),
      set(id: 'update', title: 'Обновление'),
    ];
    await pumpView(
      tester,
      value: state(
        sets: items,
        downloaded: {'ready', 'update'},
        downloading: {'loading'},
        outdated: {'update'},
      ),
    );

    expect(find.bySemanticsLabel('Доступен офлайн'), findsOneWidget);
    expect(find.bySemanticsLabel('Скачиваем набор'), findsOneWidget);
    expect(find.byTooltip('Обновить офлайн-копию'), findsOneWidget);
  });

  testWidgets(
    'пустое состояние ведёт к обновлению, офлайн не обещает действие',
    (tester) async {
      var refreshed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: remoraLightTheme(),
          home: LibraryView(
            state: state(),
            sets: const [],
            customOrder: false,
            sortAction: const SizedBox.shrink(),
            onRefresh: () async => refreshed = true,
            onSearch: () {},
            onOpenSet: (_) {},
            onDownload: (_) {},
            onReorder: (_, _) {},
          ),
        ),
      );
      await tester.tap(find.text('Обновить'));
      expect(refreshed, isTrue);

      await pumpView(tester, value: state(isOnline: false));
      expect(find.text('Наборы недоступны офлайн'), findsOneWidget);
      expect(find.text('Обновить'), findsNothing);
    },
  );

  testWidgets('открывает набор и запускает скачивание отдельными действиями', (
    tester,
  ) async {
    final item = set();
    SetRecord? opened;
    String? downloaded;
    await pumpView(
      tester,
      value: state(sets: [item]),
      onOpen: (value) => opened = value,
      onDownload: (id) => downloaded = id,
    );

    await tester.tap(find.bySemanticsLabel(RegExp('Набор «Сбор')));
    expect(opened?.id, item.id);
    await tester.tap(find.byTooltip('Скачать для офлайна'));
    expect(downloaded, item.id);
  });

  testWidgets('ручной порядок использует всю карточку без видимой ручки', (
    tester,
  ) async {
    final items = [set(id: 'a'), set(id: 'b', title: 'Второй набор')];
    await pumpView(tester, value: state(sets: items), customOrder: true);

    expect(
      find.text('Удерживайте карточку, чтобы изменить порядок'),
      findsOneWidget,
    );
    expect(find.byType(ReorderableDelayedDragStartListener), findsNWidgets(2));
    expect(find.byIcon(Icons.drag_handle), findsNothing);
  });

  testWidgets('лениво показывает библиотеку из ста наборов', (tester) async {
    final items = List.generate(
      120,
      (index) =>
          set(id: 'set-$index', title: 'Набор $index', cardsCount: index + 1),
    );
    await pumpView(
      tester,
      value: state(sets: items),
      sets: items,
    );

    expect(find.text('Наборов: 120'), findsOneWidget);
    expect(find.text('Набор 0'), findsOneWidget);
    await tester.fling(find.byType(ListView), const Offset(0, -900), 1200);
    await tester.pumpAndSettle();
    expect(find.text('Набор 0'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
