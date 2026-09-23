import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import 'study_provider.dart';

/// Экран выбора режима обучения перед стартом сессии.
class StudySetupScreen extends ConsumerStatefulWidget {
  const StudySetupScreen({super.key, required this.setId, required this.setTitle});

  final String setId;
  final String setTitle;

  @override
  ConsumerState<StudySetupScreen> createState() => _StudySetupScreenState();
}

class _StudySetupScreenState extends ConsumerState<StudySetupScreen> {
  // Режим, для которого сейчас строится очередь. Пока не null — новые тапы
  // игнорируются, чтобы на медленной сети не плодить параллельные begin.
  StudyMode? _starting;

  Future<void> _start(StudyMode mode) async {
    if (_starting != null) return;
    setState(() => _starting = mode);

    await ref.read(studySessionProvider.notifier).begin(widget.setId, mode);
    if (!mounted) return;

    final session = ref.read(studySessionProvider);
    if (session.items.isEmpty) {
      // Очередь пуста (офлайн без скачивания или сбой) — не уходим в пустую сессию.
      setState(() => _starting = null);
      final message = session.error ?? 'Не удалось начать сессию.';
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
      return;
    }

    context.go('/set/${widget.setId}/study/${mode.name}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final busy = _starting != null;

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
      appBar: AppBar(
        title: Text(widget.setTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Настройки заучивания',
            onPressed: busy
                ? null
                : () => context.push(
                      '/set/${widget.setId}/study/settings'
                      '?title=${Uri.encodeComponent(widget.setTitle)}',
                    ),
          ),
        ],
      ),
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
                    loading: _starting == m.mode,
                    enabled: !busy,
                    onTap: () => _start(m.mode),
                  ),
                )),
            // Тест — отдельный маршрут (не использует StudySessionNotifier)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _TestCard(
                onTap: busy
                    ? null
                    : () => context.go(
                          '/set/${widget.setId}/test?title=${Uri.encodeComponent(widget.setTitle)}',
                        ),
                isDark: isDark,
              ),
            ),
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
  const _ModeCard({
    required this.entry,
    required this.onTap,
    this.loading = false,
    this.enabled = true,
  });

  final _ModeEntry entry;
  final VoidCallback onTap;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Opacity(
      // Пока строится очередь — остальные карточки притушены.
      opacity: enabled || loading ? 1 : 0.5,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: enabled ? onTap : null,
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
                loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  const _TestCard({required this.onTap, required this.isDark});

  final VoidCallback? onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        isDark ? RemoraColors.darkAccent : RemoraColors.lightAccent;

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
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.quiz, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тест',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      'Проверка знаний: выбор, верно/неверно, ввод',
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
