import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/ink_motion.dart';
import '../../widgets/ink_illustration.dart';
import '../../data/api_client.dart';
import '../auth/auth_provider.dart';

typedef Json = Map<String, dynamic>;

List<Json> rows(Object? value) => (value as List).cast<Json>();

final workspaceDocument = FutureProvider.autoDispose.family<Json, String>((
  ref,
  path,
) async {
  ref.watch(authProvider.select((state) => state.user?.id));
  final cancel = CancelToken();
  ref.onDispose(cancel.cancel);
  final response = await ref
      .watch(dioProvider)
      .get<Json>('/api/v1/$path', cancelToken: cancel);
  return response.data!;
});

final workspaceList = FutureProvider.autoDispose.family<List<Json>, String>((
  ref,
  path,
) async {
  ref.watch(authProvider.select((state) => state.user?.id));
  final cancel = CancelToken();
  ref.onDispose(cancel.cancel);
  final response = await ref
      .watch(dioProvider)
      .get<List<dynamic>>('/api/v1/$path', cancelToken: cancel);
  return rows(response.data);
});

String requestError(Object error) {
  if (error is DioException) {
    final body = error.response?.data;
    if (body is Map && body['message'] is String) {
      return body['message'] as String;
    }
    if (error.response == null) {
      return 'Нет связи с сервером. Проверьте подключение.';
    }
  }
  return 'Не удалось выполнить запрос. Попробуйте ещё раз.';
}

class RemoteContent<T> extends StatelessWidget {
  const RemoteContent(
    this.value, {
    required this.retry,
    required this.builder,
    super.key,
  });
  final AsyncValue<T> value;
  final VoidCallback retry;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context) => value.when(
    data: (data) => InkReveal(child: builder(data)),
    loading: () => const Padding(
      padding: EdgeInsets.all(24),
      child: Center(child: CircularProgressIndicator()),
    ),
    error: (error, _) => Column(
      children: [
        Text(requestError(error)),
        TextButton(onPressed: retry, child: const Text('Повторить')),
      ],
    ),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {this.drawing, super.key});
  final InkDrawing? drawing;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
    child: Row(
      children: [
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.titleLarge),
        ),
        if (drawing != null) ...[
          const SizedBox(width: 12),
          InkIllustration(drawing!, width: 66, height: 46),
        ],
      ],
    ),
  );
}

Future<String?> askText(
  BuildContext context,
  String title, {
  String initial = '',
  int maxLength = 160,
  int lines = 1,
  String action = 'Сохранить',
}) async {
  var value = initial;
  return showDialog<String>(
    context: context,
    animationStyle: InkMotion.styleOf(context),
    builder: (context) => AlertDialog(
      scrollable: true,
      title: Text(title),
      content: TextFormField(
        initialValue: initial,
        autofocus: true,
        minLines: lines,
        maxLines: lines == 1 ? 1 : null,
        maxLength: maxLength,
        onChanged: (text) => value = text,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () {
            if (value.trim().isNotEmpty) Navigator.pop(context, value.trim());
          },
          child: Text(action),
        ),
      ],
    ),
  );
}

class ActionButton extends StatefulWidget {
  const ActionButton({required this.label, required this.run, super.key});
  final String label;
  final Future<void> Function()? run;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool busy = false;

  Future<void> submit() async {
    if (busy || widget.run == null) return;
    setState(() => busy = true);
    try {
      await widget.run!();
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(requestError(error))));
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: busy || widget.run == null ? null : submit,
    child: InkReveal(
      onMount: false,
      change: busy,
      child: Text(busy ? 'Подождите…' : widget.label),
    ),
  );
}

const workspaceSections = [
  ('/assistant', 'ИИ-помощник', Icons.auto_awesome_outlined),
  ('/classes', 'Классы', Icons.groups_outlined),
  ('/achievements', 'Достижения', Icons.emoji_events_outlined),
  ('/billing', 'Тариф и подписка', Icons.credit_card_outlined),
  ('/saved-articles', 'Сохранённые статьи', Icons.bookmarks_outlined),
];

class WorkspaceMenu extends StatelessWidget {
  const WorkspaceMenu({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Разделы кабинета')),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        for (final (path, name, icon) in workspaceSections) ...[
          ListTile(
            leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
            title: Text(name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(path),
          ),
          const Divider(height: 1),
        ],
      ],
    ),
  );
}
