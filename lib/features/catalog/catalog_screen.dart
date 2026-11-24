import 'package:flutter/material.dart';

import '../../widgets/ink_motion.dart';
import '../../widgets/ink_illustration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import '../../widgets/remora_components.dart';
import 'catalog_provider.dart';

/// Онлайн-каталог публичных материалов.
class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  late final TextEditingController _searchController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(catalogProvider).query,
    );
    _scrollController.addListener(_loadMoreNearEdge);
  }

  void _loadMoreNearEdge() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.extentAfter < 420) {
      ref.read(catalogProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_loadMoreNearEdge)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(catalogProvider);
    final notifier = ref.read(catalogProvider.notifier);
    ref.listen(catalogProvider.select((value) => value.error), (_, error) {
      if (error == null) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      notifier.clearError();
    });

    return CatalogView(
      state: state,
      searchController: _searchController,
      scrollController: _scrollController,
      onQueryChanged: notifier.setQuery,
      onSearch: notifier.search,
      onLoadMore: notifier.loadMore,
      onOpenCourse: (item) => context.push(
        '/course/${item.id}?title=${Uri.encodeComponent(item.title)}',
      ),
      onSave: notifier.saveCourse,
      onRemove: (item) => _confirmRemove(context, notifier, item),
    );
  }

  Future<void> _confirmRemove(
    BuildContext context,
    CatalogNotifier notifier,
    CourseSearchItem item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      animationStyle: InkMotion.styleOf(context),
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
}

class CatalogView extends StatelessWidget {
  const CatalogView({
    required this.state,
    required this.searchController,
    required this.scrollController,
    required this.onQueryChanged,
    required this.onSearch,
    required this.onLoadMore,
    required this.onOpenCourse,
    required this.onSave,
    required this.onRemove,
    super.key,
  });

  final CatalogState state;
  final TextEditingController searchController;
  final ScrollController scrollController;
  final ValueChanged<String> onQueryChanged;
  final Future<void> Function() onSearch;
  final Future<void> Function() onLoadMore;
  final ValueChanged<CourseSearchItem> onOpenCourse;
  final Future<bool> Function(String courseId) onSave;
  final ValueChanged<CourseSearchItem> onRemove;

  @override
  Widget build(BuildContext context) {
    final querying = state.query.trim().isNotEmpty;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: onSearch,
          child: CustomScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  RemoraSpacing.lg,
                  RemoraSpacing.sm,
                  RemoraSpacing.lg,
                  0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Каталог',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  RemoraSpacing.md,
                  RemoraSpacing.md,
                  RemoraSpacing.md,
                  RemoraSpacing.lg,
                ),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 56,
                    child: TextField(
                      controller: searchController,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Поиск курсов',
                        filled: true,
                        fillColor: context.remora.surfaceMuted,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: const Icon(Icons.search_rounded),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 56,
                          minHeight: 56,
                        ),
                        suffixIcon: state.query.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  onQueryChanged('');
                                },
                                tooltip: 'Очистить поиск',
                                icon: const Icon(Icons.close_rounded),
                              ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: onQueryChanged,
                      onSubmitted: (_) => onSearch(),
                    ),
                  ),
                ),
              ),
              if (state.items.isNotEmpty || state.isLoading)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    RemoraSpacing.md,
                    0,
                    RemoraSpacing.md,
                    RemoraSpacing.sm,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            querying ? 'Результаты поиска' : 'Популярные курсы',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        if (state.isLoading && state.items.isNotEmpty)
                          const SizedBox.square(
                            dimension: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      ],
                    ),
                  ),
                ),
              ..._contentSlivers(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _contentSlivers(BuildContext context) {
    if (state.isLoading && state.items.isEmpty) {
      return const [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
          sliver: SliverToBoxAdapter(child: _CatalogSkeleton()),
        ),
      ];
    }
    if (state.isOffline && state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.md),
            child: RemoraStateView.error(
              title: 'Каталог доступен только онлайн',
              message:
                  'Скачанные материалы находятся во вкладках «Курсы» и «Наборы».',
              onAction: onSearch,
            ),
          ),
        ),
      ];
    }
    if (state.loadError != null && state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.md),
            child: RemoraStateView.error(
              title: 'Не удалось загрузить каталог',
              message: 'Сервис временно недоступен. Повторите попытку.',
              onAction: onSearch,
            ),
          ),
        ),
      ];
    }
    if (!state.isLoading && state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.md),
            child: RemoraStateView.empty(
              title: 'Ничего не найдено',
              message: state.query.trim().isEmpty
                  ? 'В каталоге пока нет опубликованных курсов.'
                  : 'Попробуйте изменить запрос или очистить поиск.',
              icon: Icons.search_off_rounded,
            ),
          ),
        ),
      ];
    }

    final lead = state.items.first;
    final rest = state.items.skip(1).toList();
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          0,
          RemoraSpacing.md,
          RemoraSpacing.sm,
        ),
        sliver: SliverToBoxAdapter(
          child: _FeaturedCourse(
            item: lead,
            isSaved: state.savedCourseIds.contains(lead.id),
            isOwned: state.ownedCourseIds.contains(lead.id),
            isBusy: state.busyCourseIds.contains(lead.id),
            onOpen: () => onOpenCourse(lead),
            onSave: () => onSave(lead.id),
            onRemove: () => onRemove(lead),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          0,
          RemoraSpacing.md,
          RemoraSpacing.xxl,
        ),
        sliver: SliverList.separated(
          itemCount: rest.length,
          separatorBuilder: (_, _) => Divider(
            color: Theme.of(context).colorScheme.outline,
            height: RemoraSpacing.md,
          ),
          itemBuilder: (context, index) {
            final item = rest[index];
            return _CatalogCourseRow(
              item: item,
              isSaved: state.savedCourseIds.contains(item.id),
              isOwned: state.ownedCourseIds.contains(item.id),
              isBusy: state.busyCourseIds.contains(item.id),
              onOpen: () => onOpenCourse(item),
              onSave: () => onSave(item.id),
              onRemove: () => onRemove(item),
            );
          },
        ),
      ),
      if (state.nextCursor != null || state.isLoadingMore)
        SliverPadding(
          padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: state.isLoadingMore
                  ? const CircularProgressIndicator()
                  : TextButton.icon(
                      onPressed: onLoadMore,
                      icon: const Icon(Icons.expand_more_rounded),
                      label: const Text('Показать ещё'),
                    ),
            ),
          ),
        ),
    ];
  }
}

