import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/preferences.dart';

enum ListSortMode {
  updatedDesc,
  updatedAsc,
  titleAsc,
  titleDesc,
  sizeDesc,
  sizeAsc,
}

extension ListSortModeLabel on ListSortMode {
  String get label => switch (this) {
    ListSortMode.updatedDesc => 'Сначала новые',
    ListSortMode.updatedAsc => 'Сначала старые',
    ListSortMode.titleAsc => 'По названию: А—Я',
    ListSortMode.titleDesc => 'По названию: Я—А',
    ListSortMode.sizeDesc => 'Сначала большие',
    ListSortMode.sizeAsc => 'Сначала маленькие',
  };
}

class ListSortNotifier extends StateNotifier<ListSortMode> {
  ListSortNotifier(this._prefs, this._key)
    : super(
        ListSortMode.values.firstWhere(
          (mode) => mode.name == _prefs.getString(_key),
          orElse: () => ListSortMode.updatedDesc,
        ),
      );

  final SharedPreferences _prefs;
  final String _key;

  Future<void> set(ListSortMode mode) async {
    state = mode;
    await _prefs.setString(_key, mode.name);
  }
}

final listSortProvider =
    StateNotifierProvider.family<ListSortNotifier, ListSortMode, String>(
      (ref, key) => ListSortNotifier(
        ref.watch(sharedPreferencesProvider),
        'list_sort_$key',
      ),
    );

List<T> sortList<T>(
  Iterable<T> items,
  ListSortMode mode, {
  required String Function(T) title,
  required DateTime Function(T) updatedAt,
  int Function(T)? size,
}) {
  final result = [...items];
  result.sort((left, right) {
    if (mode == ListSortMode.titleAsc) {
      return title(left).compareTo(title(right));
    }
    if (mode == ListSortMode.titleDesc) {
      return title(right).compareTo(title(left));
    }
    if (mode == ListSortMode.sizeDesc && size != null) {
      return size(right).compareTo(size(left));
    }
    if (mode == ListSortMode.sizeAsc && size != null) {
      return size(left).compareTo(size(right));
    }
    return mode == ListSortMode.updatedAsc
        ? updatedAt(left).compareTo(updatedAt(right))
        : updatedAt(right).compareTo(updatedAt(left));
  });
  return result;
}

class ListSortButton extends ConsumerWidget {
  const ListSortButton({
    super.key,
    required this.storageKey,
    this.includeSize = true,
  });

  final String storageKey;
  final bool includeSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(listSortProvider(storageKey));
    final modes = ListSortMode.values.where(
      (mode) =>
          includeSize ||
          (mode != ListSortMode.sizeDesc && mode != ListSortMode.sizeAsc),
    );
    return PopupMenuButton<ListSortMode>(
      tooltip: 'Сортировка: ${selected.label}',
      icon: const Icon(Icons.sort),
      initialValue: selected,
      onSelected: (mode) =>
          ref.read(listSortProvider(storageKey).notifier).set(mode),
      itemBuilder: (context) => [
        for (final mode in modes)
          PopupMenuItem(
            value: mode,
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  child: mode == selected ? const Icon(Icons.check) : null,
                ),
                Expanded(child: Text(mode.label)),
              ],
            ),
          ),
      ],
    );
  }
}
