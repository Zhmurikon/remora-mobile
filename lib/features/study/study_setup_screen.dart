import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import 'study_provider.dart';

/// Экран выбора режима обучения перед стартом сессии.
class StudySetupScreen extends ConsumerWidget {
  const StudySetupScreen({super.key, required this.setId, required this.setTitle});

  final String setId;
  final String setTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final modes = [
      _ModeEntry(
        mode: StudyMode.flashcards,
        icon: Icons.style,
        title: 'Карточки',
        description: 'Переворачивайте карточки и оценивайте себя',
        color: isDark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary,
      ),
      _ModeEntry(
        mode: StudyMode.learn,
        icon: Icons.school,
        title: 'Учить',
        description: 'Адаптивные вопросы: ввод и самооценка',
        color: isDark ? RemoraColors.darkAccent : RemoraColors.lightAccent,
      ),
      _ModeEntry(
        mode: StudyMode.write,
        icon: Icons.edit,
        title: 'Писать',
        description: 'Ввод ответа с проверкой орфографии',
        color: isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(setTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Выберите режим',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ...modes.map((m) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ModeCard(
                    entry: m,
                    onTap: () async {
                      await ref
                          .read(studySessionProvider.notifier)
                          .begin(setId, m.mode);
                      if (context.mounted) {
                        context.go('/set/$setId/study/${m.mode.name}');
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _ModeEntry {
  final StudyMode mode;
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ModeEntry({
    required this.mode,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({required this.entry, required this.onTap});

  final _ModeEntry entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: entry.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(entry.icon, color: entry.color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.title,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      entry.description,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
