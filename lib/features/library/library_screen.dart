import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'library_provider.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(libraryProvider);
    final notifier = ref.read(libraryProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя библиотека'),
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
            icon: const Icon(Icons.person_outline),
            tooltip: 'Профиль',
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: notifier.refresh,
        child: _buildBody(context, state, notifier),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    LibraryState state,
    LibraryNotifier notifier,
  ) {
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.sets.length,
      itemBuilder: (context, index) {
        final set = state.sets[index];
        final isDownloading = state.downloadingSetIds.contains(set.id);

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(set.title),
            subtitle: Text(
              '${set.cardsCount} ${_cardWord(set.cardsCount)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: isDownloading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : IconButton(
                    icon: const Icon(Icons.download_outlined),
                    tooltip: 'Скачать для офлайна',
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
      },
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
}
