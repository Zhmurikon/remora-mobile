import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/db/app_database.dart';
import '../../widgets/remora_components.dart';
import 'library_provider.dart';
import 'list_sort.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(libraryProvider);
    final notifier = ref.read(libraryProvider.notifier);
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

    void persistSetOrder(int oldIndex, int newIndex) {
      final reordered = reorderListItem(sortedSets, oldIndex, newIndex);
      ref
          .read(listOrderProvider('sets').notifier)
          .set(reordered.map((set) => set.id).toList());
    }

    return LibraryView(
      state: state,
      sets: sortedSets,
      customOrder: sortMode == ListSortMode.custom,
      sortAction: const ListSortButton(storageKey: 'sets'),
      onRefresh: notifier.refresh,
      onSearch: () => context.go('/catalog'),
      onOpenSet: (set) => context.push(
        '/set/${set.id}/study?title=${Uri.encodeComponent(set.title)}',
      ),
      onDownload: notifier.downloadSet,
      onReorder: persistSetOrder,
    );
  }
}

/// Чистое представление библиотеки для проверки всех локальных и сетевых состояний.
class LibraryView extends StatelessWidget {
  const LibraryView({
    required this.state,
    required this.sets,
    required this.customOrder,
    required this.sortAction,
    required this.onRefresh,
    required this.onSearch,
    required this.onOpenSet,
    required this.onDownload,
    required this.onReorder,
    super.key,
  });

  final LibraryState state;
  final List<SetRecord> sets;
  final bool customOrder;
  final Widget sortAction;
  final Future<void> Function() onRefresh;
  final VoidCallback onSearch;
  final void Function(SetRecord set) onOpenSet;
  final void Function(String setId) onDownload;
  final void Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    final header = _LibraryHeader(
      count: sets.length,
      isOnline: state.isOnline,
      showReorderHint: customOrder && sets.isNotEmpty,
      sortAction: sortAction,
      onSearch: onSearch,
    );

