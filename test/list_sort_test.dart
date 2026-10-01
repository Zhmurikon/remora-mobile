import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/library/list_sort.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final items = [
    (title: 'Бета', updated: DateTime(2026, 1, 1), size: 2),
    (title: 'Альфа', updated: DateTime(2026, 3, 1), size: 7),
    (title: 'Гамма', updated: DateTime(2026, 2, 1), size: 4),
  ];

  test('сортирует списки по дате, названию и размеру', () {
    final newest = sortList(
      items,
      ListSortMode.updatedDesc,
      id: (item) => item.title,
      title: (item) => item.title,
      updatedAt: (item) => item.updated,
      size: (item) => item.size,
    );
    expect(newest.map((item) => item.title), ['Альфа', 'Гамма', 'Бета']);

    final alphabet = sortList(
      items,
      ListSortMode.titleAsc,
      id: (item) => item.title,
      title: (item) => item.title,
      updatedAt: (item) => item.updated,
    );
    expect(alphabet.map((item) => item.title), ['Альфа', 'Бета', 'Гамма']);

    final largest = sortList(
      items,
      ListSortMode.sizeDesc,
      id: (item) => item.title,
      title: (item) => item.title,
      updatedAt: (item) => item.updated,
      size: (item) => item.size,
    );
    expect(largest.map((item) => item.size), [7, 4, 2]);
  });

  test('в ручном режиме новые элементы оказываются сверху', () {
    final custom = sortList(
      items,
      ListSortMode.custom,
      id: (item) => item.title,
      title: (item) => item.title,
      updatedAt: (item) => item.updated,
      customOrder: ['Бета', 'Альфа'],
    );
    expect(custom.map((item) => item.title), ['Гамма', 'Бета', 'Альфа']);
  });

  test('ручной порядок включён по умолчанию', () {
    final notifier = ListSortNotifier();
    expect(notifier.state, ListSortMode.custom);
    notifier.set(ListSortMode.titleAsc);
    expect(notifier.state, ListSortMode.titleAsc);
  });

  test('выбранная сортировка сохраняется отдельно для списка', () async {
    SharedPreferences.setMockInitialValues({
      'list_sort_sets': ListSortMode.titleAsc.name,
    });
    final preferences = await SharedPreferences.getInstance();
    final notifier = ListSortNotifier(preferences, 'list_sort_sets');

    expect(notifier.state, ListSortMode.titleAsc);
    await notifier.set(ListSortMode.sizeDesc);
    expect(preferences.getString('list_sort_sets'), ListSortMode.sizeDesc.name);
  });

  test('переставляет элемент без изменения исходного списка', () {
    final source = ['a', 'b', 'c'];
    expect(reorderListItem(source, 0, 2), ['b', 'c', 'a']);
    expect(source, ['a', 'b', 'c']);
  });

  testWidgets('вся карточка запускает перенос долгим нажатием без ручки', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ReorderableListView(
          onReorderItem: (_, _) {},
          buildDefaultDragHandles: false,
          children: const [
            ReorderableCard(
              key: ValueKey('card'),
              index: 0,
              label: 'Набор «Алгебра»',
              child: Card(child: ListTile(title: Text('Алгебра'))),
            ),
          ],
        ),
      ),
    );

    expect(find.byType(ReorderableDelayedDragStartListener), findsOneWidget);
    expect(find.byIcon(Icons.drag_handle), findsNothing);
  });
}
