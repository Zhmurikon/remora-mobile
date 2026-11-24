import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../workspace/workspace.dart';
import 'study_provider.dart';

class StudyFoldersScreen extends ConsumerStatefulWidget {
  const StudyFoldersScreen({super.key});
  @override
  ConsumerState<StudyFoldersScreen> createState() => _StudyFoldersScreenState();
}

class _StudyFoldersScreenState extends ConsumerState<StudyFoldersScreen> {
  String? _opening;

  Future<void> _start(String id) async {
    if (_opening != null) return;
    setState(() => _opening = id);
    await ref.read(studySessionProvider.notifier).beginFolder(id);
    if (!mounted) return;
    setState(() => _opening = null);
    final state = ref.read(studySessionProvider);
    if (state.items.isNotEmpty) {
      context.push('/folder/$id/study/learn');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.error ?? 'Нет карточек')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final folders = workspaceList('folders');
    return Scaffold(
      appBar: AppBar(title: const Text('Учить папку')),
      body: RemoteContent(
        ref.watch(folders),
        retry: () => ref.invalidate(folders),
        builder: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('В библиотеке пока нет папок'));
          }
          return ListView(
            children: [
              for (final folder in items)
                ListTile(
                  title: Text(folder['title']),
                  leading: const Icon(Icons.folder_outlined),
                  trailing: _opening == folder['id']
                      ? const CircularProgressIndicator()
                      : null,
                  onTap: _opening == null ? () => _start(folder['id']) : null,
                ),
            ],
          );
        },
      ),
    );
  }
}
