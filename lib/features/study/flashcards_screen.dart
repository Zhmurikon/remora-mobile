import 'dart:math' as math;

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

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flip() {
    if (_isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => _isFlipped = !_isFlipped);
  }

  void _resetFlip() {
    _flipController.reset();
    _isFlipped = false;
  }

  Future<void> _rate(int rating) async {
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    await ref.read(studySessionProvider.notifier).answer(
          item: item,
          rating: rating,
        );
    _resetFlip();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studySessionProvider);

    ref.listen<StudySessionState>(studySessionProvider, (prev, next) {
      if (next.isFinished && !(prev?.isFinished ?? false)) {
        final setId =
            GoRouterState.of(context).pathParameters['setId'] ?? '';
        context.go('/set/$setId/study/result');
      }
    });

    if (state.isFinished) {
      return const StudyShell(child: SizedBox.shrink());
    }

    final item = state.currentItem;
    if (item == null) {
      return const StudyShell(
        child: Center(child: Text('Очередь пуста')),
      );
    }

    return StudyShell(
      child: KeyboardListener(
        focusNode: FocusNode(),
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
        child: _buildCard(context, item, state),
      ),
    );
  }

  /// Высота зоны с кнопками самооценки резервируется заранее — так карточка
  /// не скачет по высоте в момент переворота, когда кнопки появляются.
  static const double _ratingAreaHeight = 78;

  Widget _buildCard(BuildContext context, QueueItem item, StudySessionState state) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: _flip,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * math.pi;
                  final isAnswer = angle > math.pi / 2;
                  final face = _buildCardFace(
                    context,
                    item: item,
                    isAnswer: isAnswer,
                    isDark: isDark,
                  );
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0012)
                      ..rotateY(angle),
                    child: isAnswer
                        ? Transform(
                            alignment: Alignment.center,
                            // Разворачиваем содержимое обратно, иначе текст
                            // на второй половине анимации получается зеркальным.
                            transform: Matrix4.identity()..rotateY(math.pi),
                            child: face,
                          )
                        : face,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: _ratingAreaHeight,
              child: _isFlipped
                  ? _buildRatingButtons(context, item, state)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardFace(
    BuildContext context, {
    required QueueItem item,
    required bool isAnswer,
    required bool isDark,
  }) {
    final isTermToDef = item.direction == 'term_to_def';
    final text = isAnswer
        ? (isTermToDef ? item.card.definition : item.card.term)
        : (isTermToDef ? item.card.term : item.card.definition);
    final imageUrl = isAnswer
        ? (isTermToDef ? item.card.definitionImageUrl : item.card.termImageUrl)
        : (isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl);

    final faceColor = isAnswer
        ? (isDark ? RemoraColors.darkSurfaceMuted : RemoraColors.lightSurfaceMuted)
        : (isDark ? RemoraColors.darkSurface : RemoraColors.lightSurface);
    final borderColor = isDark ? RemoraColors.darkBorder : RemoraColors.lightBorder;
    final labelColor = isAnswer
        ? (isDark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary)
        : (isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle);
    final subtleColor =
        isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: faceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isAnswer ? 'ОТВЕТ' : 'ВОПРОС',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
          ),
          if (!isAnswer && item.card.hint != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? RemoraColors.darkAccentSubtle
                      : RemoraColors.lightAccentSubtle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '💡 ${item.card.hint!}',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark
                        ? RemoraColors.darkAccent
                        : RemoraColors.lightAccent,
                  ),
                ),
              ),
            ),
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
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flip, size: 14, color: subtleColor),
                  const SizedBox(width: 6),
                  Text(
                    'Нажмите, чтобы перевернуть',
                    style: TextStyle(fontSize: 13, color: subtleColor),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRatingButtons(
      BuildContext context, QueueItem item, StudySessionState state) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final labels = ['Не помню', 'Трудно', 'Хорошо', 'Легко'];
    final colors = [
      isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger,
      isDark ? RemoraColors.darkWarning : RemoraColors.lightWarning,
      isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess,
      isDark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary,
    ];

    return Row(
      children: List.generate(4, (i) {
        final rating = i + 1;
        final preview = item.previews
            .where((p) => p.rating == rating)
            .firstOrNull;
        final intervalLabel = preview != null
            ? formatIntervalSeconds(preview.intervalSeconds)
            : '';

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: i > 0 ? 8 : 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (intervalLabel.isNotEmpty)
                  Text(
                    intervalLabel,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? RemoraColors.darkFgSubtle
                          : RemoraColors.lightFgSubtle,
                    ),
                  ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => _rate(rating),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[i],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      labels[i],
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

}
