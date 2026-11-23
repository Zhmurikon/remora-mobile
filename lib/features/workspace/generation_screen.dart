import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/preferences.dart';
import '../auth/auth_provider.dart';
import '../courses/article_content_widget.dart';
import 'refinement_screen.dart';
import 'workspace.dart';

class GenerationScreen extends ConsumerWidget {
  const GenerationScreen(this.id, {super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = 'generations/$id';
    final provider = workspaceDocument(path);
    final api = ref.read(dioProvider);
    final canRefine =
        ref
            .watch(workspaceDocument('billing/entitlements'))
            .valueOrNull?['features']?['ai.refinement'] ==
        true;
    void refresh() => ref.invalidate(provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Материал'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Обновить материал',
            onPressed: refresh,
          ),
        ],
      ),
      body: RemoteContent(
        ref.watch(provider),
        retry: refresh,
        builder: (item) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionHeading(item['title']),
            if (item['status'] != 'completed')
              Text(item['error_message'] ?? 'Материал готовится'),
            if (item['markdown'] case final String markdown) ...[
              ArticleContentWidget(body: markdown),
              ActionButton(
                label: 'Редактировать конспект',
                run: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => _EditNote(id: id, note: item),
                    ),
                  );
                  if (context.mounted) refresh();
                },
              ),
              if (canRefine)
                ActionButton(
                  label: 'Доработать с ИИ',
                  run: () async {
                    final applied = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(builder: (_) => RefinementScreen(item)),
                    );
                    if (applied == true && context.mounted) {
                      ref.invalidate(workspaceList('$path/revisions'));
                      refresh();
                    }
                  },
                ),
              if (item['course_id'] == null)
                ActionButton(
                  label: 'Добавить в курс',
                  run: () async {
                    final courses = await ref
                        .read(apiClientProvider)
                        .getMyCourses();
                    if (!context.mounted) return;
                    final target = await showDialog<String>(
                      context: context,
                      builder: (c) => SimpleDialog(
                        title: const Text('Сохранить в курс'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(c, ''),
                            child: const Text('Новый курс'),
                          ),
                          for (final course in courses)
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(c, course.id),
                              child: Text(
                                '${course.title}${course.isPublished ? ' · публичный' : ''}',
                              ),
                            ),
                        ],
                      ),
                    );
                    if (target == null || !context.mounted) return;
                    await api.post(
                      '/api/v1/$path/course',
                      data: {
                        'revision': item['updated_at'],
                        'course_id': target.isEmpty ? null : target,
                        'title': item['title'],
                      },
                    );
                    if (context.mounted) refresh();
                  },
                ),
              ExpansionTile(
                title: const Text('История изменений'),
                children: [_Revisions(id)],
              ),
            ],
            for (final card in rows(item['cards'] ?? []))
              ListTile(
                title: Text(card['term']),
                subtitle: Text(card['definition']),
              ),
            if (item['kind'] == 'cards' && item['status'] == 'completed')
              ActionButton(
                label: item['saved_set_id'] == null
                    ? 'Сохранить карточки в набор'
                    : 'Набор сохранён',
                run: item['saved_set_id'] != null
                    ? null
                    : () async {
                        final title = await askText(
                          context,
                          'Название набора',
                          initial: item['title'],
                        );
                        if (title == null || !context.mounted) return;
                        final visibility = await showDialog<String>(
                          context: context,
                          builder: (c) => SimpleDialog(
                            title: const Text('Кому доступен набор?'),
                            children: [
                              for (final entry in const {
                                'private': 'Только мне',
                                'public': 'Всем',
                              }.entries)
                                SimpleDialogOption(
                                  onPressed: () => Navigator.pop(c, entry.key),
                                  child: Text(entry.value),
                                ),
                            ],
                          ),
                        );
                        if (visibility == null || !context.mounted) return;
                        await api.post(
                          '/api/v1/$path/save-set',
                          data: {
                            'title': title,
                            'revision': item['updated_at'],
                            'visibility': visibility,
                          },
                        );
                        if (context.mounted) refresh();
                      },
              ),
          ],
        ),
      ),
    );
  }
}

class SourceGenerations extends ConsumerWidget {
  const SourceGenerations(this.sourceId, {super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceList('transcriptions/$sourceId/generations');
    return RemoteContent(
      ref.watch(provider),
      retry: () => ref.invalidate(provider),
      builder: (items) => Column(
        children: [
          for (final item in items.where((item) => item['is_proposal'] != true))
            ListTile(
              title: Text(item['title']),
              subtitle: Text(item['kind'] == 'notes' ? 'Конспект' : 'Карточки'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => GenerationScreen(item['id']),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Revisions extends ConsumerWidget {
  const _Revisions(this.id);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceList('generations/$id/revisions');
    return RemoteContent(
      ref.watch(provider),
      retry: () => ref.invalidate(provider),
      builder: (items) => Column(
        children: [
          if (items.isEmpty) const Text('Пока нет предыдущих версий'),
          for (final rev in items)
            ExpansionTile(
              title: Text(rev['created_at'].toString().split('T').first),
              children: [ArticleContentWidget(body: rev['markdown'])],
            ),
        ],
      ),
    );
  }
}

class _EditNote extends ConsumerStatefulWidget {
  const _EditNote({required this.id, required this.note});
  final String id;
  final Json note;
  @override
  ConsumerState<_EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends ConsumerState<_EditNote> {
  late final prefs = ref.read(sharedPreferencesProvider);
  late final key =
      'assistant.note.${ref.read(authProvider).user!.id}.${widget.id}';
  late final saved = prefs.getString(key);
  late final draft = saved == null ? null : jsonDecode(saved!) as Json;
  late final revision = draft?['revision'] ?? widget.note['updated_at'];
  late final editor = TextEditingController(
    text: draft?['markdown'] ?? widget.note['markdown'],
  );
  void remember(String text) {
    prefs.setString(key, jsonEncode({'revision': revision, 'markdown': text}));
  }

  @override
  void dispose() {
    editor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Редактировать конспект')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          controller: editor,
          onChanged: remember,
          maxLength: 100000,
          minLines: 10,
          maxLines: null,
          decoration: const InputDecoration(
            labelText: 'Текст конспекта в Markdown',
          ),
        ),
        if (draft != null && revision != widget.note['updated_at']) ...[
          const Text(
            'После сохранения черновика конспект изменился. Скопируйте нужный текст перед открытием последней версии.',
          ),
          ActionButton(
            label: 'Открыть последнюю версию',
            run: () async {
              await prefs.remove(key);
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ] else
          ActionButton(
            label: 'Сохранить',
            run: () async {
              await ref
                  .read(dioProvider)
                  .patch(
                    '/api/v1/generations/${widget.id}',
                    data: {'revision': revision, 'markdown': editor.text},
                  );
              await prefs.remove(key);
              if (!context.mounted) return;
              ref.invalidate(
                workspaceList('generations/${widget.id}/revisions'),
              );
              Navigator.pop(context);
            },
          ),
      ],
    ),
  );
}
