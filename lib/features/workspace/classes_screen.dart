import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/api_client.dart';
import 'workspace.dart';

const _roles = {
  'teacher': 'Преподаватель',
  'assistant': 'Ассистент',
  'student': 'Ученик',
};
const _progress = {
  'not_started': 'Не начато',
  'in_progress': 'В работе',
  'done': 'Выполнено',
  'late': 'Просрочено',
};
const _goals = {
  'cards_count': 'Ответов',
  'mastery_percent': 'Освоение, %',
  'test_score': 'Тест, %',
};

class ClassesScreen extends ConsumerWidget {
  const ClassesScreen({this.inviteCode, super.key});
  final String? inviteCode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceList('classes');
    Future<void> enter(bool join) async {
      final text = await askText(
        context,
        join ? 'Код приглашения' : 'Название класса',
        initial: join ? inviteCode ?? '' : '',
        action: join ? 'Вступить' : 'Создать',
        maxLength: join ? 12 : 160,
      );
      if (text == null || !context.mounted) return;
      final response = await ref
          .read(dioProvider)
          .post<Json>(
            '/api/v1/classes${join ? '/join' : ''}',
            data: join ? {'join_code': text} : {'title': text},
          );
      if (!context.mounted) return;
      ref.invalidate(provider);
      final data = response.data!;
      if (data['status'] == 'pending') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Заявка отправлена преподавателю')),
        );
      } else {
        context.push('/classes/${data['class_id'] ?? data['id']}');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Классы')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            children: [
              ActionButton(
                label: inviteCode == null
                    ? 'Вступить по коду'
                    : 'Принять приглашение',
                run: () => enter(true),
              ),
              ActionButton(label: 'Создать класс', run: () => enter(false)),
            ],
          ),
          RemoteContent(
            ref.watch(provider),
            retry: () => ref.invalidate(provider),
            builder: (items) => Column(
              children: [
                if (items.isEmpty) const Text('Вы пока не состоите в классах'),
                for (final item in items)
                  ListTile(
                    title: Text(item['title']),
                    subtitle: Text(_roles[item['my_role']] ?? ''),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/classes/${item['id']}'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClassScreen extends ConsumerWidget {
  const ClassScreen(this.id, {super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = 'classes/$id';
    final detail = workspaceDocument(path);
    final materials = workspaceList('$path/sets');
    final assignments = workspaceList('$path/assignments');
    final sets = ref.watch(materials);
    final assignmentList = ref.watch(assignments);
    final dio = ref.read(dioProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Класс')),
      body: RemoteContent(
        ref.watch(detail),
        retry: () => ref.invalidate(detail),
        builder: (item) {
          final teacher = item['my_role'] == 'teacher';
          final staff = teacher || item['my_role'] == 'assistant';
          final writable = item['is_read_only'] != true;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionHeading(item['title']),
              if (item['description'] != '') Text(item['description']),
              Text(_roles[item['my_role']] ?? ''),
              if (teacher)
                ListTile(
                  title: const Text('Код приглашения'),
                  subtitle: SelectableText(item['join_code']),
                  trailing: IconButton(
                    tooltip: 'Скопировать код',
                    icon: const Icon(Icons.copy),
                    onPressed: () => Clipboard.setData(
                      ClipboardData(text: item['join_code']),
                    ),
                  ),
                ),
              const SectionHeading('Учебные наборы'),
              RemoteContent(
                sets,
                retry: () => ref.invalidate(materials),
                builder: (sets) => Column(
                  children: [
                    if (sets.isEmpty) const Text('В классе пока нет наборов'),
                    for (final set in sets)
                      ListTile(
                        title: Text(set['title']),
                        subtitle: Text('Карточек: ${set['cards_count']}'),
                        onTap: () => context.push(
                          '/set/${set['set_id']}/study?title=${Uri.encodeComponent(set['title'])}',
                        ),
                      ),
                    if (staff && writable)
                      ActionButton(
                        label: 'Добавить набор',
                        run: () async {
                          final mine = await ref
                              .read(apiClientProvider)
                              .getMySets();
                          if (!context.mounted) return;
                          final selected = await showDialog<SetSummary>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text('Добавить свой набор'),
                              children: [
                                if (mine.isEmpty)
                                  const ListTile(
                                    title: Text('Пока нет собственных наборов'),
                                  ),
                                for (final set in mine.where(
                                  (s) =>
                                      !sets.any((row) => row['set_id'] == s.id),
                                ))
                                  SimpleDialogOption(
                                    onPressed: () =>
                                        Navigator.pop(context, set),
                                    child: Text(set.title),
                                  ),
                              ],
                            ),
                          );
                          if (selected == null || !context.mounted) return;
                          await dio.post(
                            '/api/v1/$path/sets',
                            data: {'set_id': selected.id},
                          );
                          if (context.mounted) ref.invalidate(materials);
                        },
                      ),
                    if (item['can_create_assignments'] == true &&
                        sets.isNotEmpty)
                      ActionButton(
                        label: 'Создать задание',
                        run: () async {
                          final data = await showDialog<Json>(
                            context: context,
                            builder: (_) => _AssignmentDialog(sets),
                          );
                          if (data == null || !context.mounted) return;
                          await dio.post(
                            '/api/v1/$path/assignments',
                            data: data,
                          );
                          if (context.mounted) ref.invalidate(assignments);
                        },
                      ),
                  ],
                ),
              ),
              const SectionHeading('Задания'),
              RemoteContent(
                assignmentList,
                retry: () => ref.invalidate(assignments),
                builder: (items) => Column(
                  children: [
                    if (items.isEmpty) const Text('Заданий пока нет'),
                    for (final task in items)
                      ListTile(
                        title: Text(task['title']),
                        subtitle: Text(
                          '${_goals[task['goal_type']]}: ${task['goal_value']}'
                          '${task['progress'] == null ? '' : ' · ${_progress[task['progress']['status']]}'}',
                        ),
                        onTap: () => context.push(
                          '/set/${task['set_id']}/study?title=${Uri.encodeComponent(task['title'])}',
                        ),
                      ),
                  ],
                ),
              ),
              if (teacher) ...[
                const SectionHeading('Участники'),
                if (writable)
                  ActionButton(
                    label: 'Добавить ученика',
                    run: () async {
                      final name = await askText(
                        context,
                        'Имя пользователя',
                        maxLength: 32,
                        action: 'Добавить',
                      );
                      if (name == null || !context.mounted) return;
                      await dio.post(
                        '/api/v1/$path/members',
                        data: {'username': name},
                      );
                      if (context.mounted) ref.invalidate(detail);
                    },
                  ),
                for (final member in rows(item['members']))
                  ListTile(
                    title: Text(member['display_name'] ?? member['username']),
                    subtitle: Text(_roles[member['role']] ?? ''),
                    trailing: member['status'] != 'pending' || !writable
                        ? null
                        : ActionButton(
                            label: 'Принять',
                            run: () async {
                              await dio.post(
                                '/api/v1/$path/members/${member['id']}/approve',
                              );
                              if (context.mounted) ref.invalidate(detail);
                            },
                          ),
                  ),
              ],
              if (staff)
                ExpansionTile(
                  title: const Text('Отчёт по заданиям'),
                  children: [_ClassReport(path)],
                ),
            ],
          );
        },
      ),
    );
  }
}

