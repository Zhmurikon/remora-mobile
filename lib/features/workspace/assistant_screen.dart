import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';
import 'assistant_upload.dart';
import 'generation_screen.dart';
import 'workspace.dart';

const _results = {
  'notes': 'Конспект',
  'both': 'Конспект и карточки',
  'cards': 'Карточки',
  'transcript': 'Только расшифровка',
};
const _statuses = {
  'waiting': 'Ожидает обработки',
  'notes': 'Готовим конспект',
  'cards': 'Готовим карточки',
  'completed': 'Готово',
  'failed': 'Ошибка',
};

class AssistantScreen extends ConsumerStatefulWidget {
  const AssistantScreen({super.key});
  @override
  ConsumerState<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends ConsumerState<AssistantScreen> {
  final tasks = workspaceList('assistant/tasks');
  final sources = workspaceList('transcriptions');
  final rights = workspaceDocument('billing/entitlements');
  final files = <SourceFile>[];
  final existing = <String>{};
  final cancel = CancelToken();
  String result = 'notes';
  String detail = 'balanced';
  bool formulas = true;
  bool diagrams = false;
  int cardCount = 12;
  String? requestKey;
  String? error;
  String? progress;
  Timer? poll;

  @override
  void initState() {
    super.initState();
    poll = Timer.periodic(const Duration(seconds: 8), (_) {
      final items = ref.read(tasks).valueOrNull;
      if (items != null &&
          items.any(
            (item) => !['completed', 'failed'].contains(item['status']),
          )) {
        refresh();
      }
    });
  }

  @override
  void dispose() {
    poll?.cancel();
    cancel.cancel();
    super.dispose();
  }

  void refresh() {
    ref.invalidate(tasks);
    ref.invalidate(sources);
  }

  Future<void> pick(int limit) async {
    final chosen = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: [...documentTypes, ...mediaTypes],
      allowMultiple: true,
    );
    if (!mounted || chosen == null) return;
    final selected = {
      for (final source in files) source.file.identifier ?? source.file.path,
    };
    final next = chosen.files
        .where(
          (file) =>
              file.path != null && selected.add(file.identifier ?? file.path),
        )
        .toList();
    if (files.length + existing.length + next.length > limit) {
      setState(() => error = 'Для одной задачи доступно источников: $limit.');
      return;
    }
    setState(() {
      files.addAll(next.map(SourceFile.new));
      error = null;
      requestKey = null;
    });
  }

