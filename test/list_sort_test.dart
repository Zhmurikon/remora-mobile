import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/library/list_sort.dart';

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
}
