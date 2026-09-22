import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../core/answers.dart';
import '../../core/format.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import 'study_provider.dart';
import 'study_shell.dart';

/// Режим «Учить»: адаптивные вопросы (choice → typing → recall).
///
/// Для M4 реализованы recall (самооценка) и typing (ввод ответа).
/// Choice (multiple-choice) добавляется при наличии дистракторов.
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  final _controller = TextEditingController();
  bool _showAnswer = false;
  String? _verdict; // correct | typo | incorrect
  int? _similarity;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _reset() {
    _controller.clear();
    _showAnswer = false;
    _verdict = null;
    _similarity = null;
  }

  Future<void> _submitRating(int rating, {bool? answerCorrect}) async {
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    await ref.read(studySessionProvider.notifier).answer(
          item: item,
          rating: rating,
          answerCorrect: answerCorrect,
        );
    _reset();
  }

  void _checkTypedAnswer(QueueItem item, StudySessionState state) {
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final typed = _controller.text;

    if (typed.trim().isEmpty) return;

    final result = checkAnswer(
      typed,
      expected,
      AnswerOptions(strictness: state.answerStrictness),
    );

    setState(() {
      _verdict = result.verdict;
      _showAnswer = true;
      _similarity = answerSimilarity(
        typed,
        expected,
        AnswerOptions(strictness: state.answerStrictness),
      );
    });
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

    // Определяем тип вопроса по стабильности карточки
    final stability = item.state.stability;
    final questionType = _questionType(stability, state);

    return StudyShell(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: _buildQuestion(context, item, state, questionType),
            ),
          ],
        ),
      ),
    );
  }

  String _questionType(double? stability, StudySessionState state) {
    if (stability == null || stability < 1) return 'typing';
    if (stability < 21) return 'typing';
    return 'recall';
  }

  Widget _buildQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
    String questionType,
  ) {
    switch (questionType) {
      case 'typing':
        return _buildTypingQuestion(context, item, state);
      case 'recall':
      default:
        return _buildRecallQuestion(context, item, state);
    }
  }

  Widget _buildRecallQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';
    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final answerText = isTermToDef ? item.card.definition : item.card.term;
    final questionImage =
        isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl;
    final answerImage =
        isTermToDef ? item.card.definitionImageUrl : item.card.termImageUrl;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (item.card.hint != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
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
                if (_showAnswer) ...[
                  const Divider(height: 32),
                  CardContentWidget(
                    value: answerText,
                    contentType: item.card.contentType,
                    codeLanguage: item.card.codeLanguage,
                    imageUrl: answerImage,
                  ),
                ] else
                  OutlinedButton(
                    onPressed: () => setState(() => _showAnswer = true),
                    child: const Text('Показать ответ'),
                  ),
              ],
            ),
          ),
        ),
        if (_showAnswer) ...[
          const SizedBox(height: 16),
          _buildRatingButtons(context, item, state),
        ],
      ],
    );
  }

  Widget _buildTypingQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';
    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final answerText = isTermToDef ? item.card.definition : item.card.term;
    final questionImage =
        isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (item.card.hint != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
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
                  ),
                  onSubmitted: (_) => _checkTypedAnswer(item, state),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12),
                if (_showAnswer && _verdict != null) ...[
                  _buildVerdict(context, answerText),
                ],
                if (_verdict == null)
                  FilledButton(
                    onPressed: () => _checkTypedAnswer(item, state),
                    child: const Text('Проверить'),
                  ),
              ],
            ),
          ),
        ),
        if (_verdict != null) ...[
          const SizedBox(height: 16),
          _buildPostVerdictButtons(context, item, state),
        ],
      ],
    );
  }

  Widget _buildVerdict(BuildContext context, String expected) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final verdictColor = _verdict == 'correct'
        ? (isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess)
        : _verdict == 'typo'
            ? (isDark ? RemoraColors.darkWarning : RemoraColors.lightWarning)
            : (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger);

    final verdictText = _verdict == 'correct'
        ? '✓ Правильно'
        : _verdict == 'typo'
            ? '≈ Почти правильно'
            : '✗ Неправильно';

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: verdictColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                verdictText,
                style: TextStyle(
                  color: verdictColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (_similarity != null && _similarity! < 100)
                Text(
                  'Совпадение: ${_similarity!.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: verdictColor.withValues(alpha: 0.8),
                  ),
                ),
              if (_verdict != 'correct') ...[
                const SizedBox(height: 8),
                Text(
                  'Ответ: $expected',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPostVerdictButtons(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    if (_verdict == 'correct') {
      return Row(
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
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('Легко'),
            ),
          ),
        ],
      );
    }

    // Typo — повторить, не записывая в расписание
    if (_verdict == 'typo') {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _controller.clear();
                  _verdict = null;
                  _showAnswer = false;
                });
              },
              child: const Text('Попробовать ещё раз'),
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
      );
    }

    // Incorrect — requeue
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () async {
              final s = ref.read(studySessionProvider);
              final itm = s.currentItem;
              if (itm == null) return;
              await ref.read(studySessionProvider.notifier).answer(
                    item: itm,
                    rating: 1,
                    answerCorrect: false,
                    requeue: true,
                  );
              _reset();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
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
                    onPressed: () => _submitRating(rating),
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
              Icons.school_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Обучение завершено!',
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