    final Widget content;
    if (state.isLoading && sets.isEmpty) {
      content = ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        children: [
          header,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
            child: _LibrarySkeleton(),
          ),
        ],
      );
    } else if (sets.isEmpty) {
      content = ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        children: [
          header,
          Padding(
            padding: const EdgeInsets.fromLTRB(
              RemoraSpacing.md,
              RemoraSpacing.xl,
              RemoraSpacing.md,
              0,
            ),
            child: RemoraStateView.empty(
              title: state.isOnline
                  ? 'Наборов пока нет'
                  : 'Наборы недоступны офлайн',
              message: state.isOnline
                  ? 'Создайте набор на сайте или сохраните готовый из каталога.'
                  : 'Подключитесь к сети, чтобы загрузить библиотеку наборов.',
              icon: state.isOnline
                  ? Icons.style_outlined
                  : Icons.cloud_off_outlined,
              actionLabel: state.isOnline ? 'Обновить' : null,
              onAction: state.isOnline ? onRefresh : null,
            ),
          ),
        ],
      );
    } else if (customOrder) {
      content = ReorderableListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [header, ..._statusBanners()],
        ),
        buildDefaultDragHandles: false,
        itemCount: sets.length,
        itemBuilder: (context, index) =>
            _buildSetRow(context, index, reorderable: true),
        proxyDecorator: (child, index, animation) => AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final value = Curves.easeOut.transform(animation.value);
            return Transform.scale(
              scale: 1 + (0.018 * value),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
                  ),
                ),
                child: Material(
                  elevation: 5 * value,
                  shadowColor: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.28),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(RemoraRadii.card),
                  child: child,
                ),
              ),
            );
          },
        ),
        onReorderStart: (_) => HapticFeedback.selectionClick(),
        onReorderItem: onReorder,
      );
    } else {
      content = ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        itemCount: sets.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [header, ..._statusBanners()],
            );
          }
          return _buildSetRow(context, index - 1, reorderable: false);
        },
      );
    }

    return Scaffold(
      body: CustomPaint(
        painter: _LibraryGroundPainter(
          color: Theme.of(context).colorScheme.outlineVariant,
          dark: Theme.of(context).brightness == Brightness.dark,
        ),
        child: SafeArea(
          bottom: false,
          child: RefreshIndicator(onRefresh: onRefresh, child: content),
        ),
      ),
    );
  }

  List<Widget> _statusBanners() => [
    if (state.error != null)
      Padding(
        padding: const EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          0,
          RemoraSpacing.md,
          RemoraSpacing.sm,
        ),
        child: _LibraryNotice.error(message: state.error!),
      ),
  ];

  Widget _buildSetRow(
    BuildContext context,
    int index, {
    required bool reorderable,
  }) {
    final set = sets[index];
    final row = Padding(
      key: reorderable ? null : ValueKey(set.id),
      padding: const EdgeInsets.fromLTRB(
        RemoraSpacing.md,
        0,
        RemoraSpacing.md,
        RemoraSpacing.xs,
      ),
      child: _SetRow(
        set: set,
        markerColor: _markerColor(context, set),
        isOnline: state.isOnline,
        isDownloading: state.downloadingSetIds.contains(set.id),
        isDownloaded: state.downloadedSetIds.contains(set.id),
        isOutdated: state.outdatedSetIds.contains(set.id),
        onTap: () => onOpenSet(set),
        onDownload: () => onDownload(set.id),
      ),
    );
    if (!reorderable) return row;
    return ReorderableCard(
      key: ValueKey(set.id),
      index: index,
      label: 'Набор «${set.title}»',
      onMoveEarlier: index > 0 ? () => onReorder(index, index - 1) : null,
      onMoveLater: index < sets.length - 1
          ? () => onReorder(index, index + 1)
          : null,
      child: row,
    );
  }

  Color _markerColor(BuildContext context, SetRecord set) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final section = RegExp(r'^\d+\.(\d+)').firstMatch(set.title);
    if (section != null) {
      // Цвет помогает визуально различать соседние учебные разделы.
      final sectionNumber = int.parse(section.group(1)!);
      final sectionPalette = [
        theme.colorScheme.tertiary,
        theme.colorScheme.primary,
        tokens.ochre,
        theme.colorScheme.secondary,
        tokens.textSubtle,
      ];
      return sectionPalette[sectionNumber % sectionPalette.length];
    }
    if (set.courseTitle != null && set.courseTitle!.isNotEmpty) {
      return theme.colorScheme.primary;
    }
    if (set.articleTitle != null && set.articleTitle!.isNotEmpty) {
      return theme.colorScheme.tertiary;
    }
    if (set.isSaved) return tokens.ochre;
    if (set.visibility == 'public') return theme.colorScheme.secondary;
    return tokens.textSubtle;
  }
}

class _LibraryHeader extends StatelessWidget {
  const _LibraryHeader({
    required this.count,
    required this.isOnline,
    required this.showReorderHint,
    required this.sortAction,
    required this.onSearch,
  });

