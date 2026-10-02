import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/db/app_database.dart';
import '../../widgets/remora_components.dart';
import '../library/list_sort.dart';
import 'courses_provider.dart';

/// Список моих курсов. Открытие курса ведёт к его структуре и теории.
class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesListProvider);
    final notifier = ref.read(coursesListProvider.notifier);
    final sortMode = ref.watch(listSortProvider('courses'));
    final customOrder = ref.watch(listOrderProvider('courses'));
    final sortedCourses = sortList(
      state.courses,
      sortMode,
      id: (course) => course.id,
      title: (course) => course.title,
      updatedAt: (course) => course.updatedAt,
      customOrder: customOrder,
    );

    void persistCourseOrder(int oldIndex, int newIndex) {
      final reordered = reorderListItem(sortedCourses, oldIndex, newIndex);
      ref
          .read(listOrderProvider('courses').notifier)
          .set(reordered.map((course) => course.id).toList());
    }

    return CoursesView(
      state: state,
      courses: sortedCourses,
      customOrder: sortMode == ListSortMode.custom,
      sortAction: const ListSortButton(
        storageKey: 'courses',
        includeSize: false,
      ),
      onRefresh: notifier.refresh,
      onSearch: () => context.go('/catalog'),
      onOpenCourse: (course) => context.push(
        '/course/${course.id}?title=${Uri.encodeComponent(course.title)}',
      ),
      onDownload: notifier.downloadCourse,
      onReorder: persistCourseOrder,
    );
  }
}

/// Чистое представление списка курсов для всех сетевых и локальных состояний.
class CoursesView extends StatelessWidget {
  const CoursesView({
    required this.state,
    required this.courses,
    required this.customOrder,
    required this.sortAction,
    required this.onRefresh,
    required this.onSearch,
    required this.onOpenCourse,
    required this.onDownload,
    required this.onReorder,
    super.key,
  });

  final CoursesListState state;
  final List<CourseRecord> courses;
  final bool customOrder;
  final Widget sortAction;
  final Future<void> Function() onRefresh;
  final VoidCallback onSearch;
  final void Function(CourseRecord course) onOpenCourse;
  final void Function(String courseId) onDownload;
  final void Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    final header = _CoursesHeader(
      count: courses.length,
      isOnline: state.isOnline,
      showReorderHint: customOrder && courses.isNotEmpty,
      sortAction: sortAction,
      onSearch: onSearch,
    );

    final Widget content;
    if (state.isLoading && courses.isEmpty) {
      content = ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        children: [
          header,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
            child: _CoursesSkeleton(),
          ),
        ],
      );
    } else if (courses.isEmpty) {
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
                  ? 'Курсов пока нет'
                  : 'Курсы недоступны офлайн',
              message: state.isOnline
                  ? 'Найдите первый курс в каталоге — он появится здесь.'
                  : 'Подключитесь к сети, чтобы загрузить список курсов.',
              icon: state.isOnline
                  ? Icons.menu_book_outlined
                  : Icons.cloud_off_outlined,
              actionLabel: state.isOnline ? 'Найти курс' : null,
              onAction: state.isOnline ? onSearch : null,
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
        itemCount: courses.length,
        itemBuilder: (context, index) =>
            _buildCourseRow(index, reorderable: true),
        onReorderStart: (_) => HapticFeedback.selectionClick(),
        onReorderItem: onReorder,
      );
    } else {
      content = ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
        itemCount: courses.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [header, ..._statusBanners()],
            );
          }
          return _buildCourseRow(index - 1, reorderable: false);
        },
      );
    }

    return Scaffold(
      body: CustomPaint(
        painter: _CoursesGroundPainter(
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
    if (!state.isOnline)
      const Padding(
        padding: EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          0,
          RemoraSpacing.md,
          RemoraSpacing.sm,
        ),
        child: _CoursesNotice.offline(),
      ),
    if (state.error != null)
      Padding(
        padding: const EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          0,
          RemoraSpacing.md,
          RemoraSpacing.sm,
        ),
        child: _CoursesNotice.error(message: state.error!),
      ),
  ];

  Widget _buildCourseRow(int index, {required bool reorderable}) {
    final course = courses[index];
    final row = Padding(
      key: reorderable ? null : ValueKey(course.id),
      padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
      child: _CourseRow(
        course: course,
        isOnline: state.isOnline,
        isDownloading: state.downloadingCourseIds.contains(course.id),
        isDownloaded: state.downloadedCourseIds.contains(course.id),
        isOutdated: state.outdatedCourseIds.contains(course.id),
        onTap: () => onOpenCourse(course),
        onDownload: () => onDownload(course.id),
      ),
    );
    if (!reorderable) return row;
    return ReorderableCard(
      key: ValueKey(course.id),
      index: index,
      label: 'Курс «${course.title}»',
      onMoveEarlier: index > 0 ? () => onReorder(index, index - 1) : null,
      onMoveLater: index < courses.length - 1
          ? () => onReorder(index, index + 1)
          : null,
      child: row,
    );
  }
}

