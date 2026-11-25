import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'space_rewards.dart';
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
  final _field = GlobalKey<SpaceFieldState>();
  QueueItem? _held;
  final _controller = TextEditingController();
  bool _submitting = false;
  int _turn = 0;
  String? _verdict;
  String? _expectedAnswer;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reset() {
    _turn++;
    _controller.clear();
    _verdict = null;
    _expectedAnswer = null;
  }

  void _checkAnswer(QueueItem item, StudySessionState state) {
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final typed = _controller.text;

    if (typed.trim().isEmpty || _submitting || _held != null) return;

    FocusManager.instance.primaryFocus?.unfocus();

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
    if (_verdict != 'typo') _record(item, _verdict == 'correct');
  }

  int _verdictPriority(String verdict) {
    return verdict == 'correct'
        ? 0
        : verdict == 'typo'
        ? 1
        : 2;
  }

  Future<void> _record(QueueItem item, bool correct) async {
    if (_submitting) return;
    setState(() {
      _submitting = true;
      _held = item;
    });
    try {
      await ref
          .read(studySessionProvider.notifier)
          .answer(
            item: item,
            rating: correct ? 3 : 1,
            answerCorrect: correct,
            given: _controller.text,
            requeue: !correct,
          );
    } catch (_) {
      if (mounted) {
        setState(() {
          _held = null;
          _submitting = false;
          _verdict = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Не удалось сохранить ответ. Попробуйте ещё раз.'),
          ),
        );
      }
      return;
    }
    if (!mounted) return;
    if (correct) {
      await _field.currentState?.reward(ref.read(studySessionProvider).streak);
    }
    if (!mounted) return;
    setState(() => _submitting = false);
    if (correct) _next();
  }

  void _next() {
    if (_submitting) return;
    if (ref.read(studySessionProvider).isFinished) {
      openStudyResult(context);
      return;
    }
    _field.currentState?.fade();
    setState(() {
      _held = null;
      _reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studySessionProvider);
    final item = _held ?? state.currentItem;
    if (item == null) {
      return const StudyShell(child: Center(child: Text('Очередь пуста')));
    }

    return StudyShell(
      busy: _submitting,
      child: SpaceField(
        key: _field,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildQuestion(context, item, state),
        ),
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CardContentWidget(
                      value: questionText,
                      contentType: item.card.contentType,
                      codeLanguage: item.card.codeLanguage,
                      imageUrl: questionImage,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  key: ValueKey(_turn),
                  controller: _controller,
                  readOnly: _verdict != null,
                  decoration: InputDecoration(
                    hintText: 'Введите ответ…',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: _verdict == 'correct'
                        ? Color.alphaBlend(
                            (isDark
                                    ? RemoraColors.darkSuccess
                                    : RemoraColors.lightSuccess)
                                .withValues(alpha: .30),
                            theme.colorScheme.surface,
                          )
                        : _verdict == 'incorrect'
                        ? theme.colorScheme.errorContainer
                        : theme.colorScheme.surface,
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
                  FilledButton(
                    onPressed: () => _checkAnswer(item, state),
                    child: const Text('Проверить'),
                  ),
                if (_verdict == 'typo') ...[
                  const Text('Проверьте написание'),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: _submitting
                            ? null
                            : () => setState(() => _verdict = null),
                        child: const Text('Исправить'),
                      ),
                      FilledButton(
                        onPressed: _submitting
                            ? null
                            : () {
                                setState(() => _verdict = 'correct');
                                _record(item, true);
                              },
                        child: const Text('Засчитать'),
                      ),
                    ],
                  ),
                ],
                if (_verdict == 'incorrect') ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text('Правильный ответ'),
                          CardContentWidget(
                            value: _expectedAnswer ?? '',
                            contentType: item.card.contentType,
                            codeLanguage: item.card.codeLanguage,
                            imageUrl: isTermToDef
                                ? item.card.definitionImageUrl
                                : item.card.termImageUrl,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: _submitting ? null : _next,
                    child: const Text('Дальше'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
