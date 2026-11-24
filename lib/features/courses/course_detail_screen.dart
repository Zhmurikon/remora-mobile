import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Прячем Drift-класс Card (строка таблицы Cards) — он конфликтует с Material Card.
import '../../widgets/ink_motion.dart';
import '../../widgets/library_status.dart';
import '../../data/db/app_database.dart' hide Card;
import '../catalog/catalog_provider.dart';
import 'courses_provider.dart';

/// Структура курса: разделы и статьи. Тап по статье открывает теорию.
class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({
    super.key,
    required this.courseId,
    required this.courseTitle,
  });

  final String courseId;
  final String courseTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseViewProvider(courseId));
    final listState = ref.watch(coursesListProvider);
    final isDownloading = listState.downloadingCourseIds.contains(courseId);
    final isDownloaded = listState.downloadedCourseIds.contains(courseId);
    final isOutdated = listState.outdatedCourseIds.contains(courseId);
    final theme = Theme.of(context);
    final catalog = ref.watch(catalogProvider);
    final isOwned =
        catalog.ownedCourseIds.contains(courseId) ||
        listState.courses.any(
          (course) => course.id == courseId && !course.isSaved,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(state.course?.title ?? courseTitle),
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
          if (isDownloading)
            const Padding(
              padding: EdgeInsets.all(14),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              tooltip: isDownloaded && !isOutdated
                  ? 'Курс доступен офлайн'
                  : isOutdated
                  ? 'Обновить офлайн-копию'
                  : 'Скачать курс для офлайна',
              onPressed: listState.isOnline && (!isDownloaded || isOutdated)
                  ? () => ref
                        .read(coursesListProvider.notifier)
                        .downloadCourse(courseId)
                  : null,
              icon: Icon(
                isDownloaded && !isOutdated
                    ? Icons.download_done
                    : isOutdated
                    ? Icons.system_update_alt
                    : Icons.download_outlined,
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(courseViewProvider(courseId).notifier).refresh(),
        child: InkReveal(
          onMount: false,
          change: (state.isEmpty, state.isLoading && state.sections.isEmpty),
          child: _buildBody(context, ref, state, catalog, isOwned),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    CourseViewState state,
    CatalogState catalog,
    bool isOwned,
  ) {
    if (state.isLoading && state.sections.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final library = ref.watch(coursesListProvider);
    final record = library.courses.where((c) => c.id == courseId).firstOrNull;
    final saved =
        catalog.savedCourseIds.contains(courseId) || record?.isSaved == true;
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (state.course != null && (state.course!.description).isNotEmpty) ...[
          Text(state.course!.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
        ],
        if (state.articles.isNotEmpty && (isOwned || saved)) ...[
          FilledButton.icon(
            onPressed: () => context.push(
              '/course/$courseId/study?title=${Uri.encodeComponent(state.course?.title ?? courseTitle)}',
            ),
            icon: const Icon(Icons.shuffle_rounded),
            label: const Text('Учить весь курс'),
          ),
          const SizedBox(height: 16),
        ],
        if (state.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              state.error ?? 'В курсе пока нет разделов.',
              textAlign: TextAlign.center,
            ),
          ),
        for (final section in state.sections)
          _SectionBlock(
            section: section,
            articles: state.articlesOf(section.id),
            courseId: courseId,
          ),
        if (!isOwned && state.course != null) ...[
          _CourseLibraryActions(
            courseId: courseId,
            title: state.course?.title ?? courseTitle,
            isSaved: saved,
            isBusy: catalog.busyCourseIds.contains(courseId),
          ),
          const SizedBox(height: 16),
        ],
        LibraryStatusFooter(
          savedLabel: saved ? 'Курс сохранён в библиотеке.' : null,
          downloaded: library.downloadedCourseIds.contains(courseId),
          outdated: library.outdatedCourseIds.contains(courseId),
          hasUpdates: record?.hasUpdates ?? false,
        ),
      ],
    );
  }
}

class _CourseLibraryActions extends ConsumerWidget {
  const _CourseLibraryActions({
    required this.courseId,
    required this.title,
    required this.isSaved,
    required this.isBusy,
  });

  final String courseId;
  final String title;
  final bool isSaved;
  final bool isBusy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(catalogProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: isBusy
                ? null
                : isSaved
                ? () => _remove(context, notifier)
                : () => notifier.saveCourse(courseId),
            icon: isBusy
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
            label: Text(isSaved ? 'Сохранён' : 'Сохранить курс'),
          ),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          onPressed: isBusy ? null : () => _copy(context, notifier),
          tooltip: 'Создать независимую копию',
          icon: const Icon(Icons.content_copy_outlined),
        ),
      ],
    );
  }

  Future<void> _remove(BuildContext context, CatalogNotifier notifier) async {
    final confirmed = await showDialog<bool>(
      context: context,
      animationStyle: InkMotion.styleOf(context),
      builder: (context) => AlertDialog(
        title: const Text('Убрать из сохранённых?'),
        content: const Text(
          'Курс исчезнет из библиотеки и перестанет обновляться у вас.',
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
    if (confirmed == true) await notifier.removeCourse(courseId);
  }

  Future<void> _copy(BuildContext context, CatalogNotifier notifier) async {
    final confirmed = await showDialog<bool>(
      context: context,
      animationStyle: InkMotion.styleOf(context),
      builder: (context) => AlertDialog(
        title: const Text('Создать копию курса?'),
        content: const Text(
          'Копия будет приватной и не зависит от изменений оригинала.',
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
    final copied = await notifier.copyCourse(courseId);
    if (copied != null && context.mounted) {
      context.pushReplacement(
        '/course/${copied.id}?title=${Uri.encodeComponent(copied.title)}',
      );
    }
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({
    required this.section,
    required this.articles,
    required this.courseId,
  });

  final CourseSectionRow section;
  final List<CourseArticleRow> articles;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            section.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (articles.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text('Нет статей', style: theme.textTheme.bodySmall),
          )
        else
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                for (var i = 0; i < articles.length; i++) ...[
                  if (i > 0) const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.article_outlined),
                    title: Text(articles[i].title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push(
                      '/course/$courseId/article/${articles[i].id}',
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
