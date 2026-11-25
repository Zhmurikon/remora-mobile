import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'space_rewards.dart';

class StudyResultCard extends StatefulWidget {
  const StudyResultCard({
    super.key,
    required this.correct,
    required this.total,
    required this.complete,
    this.answers = const [],
    this.score,
  });
  final int correct, total;
  final bool complete;
  final List<bool> answers;
  final int? score;

  @override
  State<StudyResultCard> createState() => _StudyResultCardState();
}

class _StudyResultCardState extends State<StudyResultCard> {
  int replay = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context), colors = theme.colorScheme;
    if (widget.total == 0) {
      return const Center(child: Text('В этой сессии пока нет ответов'));
    }
    final scene = widget.correct == 0
        ? SpaceScene.failed
        : widget.correct == widget.total && widget.complete
        ? SpaceScene.perfect
        : SpaceScene.partial;
    final title = switch (scene) {
      SpaceScene.perfect => 'Звёздная печать',
      SpaceScene.failed => 'Мягкая посадка',
      _ => 'Выход на орбиту',
    };
    final success = theme.brightness == Brightness.dark
        ? RemoraColors.darkSuccess
        : RemoraColors.lightSuccess;
    final paper = Color.alphaBlend(
      RemoraColors.lightOchreSubtle.withValues(alpha: .30),
      RemoraColors.lightSurface,
    );
    final numbers = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Точность ответов',
            style: theme.textTheme.labelLarge?.copyWith(letterSpacing: 1.1),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${widget.score ?? (100 * widget.correct / widget.total).round()}',
                  ),
                  TextSpan(
                    text: '%',
                    style: TextStyle(
                      fontSize: 38,
                      color: theme.brightness == Brightness.dark
                          ? RemoraColors.darkOchre
                          : RemoraColors.lightWarning,
                    ),
                  ),
                ],
              ),
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 82,
                height: 1.1,
                letterSpacing: -3,
              ),
            ),
          ),
          Text(
            'Верно ${widget.correct} из ${widget.total}',
            style: theme.textTheme.titleLarge,
          ),
          if (widget.answers.length == widget.total) ...[
            const SizedBox(height: 12),
            CustomPaint(
              size: const Size(double.infinity, 8),
              painter: _AnswerStrip(
                widget.answers,
                success,
                colors.error,
                colors.surface,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            'С ошибкой · ${widget.total - widget.correct}',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
    final illustration = DecoratedBox(
      decoration: BoxDecoration(color: paper),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 240 / 133,
                child: ExcludeSemantics(
                  child: SpaceSprite(
                    key: ValueKey((scene, replay)),
                    scene: scene,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  color: RemoraColors.lightFgMuted,
                  tooltip: 'Повторить анимацию',
                  icon: const Icon(Icons.replay_rounded),
                  onPressed: () => setState(() => replay++),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: RemoraColors.lightFg,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 740),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: LayoutBuilder(
            builder: (_, box) => box.maxWidth >= 580
                ? Row(
                    children: [
                      Expanded(child: numbers),
                      Expanded(child: illustration),
                    ],
                  )
                : Column(children: [numbers, illustration]),
          ),
        ),
      ),
    );
  }
}

class _AnswerStrip extends CustomPainter {
  _AnswerStrip(this.answers, this.success, this.error, this.surface);
  final List<bool> answers;
  final Color success, error, surface;
  @override
  void paint(Canvas canvas, Size size) {
    final step = size.width / answers.length;
    final paint = Paint();
    for (var i = 0; i < answers.length; i++) {
      final rect = Rect.fromLTWH(
        i * step,
        0,
        step * (step > 8 ? .86 : 1),
        size.height,
      );
      canvas.drawRect(rect, paint..color = answers[i] ? success : error);
      if (!answers[i] && step > 6) {
        canvas.save();
        canvas.clipRect(rect);
        for (var x = rect.left - size.height; x < rect.right; x += 5) {
          canvas.drawLine(
            Offset(x, rect.bottom),
            Offset(x + size.height, 0),
            paint..color = surface,
          );
        }
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(_AnswerStrip old) =>
      old.answers != answers ||
      old.success != success ||
      old.error != error ||
      old.surface != surface;
}
