import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/format.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import 'study_provider.dart';
import 'study_shell.dart';

/// Режим «Карточки»: переворот, навигация, самооценка.
class FlashcardsScreen extends ConsumerStatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen> {
  final _keyboardFocus = FocusNode();
  bool _isFlipped = false;
  bool _submitting = false;

  @override
  void dispose() {
    _keyboardFocus.dispose();
    super.dispose();
  }

  void _flip() {
    if (_submitting) return;
    HapticFeedback.selectionClick();
    setState(() => _isFlipped = !_isFlipped);
  }

  Future<void> _rate(int rating) async {
    if (_submitting) return;
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    setState(() => _submitting = true);
    await ref
        .read(studySessionProvider.notifier)
        .answer(item: item, rating: rating);
    if (!mounted) return;
    setState(() {
      _isFlipped = false;
      _submitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studySessionProvider);

    ref.listen<StudySessionState>(studySessionProvider, (prev, next) {
      if (next.isFinished && !(prev?.isFinished ?? false)) {
        final setId = GoRouterState.of(context).pathParameters['setId'] ?? '';
        context.go('/set/$setId/study/result');
      }
    });

    if (state.isFinished) {
      return const StudyShell(child: SizedBox.shrink());
    }

    final item = state.currentItem;
    if (item == null) {
      return const StudyShell(child: Center(child: Text('Очередь пуста')));
    }

    return StudyShell(
      child: KeyboardListener(
        focusNode: _keyboardFocus,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is! KeyDownEvent) return;
          switch (event.logicalKey) {
            case LogicalKeyboardKey.space:
            case LogicalKeyboardKey.enter:
              _flip();
            case LogicalKeyboardKey.digit1:
              if (_isFlipped) _rate(1);
            case LogicalKeyboardKey.digit2:
              if (_isFlipped) _rate(2);
            case LogicalKeyboardKey.digit3:
              if (_isFlipped) _rate(3);
            case LogicalKeyboardKey.digit4:
              if (_isFlipped) _rate(4);
          }
        },
        child: FlashcardStudyView(
          item: item,
          isFlipped: _isFlipped,
          submitting: _submitting,
          onFlip: _flip,
          onRate: _rate,
        ),
      ),
    );
  }
}

class FlashcardStudyView extends StatelessWidget {
  const FlashcardStudyView({
    required this.item,
    required this.isFlipped,
    required this.submitting,
    required this.onFlip,
    required this.onRate,
    super.key,
  });

  final QueueItem item;
  final bool isFlipped;
  final bool submitting;
  final VoidCallback onFlip;
  final ValueChanged<int> onRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(RemoraSpacing.md),
      child: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: MediaQuery.disableAnimationsOf(context)
                  ? Duration.zero
                  : const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeOutCubic,
              child: _FlashcardSurface(
                key: ValueKey(isFlipped),
                item: item,
                isAnswer: isFlipped,
                onFlip: onFlip,
              ),
            ),
          ),
          if (isFlipped) ...[
            const SizedBox(height: RemoraSpacing.md),
            _RatingPanel(item: item, submitting: submitting, onRate: onRate),
          ],
        ],
      ),
    );
  }
}

class _FlashcardSurface extends StatelessWidget {
  const _FlashcardSurface({
    required this.item,
    required this.isAnswer,
    required this.onFlip,
    super.key,
  });

  final QueueItem item;
  final bool isAnswer;
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTermToDef = item.direction == 'term_to_def';
    final text = isAnswer
        ? (isTermToDef ? item.card.definition : item.card.term)
        : (isTermToDef ? item.card.term : item.card.definition);
    final imageUrl = isAnswer
        ? (isTermToDef ? item.card.definitionImageUrl : item.card.termImageUrl)
        : (isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl);

