import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'study_provider.dart';
import 'test_setup_screen.dart';

/// Экран выбора режима обучения перед стартом сессии.
class StudySetupScreen extends ConsumerStatefulWidget {
  const StudySetupScreen({
    super.key,
    required this.setId,
    required this.setTitle,
  });

  final String setId;
  final String setTitle;

  @override
  ConsumerState<StudySetupScreen> createState() => _StudySetupScreenState();
}

class _StudySetupScreenState extends ConsumerState<StudySetupScreen> {
  String? _starting;

  Future<void> _start(StudyMode mode) async {
    if (_starting != null) return;
    setState(() => _starting = mode.name);

    await ref.read(studySessionProvider.notifier).begin(widget.setId, mode);
    if (!mounted) return;

    final session = ref.read(studySessionProvider);
    if (session.items.isEmpty) {
      setState(() => _starting = null);
      _showError(session.error ?? 'Не удалось начать сессию.');
      return;
    }

    context.go('/set/${widget.setId}/study/${mode.name}');
  }

  Future<void> _startStandardTest() async {
    if (_starting != null) return;
    setState(() => _starting = 'test');
    await ref
        .read(testSessionProvider.notifier)
        .createTest(widget.setId, TestConfig());
    if (!mounted) return;

    final test = ref.read(testSessionProvider);
    if (test.attempt == null) {
      setState(() => _starting = null);
      _showError(test.error ?? 'Не удалось создать тест.');
      return;
    }
    context.go('/set/${widget.setId}/test/${test.attempt!.id}');
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final busy = _starting != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.setTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
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
      body: StudyModeView(
        starting: _starting,
        enabled: !busy,
        onFlashcards: () => _start(StudyMode.flashcards),
        onLearn: () => _start(StudyMode.learn),
        onWrite: () => _start(StudyMode.write),
        onTest: _startStandardTest,
        onCustomQuiz: () => context.push(
          '/set/${widget.setId}/quiz'
          '?title=${Uri.encodeComponent(widget.setTitle)}',
        ),
      ),
    );
  }
}

class StudyModeView extends StatelessWidget {
  const StudyModeView({
    required this.starting,
    required this.enabled,
    required this.onFlashcards,
    required this.onLearn,
    required this.onWrite,
    required this.onTest,
    required this.onCustomQuiz,
    super.key,
  });

  final String? starting;
  final bool enabled;
  final VoidCallback onFlashcards;
  final VoidCallback onLearn;
  final VoidCallback onWrite;
  final VoidCallback onTest;
  final VoidCallback onCustomQuiz;

  @override
  Widget build(BuildContext context) {
    final entries = [
      _ModeEntry(
        id: StudyMode.flashcards.name,
        icon: Icons.style_rounded,
        title: 'Карточки',
        description: 'Переворачивайте и оценивайте себя',
        tone: _ModeTone.primary,
        onTap: onFlashcards,
      ),
      _ModeEntry(
        id: StudyMode.learn.name,
        icon: Icons.school_rounded,
        title: 'Учить',
        description: 'Адаптивные вопросы под ваш прогресс',
        tone: _ModeTone.ochre,
        recommended: true,
        onTap: onLearn,
      ),
      _ModeEntry(
        id: StudyMode.write.name,
        icon: Icons.edit_rounded,
        title: 'Писать',
        description: 'Ввод ответа с проверкой написания',
        tone: _ModeTone.success,
        onTap: onWrite,
      ),
      _ModeEntry(
        id: 'test',
        icon: Icons.fact_check_rounded,
        title: 'Тест',
        description: 'Быстрая проверка в готовом формате',
        tone: _ModeTone.accent,
        onTap: onTest,
      ),
    ];
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final tileHeight = textScale > 1.15 ? 230.0 : 196.0;

    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 1000;
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              RemoraSpacing.lg,
              RemoraSpacing.lg,
              RemoraSpacing.lg,
              RemoraSpacing.xxl,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Как будем учиться?',
                      style: context.remoraType.readingTitle.copyWith(
                        fontSize: 36,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: RemoraSpacing.xs),
                    Text(
                      'Выберите готовый режим или соберите свой квиз.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: RemoraSpacing.xl),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: entries.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: wide ? 4 : 2,
                        mainAxisExtent: wide ? 204 : tileHeight,
                        crossAxisSpacing: RemoraSpacing.sm,
                        mainAxisSpacing: RemoraSpacing.sm,
                      ),
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return _ModeCard(
                          entry: entry,
                          loading: starting == entry.id,
                          enabled: enabled,
                        );
                      },
                    ),
                    const SizedBox(height: RemoraSpacing.sm),
                    _CustomQuizCard(enabled: enabled, onTap: onCustomQuiz),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum _ModeTone { primary, ochre, success, accent }

class _ModeEntry {
  const _ModeEntry({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.tone,
    required this.onTap,
    this.recommended = false,
  });

  final String id;
  final IconData icon;
  final String title;
  final String description;
  final _ModeTone tone;
  final VoidCallback onTap;
  final bool recommended;
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.entry,
    required this.loading,
    required this.enabled,
  });

  final _ModeEntry entry;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (color, container) = switch (entry.tone) {
      _ModeTone.primary => (
        theme.colorScheme.primary,
        theme.colorScheme.primaryContainer,
      ),
      _ModeTone.ochre => (context.remora.ochre, context.remora.ochreContainer),
      _ModeTone.success => (
        context.remora.success,
        context.remora.successContainer,
      ),
      _ModeTone.accent => (
        theme.colorScheme.tertiary,
        theme.colorScheme.tertiaryContainer,
      ),
    };

    return Semantics(
      button: true,
      enabled: enabled,
      label: entry.recommended
          ? '${entry.title}, рекомендуемый режим. ${entry.description}'
          : '${entry.title}. ${entry.description}',
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 160),
        opacity: enabled || loading ? 1 : 0.46,
        child: Material(
          color: container.withValues(alpha: 0.58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RemoraRadii.card),
            side: BorderSide(
              color: entry.recommended ? color : theme.colorScheme.outline,
              width: entry.recommended ? 1.5 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: enabled ? entry.onTap : null,
            child: Padding(
              padding: const EdgeInsets.all(RemoraSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(
                            RemoraRadii.control,
                          ),
                        ),
                        child: Icon(entry.icon, color: color),
                      ),
                      if (loading)
                        SizedBox.square(
                          dimension: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: color,
                          ),
                        )
                      else if (entry.recommended)
                        Icon(
                          Icons.star_rounded,
                          color: color,
                          semanticLabel: 'Рекомендуем',
                        ),
                    ],
                  ),
                  const Spacer(),
                  Text(entry.title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: RemoraSpacing.xxs),
                  Text(
                    entry.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: RemoraSpacing.xs),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Icon(Icons.arrow_forward_rounded, color: color),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomQuizCard extends StatelessWidget {
  const _CustomQuizCard({required this.enabled, required this.onTap});

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      enabled: enabled,
      label: 'Свой квиз. Выберите форматы вопросов, направление и карточки.',
      child: Material(
        color: context.remora.surfaceMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RemoraRadii.card),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.md),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(RemoraRadii.control),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: RemoraSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Свой квиз', style: theme.textTheme.titleLarge),
                      const SizedBox(height: RemoraSpacing.xxs),
                      Text(
                        'Форматы вопросов, направление, объём и источник карточек',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: RemoraSpacing.sm),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
