import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import 'study_provider.dart';

/// Оболочка обучающей сессии: AppBar с прогрессом и offline-индикатор.
class StudyShell extends ConsumerWidget {
  const StudyShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(studySessionProvider);
    final notifier = ref.read(studySessionProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.setTitle,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            if (state.total > 0)
              Text(
                '${state.answered} / ${state.total}',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? RemoraColors.darkFgSubtle
                      : RemoraColors.lightFgSubtle,
                ),
              ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Завершить',
          onPressed: () async {
            final shouldExit = await _confirmExit(context, state);
            if (shouldExit && context.mounted) {
              await notifier.finish();
              if (context.mounted) context.go('/');
            }
          },
        ),
        actions: [
          if (state.pending > 0) ...[
            IconButton(
              icon: Badge(
                label: Text('${state.pending}'),
                child: const Icon(Icons.cloud_upload_outlined),
              ),
              tooltip: 'Отправить ответы (${state.pending})',
              onPressed: () => notifier.flushOutbox(),
            ),
          ],
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
        bottom: state.total > 0
            ? PreferredSize(
                preferredSize: const Size.fromHeight(3),
                child: LinearProgressIndicator(
                  value: state.progress,
                  backgroundColor: isDark
                      ? RemoraColors.darkSurfaceMuted
                      : RemoraColors.lightSurfaceMuted,
                  valueColor: AlwaysStoppedAnimation(
                    isDark
                        ? RemoraColors.darkPrimary
                        : RemoraColors.lightPrimary,
                  ),
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }

  Future<bool> _confirmExit(BuildContext context, StudySessionState state) async {
    if (state.answered == 0) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Завершить обучение?'),
        content: Text(
          'Отвечено ${state.answered} из ${state.total}.\n'
          'Правильных: ${state.correct}.\n'
          '${state.pending > 0 ? 'Неотправленных ответов: ${state.pending}.' : ''}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Продолжить'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Завершить'),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