  Future<void> create() async {
    if (progress != null) return;
    final api = ref.read(dioProvider);
    setState(() {
      error = null;
      progress = 'Подготовка источников…';
    });
    try {
      final ids = [...existing];
      for (final source in files) {
        ids.add(
          await source.upload(api, cancel, (v) {
            if (mounted) {
              setState(
                () => progress = '${source.file.name} · ${(v * 100).round()}%',
              );
            }
          }),
        );
      }
      requestKey ??= const Uuid().v4();
      await api.post(
        '/api/v1/assistant/tasks',
        cancelToken: cancel,
        data: {
          'request_id': requestKey,
          'source_ids': ids,
          'result': result,
          'options': {
            'detail': detail,
            'formulas': formulas,
            'diagrams': diagrams,
            'card_count': cardCount,
          },
        },
      );
      if (!mounted) return;
      setState(() {
        files.clear();
        existing.clear();
        requestKey = null;
      });
      refresh();
    } catch (e) {
      if (mounted) {
        setState(
          () => error = e is FormatException ? e.message : requestError(e),
        );
      }
    } finally {
      if (mounted) setState(() => progress = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(tasks);
    final recordings = ref.watch(sources);
    final attached = {
      for (final t in history.valueOrNull ?? <Json>[])
        ...(t['source_ids'] as List),
    };
    final names = {
      for (final s in recordings.valueOrNull ?? <Json>[])
        s['id']: s['title'] ?? s['filename'],
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('ИИ-помощник'),
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(Icons.refresh),
            tooltip: 'Обновить задачи',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeading('Новая задача'),
          RemoteContent(
            ref.watch(rights),
            retry: () => ref.invalidate(rights),
            builder: (access) {
              final limit =
                  access['limits']['ai.sources_per_task'] as int? ?? 0;
              final busy = progress != null;
              if (limit == 0) {
                return const Text(
                  'Создание задачи доступно с подпиской. Готовые материалы открываются в истории.',
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final file in files)
                    ListTile(
                      title: Text(file.file.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        tooltip: 'Убрать файл',
                        onPressed: busy
                            ? null
                            : () => setState(() {
                                files.remove(file);
                                requestKey = null;
                              }),
                      ),
                    ),
                  ActionButton(
                    label: 'Выбрать файлы',
                    run: busy || files.length + existing.length >= limit
                        ? null
                        : () => pick(limit),
                  ),
                  if (recordings.valueOrNull?.any(
                        (s) =>
                            s['status'] == 'completed' &&
                            !attached.contains(s['id']),
                      ) ??
                      false)
                    ExpansionTile(
                      title: const Text('Из готовых источников'),
                      children: [
                        for (final s in recordings.valueOrNull!)
                          if (s['status'] == 'completed' &&
                              !attached.contains(s['id']))
                            CheckboxListTile(
                              title: Text(names[s['id']]),
                              value: existing.contains(s['id']),
                              onChanged:
                                  busy ||
                                      (!existing.contains(s['id']) &&
                                          files.length + existing.length >=
                                              limit)
                                  ? null
                                  : (value) => setState(() {
                                      if (value == true) {
                                        existing.add(s['id']);
                                      } else {
                                        existing.remove(s['id']);
                                      }
                                      requestKey = null;
                                    }),
                            ),
                      ],
                    ),
                  DropdownButtonFormField<String>(
                    initialValue: result,
                    decoration: const InputDecoration(labelText: 'Результат'),
                    items: [
                      for (final e in _results.entries)
                        DropdownMenuItem(value: e.key, child: Text(e.value)),
                    ],
                    onChanged: busy
                        ? null
                        : (v) => setState(() {
                            result = v!;
                            requestKey = null;
                          }),
                  ),
                  if (result != 'transcript')
                    ExpansionTile(
                      title: const Text('Параметры результата'),
                      children: [
                        DropdownButtonFormField<String>(
                          initialValue: detail,
                          decoration: const InputDecoration(
                            labelText: 'Подробность',
                          ),
                          items: [
                            for (final e in const {
                              'short': 'Кратко',
                              'balanced': 'Обычно',
                              'detailed': 'Подробно',
                            }.entries)
                              DropdownMenuItem(
                                value: e.key,
                                child: Text(e.value),
                              ),
                          ],
                          onChanged: busy
                              ? null
                              : (v) => setState(() {
                                  detail = v!;
                                  requestKey = null;
                                }),
                        ),
                        SwitchListTile(
                          title: const Text('Формулы'),
                          value: formulas,
                          onChanged: busy
                              ? null
                              : (v) => setState(() {
                                  formulas = v;
                                  requestKey = null;
                                }),
                        ),
                        SwitchListTile(
                          title: const Text('Схемы'),
                          value: diagrams,
                          onChanged: busy
                              ? null
                              : (v) => setState(() {
                                  diagrams = v;
                                  requestKey = null;
                                }),
                        ),
                        if (result != 'notes')
                          DropdownButtonFormField<int>(
                            initialValue: cardCount,
                            decoration: const InputDecoration(
                              labelText: 'Карточек',
                            ),
                            items: [
                              for (var n = 3; n <= 12; n++)
                                DropdownMenuItem(value: n, child: Text('$n')),
                            ],
                            onChanged: busy
                                ? null
                                : (v) => setState(() {
                                    cardCount = v!;
                                    requestKey = null;
                                  }),
                          ),
                      ],
                    ),
                  FilledButton(
                    onPressed: busy || (files.isEmpty && existing.isEmpty)
                        ? null
                        : create,
                    child: Text(progress ?? 'Создать'),
                  ),
                  if (error != null)
                    Text(
                      error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
              );
            },
          ),
          const SectionHeading('История задач'),
          RemoteContent(
            history,
            retry: refresh,
            builder: (items) => Column(
              children: [
                if (items.isEmpty) const Text('Задач пока нет'),
                for (final t in items)
                  ExpansionTile(
                    key: ValueKey(t['id']),
                    title: Text(
                      names[t['source_id']] ??
                          _results[t['result']] ??
                          'Задача',
                    ),
                    subtitle: Text(
                      '${_results[t['result']]} · ${_statuses[t['status']] ?? 'В работе'}',
                    ),
                    children: [
                      if (t['error_message'] != null) Text(t['error_message']),
                      if (t['status'] == 'failed')
                        ActionButton(
                          label: 'Повторить задачу',
                          run: () async {
                            await ref
                                .read(dioProvider)
                                .post(
                                  '/api/v1/assistant/tasks/${t['id']}/retry',
                                );
                            if (mounted) refresh();
                          },
                        ),
                      for (final key in ['note_id', 'cards_id'])
                        if (t[key] case final String id)
                          ListTile(
                            title: Text(
                              key == 'note_id'
                                  ? 'Открыть конспект'
                                  : 'Открыть карточки',
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (_) => GenerationScreen(id),
                              ),
                            ),
                          ),
                      for (final id in t['source_ids'])
                        if ((recordings.valueOrNull ?? <Json>[]).any(
                          (s) => s['id'] == id && s['result_text'] != null,
                        ))
                          ExpansionTile(
                            title: Text('Текст · ${names[id]}'),
                            children: [
                              SelectableText(
                                recordings.valueOrNull!.firstWhere(
                                  (s) => s['id'] == id,
                                )['result_text'],
                              ),
                            ],
                          ),
                    ],
                  ),
              ],
            ),
          ),
          RemoteContent(
            recordings,
            retry: () => ref.invalidate(sources),
            builder: (items) {
              final earlier = items.where(
                (source) =>
                    !attached.contains(source['id']) &&
                    source['status'] == 'completed',
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (earlier.isNotEmpty)
                    const SectionHeading('Готовые источники'),
                  for (final source in earlier)
                    ExpansionTile(
                      title: Text(names[source['id']]),
                      children: [
                        if (source['result_text'] != null)
                          SelectableText(source['result_text']),
                        SourceGenerations(source['id']),
                      ],
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
