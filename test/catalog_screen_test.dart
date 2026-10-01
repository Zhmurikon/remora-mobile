import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/features/catalog/catalog_provider.dart';
import 'package:remora_mobile/features/catalog/catalog_screen.dart';

void main() {
  CourseSearchItem course({
    String id = 'python',
    String title = 'Python для анализа данных',
    String description = 'От основ Python до анализа реальных данных',
    String author = 'Алексей Кузнецов',
    List<String> tags = const ['Программирование'],
    int saves = 12400,
  }) => CourseSearchItem(
    id: id,
    slug: id,
    title: title,
    description: description,
    tags: tags,
    author: author,
    languages: const ['ru'],
    cardsCount: 120,
    savesCount: saves,
    updatedAt: DateTime(2026),
  );

  Future<void> pumpCatalog(
    WidgetTester tester, {
    required CatalogState state,
    double textScale = 1,
    Future<void> Function()? onSearch,
    Future<void> Function()? onLoadMore,
    ValueChanged<CourseSearchItem>? onOpen,
    Future<bool> Function(String)? onSave,
  }) async {
    final searchController = TextEditingController(text: state.query);
    final scrollController = ScrollController();
    await tester.pumpWidget(
      MaterialApp(
        theme: remoraLightTheme(),
        darkTheme: remoraDarkTheme(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: CatalogView(
          state: state,
          searchController: searchController,
          scrollController: scrollController,
          onQueryChanged: (_) {},
          onSearch: onSearch ?? () async {},
          onLoadMore: onLoadMore ?? () async {},
          onOpenCourse: onOpen ?? (_) {},
          onSave: onSave ?? (_) async => true,
          onRemove: (_) {},
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('поиск идёт первым, ведущий курс использует реальные данные', (
    tester,
  ) async {
    final items = [
      course(),
      course(
        id: 'philosophy',
        title: 'Философия: от античности до современности',
        author: 'Мария Соколова',
        tags: const ['Философия'],
      ),
    ];
    await pumpCatalog(
      tester,
      state: CatalogState(items: items, isLoading: false),
    );

    expect(find.text('Каталог'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    final search = tester.widget<TextField>(find.byType(TextField));
    expect(search.textAlignVertical, TextAlignVertical.center);
    expect(find.text('Популярные курсы'), findsOneWidget);
    expect(find.text('Python для анализа данных'), findsOneWidget);
    expect(
      find.text('Философия: от античности до современности'),
      findsOneWidget,
    );
    expect(find.text('12.4K'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('длинный запрос и длинные данные выдерживают масштаб 2,0', (
    tester,
  ) async {
    final item = course(
      title: 'Очень длинное название публичного курса по анализу данных',
      description:
          'Подробное описание курса, которое занимает несколько строк и не ломает композицию',
      author: 'Автор с очень длинным именем и фамилией',
    );
    await pumpCatalog(
      tester,
      state: CatalogState(
        items: [item],
        query: 'длинный запрос для поиска подходящего курса',
        isLoading: false,
      ),
      textScale: 2,
    );

    expect(find.text('Результаты поиска'), findsOneWidget);
    expect(find.byTooltip('Очистить поиск'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('показывает загрузку, пустую выдачу и офлайн-состояние', (
    tester,
  ) async {
    await pumpCatalog(tester, state: const CatalogState(isLoading: true));
    expect(find.byType(LinearProgressIndicator), findsNothing);

    await pumpCatalog(
      tester,
      state: const CatalogState(isLoading: false, query: 'ничего'),
    );
    expect(find.text('Ничего не найдено'), findsOneWidget);

    var retried = false;
    await pumpCatalog(
      tester,
      state: const CatalogState(isLoading: false, isOffline: true),
      onSearch: () async => retried = true,
    );
    expect(find.text('Каталог доступен только онлайн'), findsOneWidget);
    expect(find.text('Популярные курсы'), findsNothing);
    await tester.tap(find.text('Повторить'));
    expect(retried, isTrue);

    await pumpCatalog(
      tester,
      state: const CatalogState(
        isLoading: false,
        loadError: 'Не удалось загрузить каталог.',
      ),
    );
    expect(find.text('Не удалось загрузить каталог'), findsOneWidget);
    expect(find.text('Каталог доступен только онлайн'), findsNothing);
  });

  testWidgets('открывает курс и сохраняет его прямым действием', (
    tester,
  ) async {
    final item = course();
    CourseSearchItem? opened;
    String? saved;
    await pumpCatalog(
      tester,
      state: CatalogState(items: [item], isLoading: false),
      onOpen: (value) => opened = value,
      onSave: (id) async {
        saved = id;
        return true;
      },
    );

    await tester.tap(find.text('Открыть курс'));
    expect(opened?.id, item.id);

    await tester.tap(find.byTooltip('Сохранить курс'));
    expect(saved, item.id);
  });

  testWidgets('предлагает продолжение пагинации и вызывает загрузку', (
    tester,
  ) async {
    var loaded = false;
    await pumpCatalog(
      tester,
      state: CatalogState(items: [course()], nextCursor: 20, isLoading: false),
      onLoadMore: () async => loaded = true,
    );

    await tester.scrollUntilVisible(
      find.text('Показать ещё'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Показать ещё'));
    expect(loaded, isTrue);
  });
}
