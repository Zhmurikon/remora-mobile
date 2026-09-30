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
    final sortedCourses = sortList(
      state.courses,
      sortMode,
      title: (course) => course.title,
      updatedAt: (course) => course.updatedAt,
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedCourses.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              '${state.courses.length} ${_courseWord(state.courses.length)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }
        final course = sortedCourses[index - 1];
        final isDownloading = state.downloadingCourseIds.contains(course.id);
        final isDownloaded = state.downloadedCourseIds.contains(course.id);
        final isOutdated = state.outdatedCourseIds.contains(course.id);
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.menu_book_outlined),
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
      },
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