  final int count;
  final bool isOnline;
  final bool showReorderHint;
  final Widget sortAction;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RemoraSpacing.lg,
        RemoraSpacing.sm,
        RemoraSpacing.sm,
        RemoraSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Наборы', style: theme.textTheme.headlineLarge),
              ),
              if (!isOnline)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: RemoraSpacing.xxs),
                  child: Icon(
                    Icons.cloud_off_rounded,
                    semanticLabel: 'Нет сети',
                  ),
                ),
              IconButton(
                onPressed: onSearch,
                tooltip: 'Найти наборы',
                icon: const Icon(Icons.search_rounded),
              ),
              sortAction,
            ],
          ),
          const SizedBox(height: RemoraSpacing.xs),
          Text('Наборов: $count', style: theme.textTheme.bodyLarge),
          if (showReorderHint) ...[
            const SizedBox(height: RemoraSpacing.xxs),
            Text(
              'Удерживайте карточку, чтобы изменить порядок',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  const _SetRow({
    required this.set,
    required this.markerColor,
    required this.isOnline,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isOutdated,
    required this.onTap,
    required this.onDownload,
  });

  final SetRecord set;
  final Color markerColor;
  final bool isOnline;
  final bool isDownloading;
  final bool isDownloaded;
  final bool isOutdated;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metadata = <String>[
      '${set.cardsCount} ${_cardWord(set.cardsCount)}',
      if (set.courseTitle != null && set.courseTitle!.isNotEmpty)
        set.courseTitle!,
      if (set.articleTitle != null && set.articleTitle!.isNotEmpty)
        set.articleTitle!,
    ].join(' · ');
    final openLabel = 'Набор «${set.title}», $metadata';

    return Material(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.card),
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 50,
              decoration: BoxDecoration(
                color: markerColor,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(4),
                ),
              ),
            ),
            Expanded(
              child: Semantics(
                container: true,
                button: true,
                label: openLabel,
                onTap: onTap,
                child: ExcludeSemantics(
                  child: InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        RemoraSpacing.md,
                        RemoraSpacing.xs,
                        RemoraSpacing.xs,
                        RemoraSpacing.xs,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            set.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: RemoraSpacing.xxs),
                          Text(
                            metadata,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                          if (set.isSaved && set.hasUpdates) ...[
                            const SizedBox(height: RemoraSpacing.xxs),
                            Text(
                              'Оригинал обновлён',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: context.remora.warning,
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
            Padding(
              padding: const EdgeInsetsDirectional.only(end: RemoraSpacing.xs),
              child: _SetOfflineAction(
                isOnline: isOnline,
                isDownloading: isDownloading,
                isDownloaded: isDownloaded,
                isOutdated: isOutdated,
                onDownload: onDownload,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SetOfflineAction extends StatelessWidget {
  const _SetOfflineAction({
    required this.isOnline,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isOutdated,
    required this.onDownload,
  });

  final bool isOnline;
  final bool isDownloading;
  final bool isDownloaded;
  final bool isOutdated;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final canDownload =
        isOnline && !isDownloading && (!isDownloaded || isOutdated);
    final (label, icon, foreground, background) = isDownloading
        ? (
            'Скачиваем набор',
            Icons.downloading_rounded,
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          )
        : isOutdated
        ? (
            'Обновить офлайн-копию',
            Icons.sync_rounded,
            tokens.warning,
            tokens.warningContainer,
          )
        : isDownloaded
        ? (
            'Доступен офлайн',
            Icons.download_done_rounded,
            tokens.success,
            tokens.successContainer,
          )
        : isOnline
        ? (
            'Скачать для офлайна',
            Icons.download_rounded,
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          )
        : (
            'Только онлайн',
            Icons.cloud_outlined,
            theme.colorScheme.onSurfaceVariant,
            tokens.surfaceMuted,
          );

    final status = SizedBox.square(
      dimension: RemoraSizes.minTouchTarget,
      child: Center(
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: isDownloading
              ? Padding(
                  padding: const EdgeInsets.all(9),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: foreground,
                  ),
                )
              : Icon(icon, size: 20, color: foreground),
        ),
      ),
    );

    if (!canDownload) return Semantics(label: label, child: status);
    return Semantics(
      button: true,
      label: label,
      child: IconButton(
        onPressed: onDownload,
        tooltip: label,
        icon: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: Icon(icon, size: 20, color: foreground),
        ),
      ),
    );
  }
}

class _LibraryNotice extends StatelessWidget {
  const _LibraryNotice.error({required this.message}) : error = true;

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = error
        ? theme.colorScheme.errorContainer
        : context.remora.surfaceMuted;
    return Semantics(
      liveRegion: error,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: RemoraSpacing.sm,
          vertical: RemoraSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(RemoraRadii.control),
        ),
        child: Row(
          children: [
            Icon(
              error ? Icons.error_outline_rounded : Icons.cloud_off_rounded,
              size: 18,
            ),
            const SizedBox(width: RemoraSpacing.xs),
            Expanded(child: Text(message, style: theme.textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}

class _LibrarySkeleton extends StatelessWidget {
  const _LibrarySkeleton();

  @override
  Widget build(BuildContext context) {
    final color = context.remora.surfaceMuted;
    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: RemoraSpacing.sm),
          child: Container(
            height: 88,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(RemoraRadii.card),
            ),
          ),
        ),
      ),
    );
  }
}

class _LibraryGroundPainter extends CustomPainter {
  const _LibraryGroundPainter({required this.color, required this.dark});

  final Color color;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: dark ? 0.10 : 0.16)
      ..style = PaintingStyle.fill;
    const gap = 20.0;
    for (double y = 10; y < size.height; y += gap) {
      final offset = ((y / gap).round().isEven) ? 10.0 : 0.0;
      for (double x = offset; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), 0.7, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _LibraryGroundPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.dark != dark;
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