class _AssignmentDialog extends StatefulWidget {
  const _AssignmentDialog(this.sets);
  final List<Json> sets;
  @override
  State<_AssignmentDialog> createState() => _AssignmentDialogState();
}

class _AssignmentDialogState extends State<_AssignmentDialog> {
  late String id = widget.sets.first['set_id'];
  String title = '';
  String goal = 'cards_count';
  int? value = 10;
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Новое задание'),
    scrollable: true,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          maxLength: 160,
          decoration: const InputDecoration(labelText: 'Название'),
          onChanged: (v) => setState(() => title = v.trim()),
        ),
        DropdownButtonFormField<String>(
          initialValue: id,
          isExpanded: true,
          decoration: const InputDecoration(labelText: 'Набор'),
          items: [
            for (final s in widget.sets)
              DropdownMenuItem(
                value: s['set_id'] as String,
                child: Text(s['title']),
              ),
          ],
          onChanged: (v) => setState(() => id = v!),
        ),
        DropdownButtonFormField<String>(
          initialValue: goal,
          decoration: const InputDecoration(labelText: 'Цель'),
          items: [
            for (final entry in _goals.entries)
              DropdownMenuItem(value: entry.key, child: Text(entry.value)),
          ],
          onChanged: (v) => setState(() => goal = v!),
        ),
        TextFormField(
          initialValue: '10',
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Значение цели'),
          onChanged: (v) => setState(() => value = int.tryParse(v)),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Отмена'),
      ),
      FilledButton(
        onPressed:
            title.isEmpty ||
                value == null ||
                value! < 1 ||
                value! > (goal == 'cards_count' ? 100000 : 100)
            ? null
            : () => Navigator.pop(context, {
                'title': title,
                'goal_type': goal,
                'goal_value': value,
                'set_id': id,
              }),
        child: const Text('Создать'),
      ),
    ],
  );
}

class _ClassReport extends ConsumerWidget {
  const _ClassReport(this.path);
  final String path;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = workspaceDocument('$path/reports');
    return RemoteContent(
      ref.watch(provider),
      retry: () => ref.invalidate(provider),
      builder: (report) => Column(
        children: [
          if (rows(report['students']).isEmpty) const Text('Пока нет учеников'),
          for (final student in rows(report['students']))
            ExpansionTile(
              title: Text(student['display_name'] ?? student['username']),
              children: [
                for (final task in rows(report['assignments']))
                  ListTile(
                    title: Text(task['title']),
                    subtitle: Text(
                      _progress[student['assignments'][task['id']]?['status']] ??
                          'Не начато',
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