class _CoursesHeader extends StatelessWidget {
  const _CoursesHeader({
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
    return Stack(
      children: [
        PositionedDirectional(
          end: -26,
          top: -22,
          child: Opacity(
            opacity: Theme.of(context).brightness == Brightness.dark
                ? 0.22
                : 0.30,
            child: Image.asset(
              'assets/illustrations/courses-branch.png',
              width: 148,
              height: 98,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Padding(
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
                    child: Text('Курсы', style: theme.textTheme.headlineLarge),
                  ),
                  if (!isOnline)
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: RemoraSpacing.xxs,
                      ),
                      child: Icon(
                        Icons.cloud_off_rounded,
                        semanticLabel: 'Нет сети',
                      ),
                    ),
                  IconButton(
                    onPressed: onSearch,
                    tooltip: 'Найти курсы',
                    icon: const Icon(Icons.search_rounded),
                  ),
                  sortAction,
                ],
              ),
              const SizedBox(height: RemoraSpacing.xs),
              Text(
                '$count ${_courseWord(count)}',
                style: theme.textTheme.bodyLarge,
              ),
              if (showReorderHint) ...[
                const SizedBox(height: RemoraSpacing.xxs),
                Text(
                  'Удерживайте курс, чтобы изменить порядок',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseRow extends StatelessWidget {
  const _CourseRow({
    required this.course,
    required this.isOnline,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isOutdated,
    required this.onTap,
    required this.onDownload,
  });

  final CourseRecord course;
  final bool isOnline;
  final bool isDownloading;
  final bool isDownloaded;
  final bool isOutdated;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final openLabel = course.description.isEmpty
        ? 'Курс «${course.title}»'
        : 'Курс «${course.title}». ${course.description}';
    return Column(
      children: [
        Semantics(
          container: true,
          button: true,
          label: openLabel,
          onTap: onTap,
          child: ExcludeSemantics(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(RemoraRadii.card),
                child: Padding(
                  padding: const EdgeInsets.only(top: RemoraSpacing.sm),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CourseCover(title: course.title),
                      const SizedBox(width: RemoraSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                            if (course.description.isNotEmpty) ...[
                              const SizedBox(height: RemoraSpacing.xxs),
                              Text(
                                course.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                            if (course.isSaved) ...[
                              const SizedBox(height: RemoraSpacing.xxs),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bookmark_rounded,
                                    size: 16,
                                    color: context.remora.ochre,
                                  ),
                                  const SizedBox(width: RemoraSpacing.xxs),
                                  Text(
                                    'Сохранённый курс',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                            if (course.isSaved && course.hasUpdates) ...[
                              const SizedBox(height: RemoraSpacing.xxs),
                              Text(
                                'У автора есть непринятое обновление',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: context.remora.warning,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            88 + RemoraSpacing.md,
            RemoraSpacing.xxs,
            0,
            RemoraSpacing.sm,
          ),
          child: _CourseOfflineAction(
            isOnline: isOnline,
            isDownloading: isDownloading,
            isDownloaded: isDownloaded,
            isOutdated: isOutdated,
            onDownload: onDownload,
          ),
        ),
        Divider(color: theme.colorScheme.outline),
      ],
    );
  }
}

class _CourseOfflineAction extends StatelessWidget {
  const _CourseOfflineAction({
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
    final (label, icon, color) = isDownloading
        ? (
            'Скачиваем офлайн',
            Icons.downloading_rounded,
            theme.colorScheme.primary,
          )
        : isOutdated
        ? ('Обновить офлайн-копию', Icons.sync_rounded, tokens.warning)
        : isDownloaded
        ? ('Доступен офлайн', Icons.download_done_rounded, tokens.success)
        : isOnline
        ? (
            'Скачать для офлайна',
            Icons.download_rounded,
            theme.colorScheme.primary,
          )
        : (
            'Только онлайн',
            Icons.cloud_outlined,
            theme.colorScheme.onSurfaceVariant,
          );

    final status = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isDownloading)
          SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: color),
          )
        else
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 17, color: color),
          ),
        const SizedBox(width: RemoraSpacing.xs),
        Flexible(
          child: Text(
            label,
            maxLines: 2,
            style: theme.textTheme.bodySmall?.copyWith(color: color),
          ),
        ),
      ],
    );

    if (!canDownload) return Semantics(label: label, child: status);
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onDownload,
        borderRadius: BorderRadius.circular(RemoraRadii.control),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: RemoraSizes.minTouchTarget,
          ),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: status,
          ),
        ),
      ),
    );
  }
}

class _CourseCover extends StatelessWidget {
  const _CourseCover({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final python = title.toLowerCase().contains('python');
    return ExcludeSemantics(
      child: SizedBox(
        width: 88,
        height: 112,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(RemoraRadii.card),
          child: CustomPaint(
            painter: _CourseCoverPainter(
              primary: theme.colorScheme.primary,
              secondary: theme.colorScheme.secondary,
              ochre: tokens.ochre,
              surface: tokens.surfaceMuted,
              dark: theme.brightness == Brightness.dark,
            ),
            child: Center(
              child: python
                  ? Image.asset(
                      'assets/illustrations/python-course.png',
                      width: 76,
                      height: 76,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    )
                  : Icon(
                      Icons.menu_book_rounded,
                      size: 44,
                      color: theme.brightness == Brightness.dark
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onPrimary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CoursesGroundPainter extends CustomPainter {
  const _CoursesGroundPainter({required this.color, required this.dark});

  final Color color;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withValues(alpha: dark ? 0.10 : 0.16);
    const step = 24.0;
    for (var y = 12.0; y < size.height; y += step) {
      final offset = ((y / step).round().isEven ? 0.0 : step / 2);
      for (var x = 12.0 + offset; x < size.width; x += step) {
        canvas.drawCircle(Offset(x, y), 0.65, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CoursesGroundPainter oldDelegate) =>
      color != oldDelegate.color || dark != oldDelegate.dark;
}

class _CourseCoverPainter extends CustomPainter {
  const _CourseCoverPainter({
    required this.primary,
    required this.secondary,
    required this.ochre,
    required this.surface,
    required this.dark,
  });

  final Color primary;
  final Color secondary;
  final Color ochre;
  final Color surface;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = surface);
    canvas.drawCircle(
      Offset(size.width * 0.05, size.height * 0.2),
      size.width * 0.58,
      Paint()..color = primary.withValues(alpha: dark ? 0.72 : 0.82),
    );
    canvas.drawCircle(
      Offset(size.width * 0.98, size.height * 0.2),
      size.width * 0.22,
      Paint()..color = secondary.withValues(alpha: 0.92),
    );
    final lower = Path()
      ..moveTo(0, size.height * 0.68)
      ..quadraticBezierTo(
        size.width * 0.42,
        size.height * 0.47,
        size.width,
        size.height * 0.76,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      lower,
      Paint()..color = primary.withValues(alpha: dark ? 0.50 : 0.34),
    );
    final dots = Paint()..color = ochre.withValues(alpha: 0.72);
    for (var row = 0; row < 3; row++) {
      for (var column = 0; column < 3; column++) {
        canvas.drawCircle(
          Offset(size.width - 12 - column * 9, size.height - 12 - row * 9),
          1.25,
          dots,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CourseCoverPainter oldDelegate) =>
      primary != oldDelegate.primary ||
      secondary != oldDelegate.secondary ||
      ochre != oldDelegate.ochre ||
      surface != oldDelegate.surface ||
      dark != oldDelegate.dark;
}

class _CoursesNotice extends StatelessWidget {
  const _CoursesNotice.offline()
    : message = 'Нет сети — показываем скачанные курсы.',
      error = false;

  const _CoursesNotice.error({required this.message}) : error = true;

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final color = error ? theme.colorScheme.error : tokens.warning;
    final background = error
        ? theme.colorScheme.errorContainer
        : tokens.warningContainer;
    return Semantics(
      container: true,
      label: message,
      child: ExcludeSemantics(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: RemoraSizes.minTouchTarget,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: RemoraSpacing.sm,
            vertical: RemoraSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(RemoraRadii.control),
          ),
          child: Row(
            children: [
              Icon(
                error ? Icons.error_outline_rounded : Icons.cloud_off_rounded,
                color: color,
              ),
              const SizedBox(width: RemoraSpacing.sm),
              Expanded(child: Text(message, style: theme.textTheme.bodySmall)),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoursesSkeleton extends StatelessWidget {
  const _CoursesSkeleton();

  @override
  Widget build(BuildContext context) {
    final color = context.remora.surfaceElevated;
    return Semantics(
      label: 'Загрузка курсов',
      child: ExcludeSemantics(
        child: Column(
          children: List.generate(
            3,
            (_) => Padding(
              padding: const EdgeInsets.only(bottom: RemoraSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 88,
                    height: 112,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(RemoraRadii.card),
                    ),
                  ),
                  const SizedBox(width: RemoraSpacing.md),
                  Expanded(
                    child: Column(
                      children: [
                        Container(height: 22, color: color),
                        const SizedBox(height: RemoraSpacing.xs),
                        Container(height: 48, color: color),
                        const SizedBox(height: RemoraSpacing.xs),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Container(
                            width: 138,
                            height: 28,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _courseWord(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'курс';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'курса';
  }
  return 'курсов';
}