    return Semantics(
      button: !isAnswer,
      liveRegion: isAnswer,
      label: isAnswer ? 'Ответ. $text' : 'Вопрос. $text. Показать ответ',
      onTap: isAnswer ? null : onFlip,
      child: Material(
        color: isAnswer
            ? context.remora.surfaceMuted
            : theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RemoraRadii.large),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isAnswer ? null : onFlip,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  isAnswer ? 'ОТВЕТ' : 'ВОПРОС',
                  style: context.remoraType.compactLabel.copyWith(
                    color: isAnswer
                        ? theme.colorScheme.primary
                        : context.remora.textSubtle,
                  ),
                ),
                if (!isAnswer && item.card.hint != null) ...[
                  const SizedBox(height: RemoraSpacing.md),
                  _StudyHint(text: item.card.hint!),
                ],
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: CardContentWidget(
                        value: text,
                        contentType: item.card.contentType,
                        codeLanguage: item.card.codeLanguage,
                        imageUrl: imageUrl,
                      ),
                    ),
                  ),
                ),
                if (!isAnswer)
                  Center(
                    child: TextButton.icon(
                      onPressed: onFlip,
                      icon: const Icon(Icons.touch_app_rounded),
                      label: const Text('Показать ответ'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StudyHint extends StatelessWidget {
  const _StudyHint({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.lightbulb_outline_rounded,
          size: 20,
          color: theme.colorScheme.tertiary,
        ),
        const SizedBox(width: RemoraSpacing.xs),
        Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
      ],
    );
  }
}

class _RatingPanel extends StatelessWidget {
  const _RatingPanel({
    required this.item,
    required this.submitting,
    required this.onRate,
  });

  final QueueItem item;
  final bool submitting;
  final ValueChanged<int> onRate;

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = textScale > 1.15 || constraints.maxWidth < 380;
        final children = List.generate(4, (index) {
          final rating = index + 1;
          final preview = item.previews
              .where((value) => value.rating == rating)
              .firstOrNull;
          final interval = preview == null
              ? null
              : formatIntervalSeconds(preview.intervalSeconds);
          return _RatingButton(
            rating: rating,
            interval: interval,
            enabled: !submitting,
            onPressed: () => onRate(rating),
          );
        });

        if (stacked) {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: RemoraSpacing.xs,
            crossAxisSpacing: RemoraSpacing.xs,
            childAspectRatio: 2.5,
            children: children,
          );
        }
        return Row(
          children: [
            for (var index = 0; index < children.length; index++) ...[
              if (index > 0) const SizedBox(width: RemoraSpacing.xs),
              Expanded(child: children[index]),
            ],
          ],
        );
      },
    );
  }
}

class _RatingButton extends StatelessWidget {
  const _RatingButton({
    required this.rating,
    required this.interval,
    required this.enabled,
    required this.onPressed,
  });

  final int rating;
  final String? interval;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labels = ['Не помню', 'Трудно', 'Хорошо', 'Легко'];
    final colors = [
      theme.colorScheme.error,
      context.remora.warning,
      theme.colorScheme.primary,
      context.remora.success,
    ];
    final label = labels[rating - 1];
    final color = colors[rating - 1];
    final semantics = interval == null
        ? label
        : '$label, следующая через $interval';

    return Semantics(
      button: true,
      enabled: enabled,
      label: semantics,
      child: ExcludeSemantics(
        child: SizedBox(
          height: 64,
          child: rating == 3
              ? FilledButton(
                  onPressed: enabled ? onPressed : null,
                  child: _RatingLabel(label: label, interval: interval),
                )
              : OutlinedButton(
                  onPressed: enabled ? onPressed : null,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: color,
                    side: BorderSide(color: color),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                  child: _RatingLabel(label: label, interval: interval),
                ),
        ),
      ),
    );
  }
}

class _RatingLabel extends StatelessWidget {
  const _RatingLabel({required this.label, required this.interval});

  final String label;
  final String? interval;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        if (interval != null)
          Text(
            interval!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall,
          ),
      ],
    );
  }
}