class _FeaturedCourse extends StatelessWidget {
  const _FeaturedCourse({
    required this.item,
    required this.isSaved,
    required this.isOwned,
    required this.isBusy,
    required this.onOpen,
    required this.onSave,
    required this.onRemove,
  });

  final CourseSearchItem item;
  final bool isSaved;
  final bool isOwned;
  final bool isBusy;
  final VoidCallback onOpen;
  final VoidCallback onSave;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      container: true,
      label: 'Рекомендуемый курс «${item.title}», автор ${item.author}',
      child: Material(
        color: context.remora.surfaceMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RemoraRadii.card),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onOpen,
          child: Stack(
            children: [
              PositionedDirectional(
                end: 8,
                bottom: 12,
                child: InkIllustration(
                  InkDrawing.drawer,
                  width: (MediaQuery.sizeOf(context).width * 0.22).clamp(
                    56,
                    120,
                  ),
                  height: 78,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(RemoraSpacing.lg),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 208),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: _CourseActions(
                          isSaved: isSaved,
                          isOwned: isOwned,
                          isBusy: isBusy,
                          onSave: onSave,
                          onRemove: onRemove,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.62,
                        child: Text(
                          item.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.remoraType.readingTitle.copyWith(
                            fontSize: 27,
                            height: 1.08,
                          ),
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xs),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.62,
                        child: Text(
                          item.description.isEmpty
                              ? 'Автор: ${item.author}'
                              : item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.lg),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(width: RemoraSpacing.sm),
                          Expanded(
                            child: Text(
                              isSaved ? 'Продолжить курс' : 'Открыть курс',
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CatalogCourseRow extends StatelessWidget {
  const _CatalogCourseRow({
    required this.item,
    required this.isSaved,
    required this.isOwned,
    required this.isBusy,
    required this.onOpen,
    required this.onSave,
    required this.onRemove,
  });

  final CourseSearchItem item;
  final bool isSaved;
  final bool isOwned;
  final bool isBusy;
  final VoidCallback onOpen;
  final VoidCallback onSave;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final category = item.tags.isEmpty ? null : item.tags.first;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InkIllustration(InkDrawing.notebook, width: 76, height: 82),
        const SizedBox(width: RemoraSpacing.sm),
        Expanded(
          child: Semantics(
            button: true,
            label: 'Курс «${item.title}», автор ${item.author}',
            onTap: onOpen,
            child: ExcludeSemantics(
              child: InkWell(
                onTap: onOpen,
                borderRadius: BorderRadius.circular(RemoraRadii.control),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: RemoraSpacing.xxs),
                      Text(
                        item.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                      if (category != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.remora.textSubtle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 58,
          child: Column(
            children: [
              _CourseActions(
                isSaved: isSaved,
                isOwned: isOwned,
                isBusy: isBusy,
                onSave: onSave,
                onRemove: onRemove,
              ),
              Text(
                _compactCount(item.savesCount),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseActions extends StatelessWidget {
  const _CourseActions({
    required this.isSaved,
    required this.isOwned,
    required this.isBusy,
    required this.onSave,
    required this.onRemove,
  });

  final bool isSaved;
  final bool isOwned;
  final bool isBusy;
  final VoidCallback onSave;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    if (isOwned) {
      return Semantics(
        label: 'Ваш курс',
        child: const Icon(Icons.verified_outlined),
      );
    }
    if (isBusy) {
      return const SizedBox.square(
        dimension: 48,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return IconButton(
      tooltip: isSaved ? 'Убрать из сохранённых' : 'Сохранить курс',
      icon: InkReveal(
        change: isSaved,
        child: Icon(
          isSaved ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
        ),
      ),
      onPressed: isSaved ? onRemove : onSave,
    );
  }
}

class _CatalogSkeleton extends StatelessWidget {
  const _CatalogSkeleton();

  @override
  Widget build(BuildContext context) {
    final color = context.remora.surfaceMuted;
    return Semantics(
      liveRegion: true,
      label: 'Загрузка каталога',
      child: Column(
        children: [
          Container(
            height: 224,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(RemoraRadii.card),
            ),
          ),
          const SizedBox(height: RemoraSpacing.md),
          for (var index = 0; index < 3; index++) ...[
            Row(
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(RemoraRadii.control),
                  ),
                ),
                const SizedBox(width: RemoraSpacing.sm),
                Expanded(child: Container(height: 64, color: color)),
              ],
            ),
            const SizedBox(height: RemoraSpacing.md),
          ],
        ],
      ),
    );
  }
}

String _compactCount(int value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1)}M';
  }
  if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
  return '$value';
}
