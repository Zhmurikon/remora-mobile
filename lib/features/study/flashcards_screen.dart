import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    if (state.isFinished) {
      return StudyShell(child: _buildSummary(context, state));
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

  Widget _buildCard(BuildContext context, QueueItem item, StudySessionState state) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';

    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final answerText = isTermToDef ? item.card.definition : item.card.term;
    final questionImage =
        isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl;
    final answerImage =
        isTermToDef ? item.card.definitionImageUrl : item.card.termImageUrl;

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
                  final isAnswer = _flipAnimation.value > 0.5;
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!isAnswer && item.card.hint != null) ...[
                            Container(
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
                            const SizedBox(height: 12),
                          ],
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                child: CardContentWidget(
                                  value: isAnswer ? answerText : questionText,
                                  contentType: item.card.contentType,
                                  codeLanguage: item.card.codeLanguage,
                                  imageUrl:
                                      isAnswer ? answerImage : questionImage,
                                ),
                              ),
                            ),
                          ),
                          if (!_isFlipped)
                            Text(
                              'Нажмите, чтобы перевернуть',
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? RemoraColors.darkFgSubtle
                                    : RemoraColors.lightFgSubtle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            if (_isFlipped) _buildRatingButtons(context, item, state),
          ],
        ),
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

  Widget _buildSummary(BuildContext context, StudySessionState state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Сессия завершена!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'Отвечено: ${state.answered}\n'
              'Правильных: ${state.correct}\n'
              'Ошибок: ${state.answered - state.correct}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (state.pending > 0) ...[
              const SizedBox(height: 12),
              Text(
                'Неотправленных ответов: ${state.pending}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('К наборам'),
            ),
          ],
        ),
      ),
    );
  }
}
