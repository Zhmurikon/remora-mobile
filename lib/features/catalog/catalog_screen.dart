import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/api_client.dart';
import 'catalog_provider.dart';

/// Онлайн-каталог публичных материалов.
class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(catalogProvider);
    ref.listen(catalogProvider.select((value) => value.error), (_, error) {
      if (error == null) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      ref.read(catalogProvider.notifier).clearError();
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Каталог')),
      body: RefreshIndicator(
        onRefresh: ref.read(catalogProvider.notifier).search,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              sliver: SliverToBoxAdapter(
                child: SearchBar(
                  hintText: 'Поиск курсов',
                  leading: const Icon(Icons.search),
                  onChanged: ref.read(catalogProvider.notifier).setQuery,
                  onSubmitted: (_) =>
                      ref.read(catalogProvider.notifier).search(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      state.query.trim().isEmpty
                          ? 'Популярные курсы'
                          : 'Результаты поиска',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    if (state.isLoading)
                      const SizedBox.square(
                        dimension: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  ],
                ),
              ),
            ),
            if (state.isOffline)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: _CatalogOffline(),
              )
            else if (!state.isLoading && state.items.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: _CatalogEmpty(),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                sliver: SliverList.separated(
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      _CourseCard(item: state.items[index]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends ConsumerWidget {
  const _CourseCard({required this.item});

  final CourseSearchItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(catalogProvider);
    final notifier = ref.read(catalogProvider.notifier);
    final isSaved = state.savedCourseIds.contains(item.id);
    final isOwned = state.ownedCourseIds.contains(item.id);
    final isBusy = state.busyCourseIds.contains(item.id);
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push(
          '/course/${item.id}?title=${Uri.encodeComponent(item.title)}',
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Автор: ${item.author}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
              if (item.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 6,
                children: [
                  _Meta(
                    icon: Icons.style_outlined,
                    text: '${item.cardsCount} карточек',
                  ),
                  _Meta(
                    icon: Icons.bookmark_outline,
                    text: '${item.savesCount} сохранений',
                  ),
                  for (final tag in item.tags.take(2)) Chip(label: Text(tag)),
                ],
              ),
              if (!isOwned) ...[
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: isBusy
                            ? null
                            : isSaved
                            ? () => _confirmRemove(context, notifier)
                            : () => notifier.saveCourse(item.id),
                        icon: isBusy
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Icon(
                                isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                              ),
                        label: Text(isSaved ? 'Сохранён' : 'Сохранить'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filledTonal(
                      onPressed: isBusy
                          ? null
                          : () => _confirmCopy(context, notifier),
                      tooltip: 'Создать независимую копию',
                      icon: const Icon(Icons.content_copy_outlined),
                    ),
                  ],
                ),
              ] else ...[
                const SizedBox(height: 12),
                Text('Ваш курс', style: Theme.of(context).textTheme.labelLarge),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmRemove(
    BuildContext context,
    CatalogNotifier notifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Убрать из сохранённых?'),
        content: const Text(
          'Курс исчезнет из библиотеки. Уже скачанные данные удалятся при синхронизации.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Убрать'),
          ),
        ],
      ),
    );
    if (confirmed == true) await notifier.removeCourse(item.id);
  }

  Future<void> _confirmCopy(
    BuildContext context,
    CatalogNotifier notifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Создать копию курса?'),
        content: const Text(
          'Появится отдельный приватный курс. Его можно менять независимо от оригинала.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Создать копию'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final copied = await notifier.copyCourse(item.id);
    if (copied != null && context.mounted) {
      context.push(
        '/course/${copied.id}?title=${Uri.encodeComponent(copied.title)}',
      );
    }
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _CatalogOffline extends ConsumerWidget {
  const _CatalogOffline();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_outlined, size: 64),
            const SizedBox(height: 16),
            Text(
              'Каталог доступен только онлайн',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Скачанные материалы находятся во вкладках «Курсы» и «Наборы».',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: ref.read(catalogProvider.notifier).search,
              icon: const Icon(Icons.refresh),
              label: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CatalogEmpty extends StatelessWidget {
  const _CatalogEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64),
            const SizedBox(height: 16),
            Text(
              'Ничего не найдено',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Попробуйте изменить запрос.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
