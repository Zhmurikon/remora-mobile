import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Прячем Drift-класс Card (строка таблицы Cards) — он конфликтует с Material Card.
import '../../data/db/app_database.dart' hide Card;
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
    final theme = Theme.of(context);

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
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(courseViewProvider(courseId).notifier).refresh(),
        child: _buildBody(context, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CourseViewState state) {
    if (state.isLoading && state.sections.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 120),
          Icon(
            Icons.menu_book_outlined,
            size: 72,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            state.error ?? 'В курсе пока нет разделов.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
    }

    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (state.course != null && (state.course!.description).isNotEmpty) ...[
          Text(state.course!.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
        ],
        for (final section in state.sections)
          _SectionBlock(
            section: section,
            articles: state.articlesOf(section.id),
            courseId: courseId,
          ),
      ],
    );
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
