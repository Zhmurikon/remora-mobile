import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';
import '../courses/article_content_widget.dart';
import 'workspace.dart';

class RefinementScreen extends ConsumerStatefulWidget {
  const RefinementScreen(this.note, {super.key});
  final Json note;
  @override
  ConsumerState<RefinementScreen> createState() => _RefinementScreenState();
}

class _RefinementScreenState extends ConsumerState<RefinementScreen> {
  final instruction = TextEditingController();
  late final source = TextEditingController(text: widget.note['markdown']);
  String? fragment;
  String? proposalId;
  String requestId = const Uuid().v4();
  Timer? poll;
  String get path => 'generations/${widget.note['id']}';

  @override
  void dispose() {
    poll?.cancel();
    instruction.dispose();
    source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final proposal = proposalId == null
        ? null
        : workspaceDocument('generations/$proposalId');
    return Scaffold(
      appBar: AppBar(title: const Text('Доработка с ИИ')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (proposal == null) ...[
            ExpansionTile(
              title: Text(
                fragment == null
                    ? 'Область: весь конспект'
                    : 'Область: фрагмент',
              ),
              children: [
                TextField(
                  readOnly: true,
                  controller: source,
                  minLines: 3,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: 'Выделите фрагмент для доработки',
                  ),
                ),
                Wrap(
                  children: [
                    TextButton(
                      onPressed: () {
                        final s = source.selection;
                        if (s.isValid && !s.isCollapsed) {
                          setState(() {
                            fragment = s.textInside(source.text);
                            requestId = const Uuid().v4();
                          });
                        }
                      },
                      child: const Text('Взять выделение'),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        fragment = null;
                        requestId = const Uuid().v4();
                      }),
                      child: const Text('Весь конспект'),
                    ),
                  ],
                ),
              ],
            ),
            if (fragment != null)
              Text(fragment!, maxLines: 4, overflow: TextOverflow.ellipsis),
            TextField(
              controller: instruction,
              maxLength: 2000,
              minLines: 2,
              maxLines: 6,
              decoration: const InputDecoration(labelText: 'Что изменить?'),
              onChanged: (_) => setState(() => requestId = const Uuid().v4()),
            ),
            ActionButton(
              label: 'Подготовить предложение',
              run: instruction.text.trim().isEmpty
                  ? null
                  : () async {
                      final response = await ref
                          .read(dioProvider)
                          .post<Json>(
                            '/api/v1/$path/refine',
                            data: {
                              'request_id': requestId,
                              'revision': widget.note['updated_at'],
                              'instruction': instruction.text.trim(),
                              'scope': fragment == null ? 'all' : 'fragment',
                              'fragment': fragment,
                            },
                          );
                      if (!mounted) return;
                      setState(() => proposalId = response.data!['id']);
                      final provider = workspaceDocument(
                        'generations/$proposalId',
                      );
                      poll = Timer.periodic(const Duration(seconds: 5), (
                        timer,
                      ) {
                        final status = ref
                            .read(provider)
                            .valueOrNull?['status'];
                        if (status == 'completed' || status == 'failed') {
                          timer.cancel();
                        } else {
                          ref.invalidate(provider);
                        }
                      });
                    },
            ),
          ] else
            RemoteContent(
              ref.watch(proposal),
              retry: () => ref.invalidate(proposal),
              builder: (item) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item['status'] == 'completed') ...[
                    const SectionHeading('Предложенные изменения'),
                    ArticleContentWidget(body: item['markdown'] ?? ''),
                    ActionButton(
                      label: 'Применить',
                      run: () async {
                        await ref
                            .read(dioProvider)
                            .post(
                              '/api/v1/$path/apply',
                              data: {
                                'proposal_id': proposalId,
                                'revision': widget.note['updated_at'],
                              },
                            );
                        if (context.mounted) Navigator.pop(context, true);
                      },
                    ),
                  ] else
                    Text(item['error_message'] ?? 'Предложение готовится…'),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Оставить исходный текст'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
