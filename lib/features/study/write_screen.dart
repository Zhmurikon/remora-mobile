import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/answers.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import 'study_provider.dart';
import 'study_shell.dart';

/// Режим «Писать»: ввод ответа с трёхсторонней проверкой (correct/typo/incorrect).
class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final _controller = TextEditingController();
  String? _verdict;
  String? _expectedAnswer;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reset() {
    _controller.clear();
    _verdict = null;
    _expectedAnswer = null;
  }

  void _checkAnswer(QueueItem item, StudySessionState state) {
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final typed = _controller.text;

    if (typed.trim().isEmpty) return;

    // Проверяем также альтернативные ответы
    final allExpected = [expected, ...item.card.altAnswers];
    AnswerResult? bestResult;

    for (final exp in allExpected) {
      final result = checkAnswer(
        typed,
        exp,
        AnswerOptions(strictness: state.answerStrictness),
      );
      if (result.verdict == 'correct') {
        bestResult = result;
        _expectedAnswer = exp;
        break;
      }
      if (bestResult == null ||
          _verdictPriority(result.verdict) <
              _verdictPriority(bestResult.verdict)) {
        bestResult = result;
        _expectedAnswer = exp;
      }
    }

    setState(() {
      _verdict = bestResult!.verdict;
    });
  }

  int _verdictPriority(String verdict) {
    return verdict == 'correct'
        ? 0
        : verdict == 'typo'
        ? 1
        : 2;
  }

  Future<void> _submitRating(
    int rating, {
    bool? answerCorrect,
    bool requeue = false,
  }) async {
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    await ref
        .read(studySessionProvider.notifier)
        .answer(
          item: item,
          rating: rating,
          answerCorrect: answerCorrect,
          requeue: requeue,
        );
    _reset();
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildQuestion(context, item, state),
      ),
    );
  }

  Widget _buildQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';
    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final questionImage = isTermToDef
        ? item.card.termImageUrl
        : item.card.definitionImageUrl;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (item.card.hint != null) ...[
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
                CardContentWidget(
                  value: questionText,
                  contentType: item.card.contentType,
                  codeLanguage: item.card.codeLanguage,
                  imageUrl: questionImage,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _controller,
                  enabled: _verdict == null,
                  decoration: InputDecoration(
                    hintText: 'Введите ответ…',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  onSubmitted: (_) => _checkAnswer(item, state),
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                if (_verdict == null)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _checkAnswer(item, state),
                      child: const Text('Проверить'),
                    ),
                  ),
                if (_verdict != null) ...[
                  const SizedBox(height: 8),
                  _buildVerdictBlock(context, item),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerdictBlock(BuildContext context, QueueItem item) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_verdict == 'correct') {
      return Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  (isDark
                          ? RemoraColors.darkSuccess
                          : RemoraColors.lightSuccess)
                      .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '✓ Правильно!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark
                    ? RemoraColors.darkSuccess
                    : RemoraColors.lightSuccess,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _submitRating(2, answerCorrect: true),
                  child: const Text('Трудно'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => _submitRating(3, answerCorrect: true),
                  child: const Text('Хорошо'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => _submitRating(4, answerCorrect: true),
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                  ),
                  child: const Text('Легко'),
                ),
              ),
            ],
          ),
        ],
      );
    }

    if (_verdict == 'typo') {
      return Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  (isDark
                          ? RemoraColors.darkWarning
                          : RemoraColors.lightWarning)
                      .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  '≈ Почти правильно — проверьте написание',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDark
                        ? RemoraColors.darkWarning
                        : RemoraColors.lightWarning,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Ответ: $_expectedAnswer',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                      _verdict = null;
                    });
                  },
                  child: const Text('Попробовать ещё'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => _submitRating(3, answerCorrect: true),
                  child: const Text('Засчитать'),
                ),
              ),
            ],
          ),
        ],
      );
    }

    // incorrect
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                '✗ Неправильно',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark
                      ? RemoraColors.darkDanger
                      : RemoraColors.lightDanger,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ответ: $_expectedAnswer',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () =>
                    _submitRating(1, answerCorrect: false, requeue: true),
                style: FilledButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                ),
                child: const Text('Не помню'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () => _submitRating(2, answerCorrect: false),
                child: const Text('Пропустить'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
