import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/db/app_database.dart';
import '../catalog/catalog_provider.dart';
import 'article_content_widget.dart';
import 'course_material_actions_provider.dart';
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
          (item as Map)['id'] as String:
              (item['local_path'] as String?) ?? item['url'] as String,
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
    final actions = ref.watch(materialActionsProvider);
    final catalogOwns = ref.watch(
      catalogProvider.select(
        (state) => state.ownedCourseIds.contains(widget.courseId),
      ),
    );
    final listOwns = ref.watch(
      coursesListProvider.select(
        (state) => state.courses.any(
          (course) => course.id == widget.courseId && !course.isSaved,
        ),
      ),
    );
    final isOwned = catalogOwns || listOwns;
    ref.listen(materialActionsProvider.select((state) => state.error), (
      _,
      error,
    ) {
      if (error == null) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      ref.read(materialActionsProvider.notifier).clearError();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        actions: [
          if (!isOwned)
            PopupMenuButton<String>(
              tooltip: 'Действия с материалом',
              onSelected: (value) => _handleCopy(value, article),
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: 'article',
                  child: Text('Создать копию статьи'),
                ),
                PopupMenuItem(
                  value: 'set',
                  child: Text('Создать копию набора'),
                ),
              ],
            ),
        ],
      ),
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
          if (!isOwned) ...[
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: actions.isBusy('article', article.id)
                      ? null
                      : () =>
                            _toggleSaved('article', article.id, article.setId),
                  icon: Icon(
                    actions.isSaved('article', article.id)
                        ? Icons.bookmark
                        : Icons.bookmark_outline,
                  ),
                  label: Text(
                    actions.isSaved('article', article.id)
                        ? 'Статья сохранена'
                        : 'Сохранить статью',
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: actions.isBusy('set', article.setId)
                      ? null
                      : () => _toggleSaved('set', article.setId, article.setId),
                  icon: Icon(
                    actions.isSaved('set', article.setId)
                        ? Icons.bookmark
                        : Icons.bookmark_outline,
                  ),
                  label: Text(
                    actions.isSaved('set', article.setId)
                        ? 'Набор сохранён'
                        : 'Сохранить набор',
                  ),
                ),
              ],
            ),
          ],
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

  Future<void> _toggleSaved(String type, String id, String setId) async {
    final notifier = ref.read(materialActionsProvider.notifier);
    final saved = ref.read(materialActionsProvider).isSaved(type, id);
    if (saved) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Убрать из сохранённых?'),
          content: Text(
            type == 'article'
                ? 'Статья исчезнет из библиотеки.'
                : 'Набор исчезнет из библиотеки.',
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
      if (confirmed != true) return;
    }
    await notifier.toggleSave(type, id, setId: setId);
  }

  Future<void> _handleCopy(String type, CourseArticleRow article) async {
    final label = type == 'article' ? 'статьи с карточками' : 'набора';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Создать копию $label?'),
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
    if (confirmed != true || !mounted) return;
    final notifier = ref.read(materialActionsProvider.notifier);
    if (type == 'article') {
      final copied = await notifier.copyArticle(widget.courseId, article.id);
      if (copied != null && mounted) {
        context.push(
          '/course/${copied.id}?title=${Uri.encodeComponent(copied.title)}',
        );
      }
    } else {
      final copied = await notifier.copySet(article.setId);
      if (copied != null && mounted) {
        context.push(
          '/set/${copied.id}/study?title=${Uri.encodeComponent(copied.title)}',
        );
      }
    }
  }
}
