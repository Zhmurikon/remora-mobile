import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../courses/article_content_widget.dart';
import '../../widgets/ink_illustration.dart';
import 'workspace.dart';

const _art = {
  'first_review': 'first-review',
  'reviews_10': 'warmup',
  'reviews_67': 'reviews-67',
  'reviews_200': 'groom-arrived',
  'reviews_300': 'spartan',
  'reviews_777': 'big-win',
  'publish_1': 'first-published-course',
};

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceDocument('retention/achievements');
    return Scaffold(
      appBar: AppBar(title: const Text('Достижения')),
      body: RemoteContent(
        ref.watch(provider),
        retry: () => ref.invalidate(provider),
        builder: (collection) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionHeading(
              'Открыто ${collection['unlocked_count']} из ${collection['total_count']}',
            ),
            for (final category in rows(
              collection['items'],
            ).map((item) => item['category'] as String).toSet()) ...[
              SectionHeading(category),
              for (final item in rows(
                collection['items'],
              ).where((item) => item['category'] == category))
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    'assets/achievements/achievement-${_art[item['code']] ?? 'placeholder'}.webp',
                    width: 54,
                    height: 54,
                    excludeFromSemantics: true,
                  ),
                  title: Text(item['title']),
                  subtitle: Text(
                    "${item['description']}\n${item['unlocked'] == true ? 'Получено' : "${item['progress']} из ${item['target']}"}",
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class SavedArticlesScreen extends ConsumerWidget {
  const SavedArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceList('library');
    return Scaffold(
      appBar: AppBar(title: const Text('Сохранённые статьи')),
      body: RemoteContent(
        ref.watch(provider),
        retry: () => ref.invalidate(provider),
        builder: (items) {
          final articles = items
              .where((item) => item['target_type'] == 'article')
              .toList();
          if (articles.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkIllustration(InkDrawing.folder, width: 112, height: 82),
                  SizedBox(height: 16),
                  Text('Пока нет сохранённых статей'),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final item = articles[index];
              return ListTile(
                title: Text(item['article_title'] ?? 'Статья'),
                subtitle: Text(item['course_title']),
                onTap: () => context.push('/saved-articles/${item['id']}'),
              );
            },
          );
        },
      ),
    );
  }
}

class SavedArticleScreen extends ConsumerWidget {
  const SavedArticleScreen(this.id, {super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceDocument('library/$id/article');
    return Scaffold(
      appBar: AppBar(title: const Text('Сохранённая статья')),
      body: RemoteContent(
        ref.watch(provider),
        retry: () => ref.invalidate(provider),
        builder: (article) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionHeading(article['title']),
            ArticleContentWidget(
              body: article['body'],
              mediaUrls: {
                for (final media in rows(article['media']))
                  if (media['url'] != null) media['id']: media['url'],
              },
            ),
          ],
        ),
      ),
    );
  }
}
