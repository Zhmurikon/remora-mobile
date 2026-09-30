import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'library_provider.dart';
import 'list_sort.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(libraryProvider);
    final notifier = ref.read(libraryProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Наборы'),
        actions: [
          if (!state.isOnline)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.cloud_off,
                color: theme.colorScheme.error,
                semanticLabel: 'Нет сети',
              ),
            ),
          IconButton(
            onPressed: () => context.go('/catalog'),
            tooltip: 'Открыть каталог',
            icon: const Icon(Icons.search),
          ),
          const ListSortButton(storageKey: 'sets'),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: notifier.refresh,
        child: _buildBody(context, ref, state, notifier),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    LibraryState state,
    LibraryNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final sortMode = ref.watch(listSortProvider('sets'));
    final customOrder = ref.watch(listOrderProvider('sets'));
    final sortedSets = sortList(
      state.sets,
      sortMode,
      id: (set) => set.id,
      title: (set) => set.title,
      updatedAt: (set) => set.updatedAt,
      size: (set) => set.cardsCount,
      customOrder: customOrder,
    );
    if (state.isLoading && state.sets.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.sets.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 120),
          Icon(
            Icons.library_books_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            state.isOnline
                ? 'У вас пока нет наборов.\nСоздайте набор на сайте.'
                : 'Нет подключения к сети.\nПодключитесь, чтобы загрузить наборы.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          if (state.isOnline)
            Center(
              child: FilledButton.icon(
                onPressed: notifier.refresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Обновить'),
              ),
            ),
        ],
      );
    }

    Widget buildSetTile(int index, {required bool reorderable}) {
      final set = sortedSets[index];
      final isDownloading = state.downloadingSetIds.contains(set.id);
      final isDownloaded = state.downloadedSetIds.contains(set.id);
      final hasUpdate = state.outdatedSetIds.contains(set.id);

      return Card(
        key: ValueKey(set.id),
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: reorderable
              ? ReorderableDragStartListener(
                  index: index,
                  child: Semantics(
                    button: true,
                    label: 'Изменить место набора «${set.title}»',
                    child: const SizedBox(
                      width: 44,
                      height: 44,
                      child: Icon(Icons.drag_handle),
                    ),
                  ),
                )
              : null,
          title: Text(set.title),
          subtitle: Text.rich(
            TextSpan(
              text: '${set.cardsCount} ${_cardWord(set.cardsCount)}',
              children: [
                if (set.isSaved)
                  TextSpan(
                    text: set.courseTitle == null
                        ? ' · Сохранённый набор'
                        : ' · ${set.courseTitle}',
                  ),
                if (hasUpdate)
                  TextSpan(
                    text: ' · Доступно обновление',
                    style: TextStyle(color: theme.colorScheme.tertiary),
                  ),
                if (set.isSaved && set.hasUpdates)
                  TextSpan(
                    text: ' · Оригинал обновлён',
                    style: TextStyle(color: theme.colorScheme.tertiary),
                  ),
              ],
            ),
            style: theme.textTheme.bodySmall,
          ),
          trailing: isDownloading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : isDownloaded && !hasUpdate
              ? const Icon(Icons.download_done, semanticLabel: 'Скачано')
              : IconButton(
                  icon: Icon(
                    hasUpdate
                        ? Icons.system_update_alt
                        : Icons.download_outlined,
                  ),
                  tooltip: hasUpdate
                      ? 'Обновить скачанный набор'
                      : 'Скачать для офлайна',
                  onPressed: state.isOnline
                      ? () => notifier.downloadSet(set.id)
                      : null,
                ),
          onTap: () {
            context.push(
              '/set/${set.id}/study?title=${Uri.encodeComponent(set.title)}',
            );
          },
        ),
      );
    }

    final header = Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        '${state.sets.length} ${_setWord(state.sets.length)} · нажмите, чтобы учиться',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
    if (sortMode == ListSortMode.custom) {
      return ReorderableListView.builder(
        padding: const EdgeInsets.all(16),
        header: header,
        buildDefaultDragHandles: false,
        itemCount: sortedSets.length,
        itemBuilder: (context, index) => buildSetTile(index, reorderable: true),
        onReorderItem: (oldIndex, newIndex) {
          final reordered = [...sortedSets];
          final moved = reordered.removeAt(oldIndex);
          reordered.insert(newIndex, moved);
          ref
              .read(listOrderProvider('sets').notifier)
              .set(reordered.map((set) => set.id).toList());
        },
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedSets.length + 1,
      itemBuilder: (context, index) =>
          index == 0 ? header : buildSetTile(index - 1, reorderable: false),
    );
  }

  String _cardWord(int count) {
    final mod10 = count % 10;
    final mod100 = count % 100;
    if (mod10 == 1 && mod100 != 11) return 'карточка';
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
      return 'карточки';
    }
    return 'карточек';
  }

  String _setWord(int count) {
    final mod10 = count % 10;
    final mod100 = count % 100;
    if (mod10 == 1 && mod100 != 11) return 'набор';
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
      return 'набора';
    }
    return 'наборов';
  }
}
