import 'package:flutter/material.dart';

import '../../widgets/ink_motion.dart';
import '../../widgets/ink_illustration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'study_provider.dart';
import '../library/library_provider.dart';
import '../../widgets/library_status.dart';
import 'test_setup_screen.dart';

/// Экран выбора режима обучения перед стартом сессии.
class StudySetupScreen extends ConsumerStatefulWidget {
  const StudySetupScreen({
    super.key,
    required this.setId,
    required this.setTitle,
  }) : isCourse = false;

  const StudySetupScreen.course({
    super.key,
    required String courseId,
    required String title,
  }) : setId = courseId,
       setTitle = title,
       isCourse = true;

  final bool isCourse;

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

    final notifier = ref.read(studySessionProvider.notifier);
    if (widget.isCourse) {
      await notifier.beginCourse(widget.setId, mode);
    } else {
      await notifier.begin(widget.setId, mode);
    }
    if (!mounted) return;

    final session = ref.read(studySessionProvider);
    if (session.items.isEmpty) {
      setState(() => _starting = null);
      _showError(session.error ?? 'Не удалось начать сессию.');
      return;
    }

    if (widget.isCourse) {
      context.pushReplacement('/course/${widget.setId}/study/${mode.name}');
    } else {
      context.go('/set/${widget.setId}/study/${mode.name}');
    }
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
    final library = widget.isCourse ? null : ref.watch(libraryProvider);
    final set = library?.sets.where((s) => s.id == widget.setId).firstOrNull;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.setTitle),
        actions: [
          if (!widget.isCourse)
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
        course: widget.isCourse,
        footer: library == null
            ? null
            : LibraryStatusFooter(
                savedLabel: set?.isSaved == true
                    ? 'Набор сохранён в библиотеке.'
                    : null,
                downloaded: library.downloadedSetIds.contains(widget.setId),
                outdated: library.outdatedSetIds.contains(widget.setId),
                hasUpdates: set?.hasUpdates == true,
              ),
        starting: _starting,
        enabled: !busy,
        onFlashcards: () => _start(StudyMode.flashcards),
        onLearn: () => _start(StudyMode.learn),
        onWrite: () => _start(StudyMode.write),
        onTest: _startStandardTest,
        onBattle: () => context.push(
          '/set/${widget.setId}/battle?title=${Uri.encodeComponent(widget.setTitle)}',
        ),
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
    this.course = false,
    this.footer,
    this.onBattle = _noop,
    required this.onCustomQuiz,
    super.key,
  });

  final bool course;
  final Widget? footer;
  final String? starting;
  final bool enabled;
  final VoidCallback onFlashcards;
  final VoidCallback onLearn;
  final VoidCallback onWrite;
  final VoidCallback onTest;
  final VoidCallback onBattle;
  final VoidCallback onCustomQuiz;

  @override
  Widget build(BuildContext context) {
    final entries = [
      _ModeEntry(
        id: StudyMode.flashcards.name,
        drawing: InkDrawing.cards,
        title: 'Карточки',
        description: 'Переворачивайте и оценивайте себя',
        onTap: onFlashcards,
      ),
      _ModeEntry(
        id: StudyMode.learn.name,
        drawing: InkDrawing.books,
        title: 'Учить',
        description: 'Адаптивные вопросы под ваш прогресс',
        recommended: true,
        onTap: onLearn,
      ),
      _ModeEntry(
        id: StudyMode.write.name,
        drawing: InkDrawing.write,
        title: 'Писать',
        description: 'Ввод ответа с проверкой написания',
        onTap: onWrite,
      ),
      if (!course)
        _ModeEntry(
          id: 'test',
          drawing: InkDrawing.choice,
          title: 'Тест',
          description: 'Быстрая проверка в готовом формате',
          onTap: onTest,
        ),
      if (!course)
        _ModeEntry(
          id: 'battle',
          drawing: InkDrawing.match,
          title: 'Битва',
          description: 'Соревнуйтесь с другом на одном наборе',
          onTap: onBattle,
        ),
    ];
    final textScale = MediaQuery.textScalerOf(context).scale(1);

    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 720 && textScale <= 1.3
              ? 3
              : constraints.maxWidth >= 360 && textScale <= 1.5
              ? 2
              : 1;
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
                      course
                          ? 'Карточки всех материалов перемешиваются перед каждым проходом.'
                          : 'Выберите готовый режим или соберите свой квиз.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: RemoraSpacing.xl),
                    for (
                      var start = 0;
                      start < entries.length;
                      start += columns
                    ) ...[
                      if (start > 0) const SizedBox(height: RemoraSpacing.sm),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (
                              var column = 0;
                              column < columns;
                              column++
                            ) ...[
                              if (column > 0)
                                const SizedBox(width: RemoraSpacing.sm),
                              Expanded(
                                child: start + column >= entries.length
                                    ? const SizedBox.shrink()
                                    : _ModeCard(
                                        entry: entries[start + column],
                                        loading:
                                            starting ==
                                            entries[start + column].id,
                                        enabled: enabled,
                                      ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: RemoraSpacing.sm),
                    if (!course)
                      _CustomQuizCard(enabled: enabled, onTap: onCustomQuiz),
                    ?footer,
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

void _noop() {}

class _ModeEntry {
  const _ModeEntry({
    required this.id,
    required this.drawing,
    required this.title,
    required this.description,
    required this.onTap,
    this.recommended = false,
  });

  final String id;
  final InkDrawing drawing;
  final String title;
  final String description;
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
    final color = theme.colorScheme.primary;

    return Semantics(
      button: true,
      enabled: enabled,
      label: entry.recommended
          ? '${entry.title}, рекомендуемый режим. ${entry.description}'
          : '${entry.title}. ${entry.description}',
      child: AnimatedOpacity(
        duration: MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : const Duration(milliseconds: 160),
        opacity: enabled || loading ? 1 : 0.46,
        child: Material(
          color: entry.recommended
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surface,
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
                      Flexible(
                        child: AnimatedRotation(
                          turns:
                              loading &&
                                  !MediaQuery.disableAnimationsOf(context)
                              ? -0.018
                              : 0,
                          duration: InkMotion.styleOf(context).duration!,
                          curve: InkMotion.curve,
                          child: InkIllustration(
                            entry.drawing,
                            width: 72,
                            height: 48,
                          ),
                        ),
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
                  const SizedBox(height: RemoraSpacing.md),
                  Text(entry.title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: RemoraSpacing.xxs),
                  Text(
                    entry.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const Spacer(),
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
