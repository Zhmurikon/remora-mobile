import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/db/app_database.dart';
import 'article_content_widget.dart';
import 'courses_provider.dart';

/// Чтение теории одной статьи + переход к её карточкам.
class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen({
    super.key,
    required this.courseId,
    required this.articleId,
  });

  final String courseId;
  final String articleId;

  @override
  ConsumerState<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen> {
  CourseArticleRow? _article;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final article = await ref
        .read(courseRepositoryProvider)
        .getArticle(widget.articleId);
    if (mounted) {
      setState(() {
        _article = article;
        _isLoading = false;
      });
    }
  }

  /// media id → подписанная ссылка из сохранённого JSON статьи.
  Map<String, String> _mediaUrls(CourseArticleRow article) {
    try {
      final list = jsonDecode(article.mediaJson) as List;
      return {
        for (final item in list)
          (item as Map)['id'] as String: item['url'] as String,
      };
    } catch (_) {
      return const {};
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final article = _article;
    if (article == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Статья не найдена. Откройте курс онлайн.'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Назад'),
              ),
            ],
          ),
        ),
      );
    }

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Text(
            article.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          if (article.body.trim().isEmpty)
            Text(
              'В этой статье пока нет теории.',
              style: theme.textTheme.bodyMedium,
            )
          else
            ArticleContentWidget(
              body: article.body,
              mediaUrls: _mediaUrls(article),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: FilledButton.icon(
            onPressed: () => context.push(
              '/set/${article.setId}/study'
              '?title=${Uri.encodeComponent(article.title)}',
            ),
            icon: const Icon(Icons.style_outlined),
            label: const Text('К карточкам'),
          ),
        ),
      ),
    );
  }
}
