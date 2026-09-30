import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'courses_provider.dart';
import '../library/list_sort.dart';

/// Список моих курсов. Открытие курса ведёт к его структуре и теории.
class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesListProvider);
    final notifier = ref.read(coursesListProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Курсы'),
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
            tooltip: 'Найти курсы',
            icon: const Icon(Icons.search),
          ),
          const ListSortButton(storageKey: 'courses', includeSize: false),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: notifier.refresh,
        child: _buildBody(context, ref, state),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    CoursesListState state,
  ) {
    final theme = Theme.of(context);
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
    if (state.isLoading && state.courses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.courses.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 120),
          Icon(
            Icons.school_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            state.isOnline
                ? 'У вас пока нет курсов.\nСоздайте курс на сайте.'
                : 'Нет подключения к сети.\nПодключитесь, чтобы загрузить курсы.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (state.isOnline) ...[
            const SizedBox(height: 24),
            Center(
              child: FilledButton.icon(
                onPressed: () => context.go('/catalog'),
                icon: const Icon(Icons.search),
                label: const Text('Найти курс'),
              ),
            ),
          ],
        ],
      );
    }

    Widget buildCourseTile(int index, {required bool reorderable}) {
      final course = sortedCourses[index];
      final isDownloading = state.downloadingCourseIds.contains(course.id);
      final isDownloaded = state.downloadedCourseIds.contains(course.id);
      final isOutdated = state.outdatedCourseIds.contains(course.id);
      return Card(
        key: ValueKey(course.id),
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: reorderable
              ? ReorderableDragStartListener(
                  index: index,
                  child: Semantics(
                    button: true,
                    label: 'Изменить место курса «${course.title}»',
                    child: const SizedBox(
                      width: 44,
                      height: 44,
                      child: Icon(Icons.drag_handle),
                    ),
                  ),
                )
              : const Icon(Icons.menu_book_outlined),
          title: Text(course.title),
          subtitle: Text.rich(
            TextSpan(
              text: course.description,
              children: [
                if (course.isSaved) const TextSpan(text: ' · Сохранённый'),
                if (course.hasUpdates || isOutdated)
                  TextSpan(
                    text: ' · Доступно обновление',
                    style: TextStyle(color: theme.colorScheme.tertiary),
                  ),
                if (isDownloaded && !isOutdated)
                  const TextSpan(text: ' · Доступен офлайн'),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          trailing: isDownloading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : IconButton(
                  tooltip: isDownloaded && !isOutdated
                      ? 'Курс доступен офлайн'
                      : isOutdated
                      ? 'Обновить офлайн-копию'
                      : 'Скачать курс для офлайна',
                  onPressed: state.isOnline && (!isDownloaded || isOutdated)
                      ? () => notifier.downloadCourse(course.id)
                      : null,
                  icon: Icon(
                    isDownloaded && !isOutdated
                        ? Icons.download_done
                        : isOutdated
                        ? Icons.system_update_alt
                        : Icons.download_outlined,
                  ),
                ),
          onTap: () => context.push(
            '/course/${course.id}?title=${Uri.encodeComponent(course.title)}',
          ),
        ),
      );
    }

    final header = Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        '${state.courses.length} ${_courseWord(state.courses.length)}',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
    if (sortMode == ListSortMode.custom) {
      return ReorderableListView.builder(
        padding: const EdgeInsets.all(16),
        header: header,
        buildDefaultDragHandles: false,
        itemCount: sortedCourses.length,
        itemBuilder: (context, index) =>
            buildCourseTile(index, reorderable: true),
        onReorderItem: (oldIndex, newIndex) {
          final reordered = [...sortedCourses];
          final moved = reordered.removeAt(oldIndex);
          reordered.insert(newIndex, moved);
          ref
              .read(listOrderProvider('courses').notifier)
              .set(reordered.map((course) => course.id).toList());
        },
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedCourses.length + 1,
      itemBuilder: (context, index) =>
          index == 0 ? header : buildCourseTile(index - 1, reorderable: false),
    );
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
}
