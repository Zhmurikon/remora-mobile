import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';

class StudyFlipCard extends StatelessWidget {
  const StudyFlipCard({
    required this.item,
    required this.isAnswer,
    this.showSideName = false,
    required this.onFlip,
    super.key,
  });

  final QueueItem item;
  final bool isAnswer;
  final bool showSideName;
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) {
      return _face(context, isAnswer);
    }
    final target = isAnswer ? 1.0 : 0.0;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: target, end: target),
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOut,
      builder: (context, progress, _) {
        final back = progress >= 0.5;
        final angle = (back ? progress - 1 : progress) * math.pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0012)
            ..rotateY(angle),
          child: _face(context, back),
        );
      },
    );
  }

  Widget _face(BuildContext context, bool back) {
    final theme = Theme.of(context);
    final isTermToDef = item.direction == 'term_to_def';
    final text = back
        ? (isTermToDef ? item.card.definition : item.card.term)
        : (isTermToDef ? item.card.term : item.card.definition);
    final imageUrl = back
        ? (isTermToDef ? item.card.definitionImageUrl : item.card.termImageUrl)
        : (isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl);

    final action = onFlip == null || back != isAnswer ? null : onFlip;
    return Semantics(
      button: action != null,
      liveRegion: back,
      label: back ? 'Ответ. $text' : 'Вопрос. $text. Показать ответ',
      onTap: action,
      child: Material(
        color: back ? context.remora.surfaceMuted : theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RemoraRadii.large),
          side: BorderSide(color: theme.colorScheme.outline, width: 1.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: action,
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  showSideName
                      ? (isTermToDef != back ? 'ТЕРМИН' : 'ОПРЕДЕЛЕНИЕ')
                      : (back ? 'ОТВЕТ' : 'ВОПРОС'),
                  style: context.remoraType.compactLabel.copyWith(
                    color: back
                        ? theme.colorScheme.primary
                        : context.remora.textSubtle,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      key: ValueKey(back),
                      child: Column(
                        children: [
                          if (!back && item.card.hint?.isNotEmpty == true) ...[
                            _StudyHint(text: item.card.hint!),
                            const SizedBox(height: RemoraSpacing.md),
                          ],
                          CardContentWidget(
                            value: text,
                            contentType: item.card.contentType,
                            codeLanguage: item.card.codeLanguage,
                            imageUrl: imageUrl,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!back || showSideName)
                  Center(
                    child: TextButton.icon(
                      onPressed: action,
                      icon: const Icon(Icons.touch_app_rounded),
                      label: Text(
                        back ? 'Вернуться к вопросу' : 'Показать ответ',
                      ),
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
