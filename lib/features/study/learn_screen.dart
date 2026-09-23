import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/answers.dart';
import '../../core/distractors.dart';
import '../../core/format.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import 'study_provider.dart';
import 'study_shell.dart';

/// Порог стабильности (в днях), после которого спрашиваем строже.
const _typingThreshold = 1;
const _recallThreshold = 21;

/// Режим «Учить»: адаптивные вопросы — выбор из 4 → ввод ответа → свободное
/// воспроизведение с самооценкой. Тип вопроса на каждую карточку и набор
/// включённых упражнений подбираются по настройкам заучивания набора
/// (`state.learnQuestionTypes` и далее), как на вебе и в ботах.
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  final _controller = TextEditingController();
  bool _showAnswer = false;
  // null | 'correct' | 'incorrect' | 'self_check'
  String? _verdict;
  int? _similarity;
  String? _pickedOption;

  // Успешных ответов на карточку в этой сессии: ключ "cardId:direction".
  // Ошибка не обнуляет уже набранные успехи — карточка просто возвращается
  // в очередь, пока не наберёт нужное число (`learnSuccessesRequired`).
  final Map<String, int> _successCounts = {};

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
    _pickedOption = null;
  }

  /// Записать ответ и продвинуться дальше. Считает успехи и решает,
  /// возвращать ли карточку в конец очереди.
  Future<void> _advance(int rating, bool correct) async {
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    final key = '${item.card.id}:${item.direction}';
    final priorSuccesses = _successCounts[key] ?? 0;
    final requeue =
        !correct || (priorSuccesses + 1) < state.learnSuccessesRequired;
    if (correct) _successCounts[key] = priorSuccesses + 1;

    await ref.read(studySessionProvider.notifier).answer(
          item: item,
          rating: rating,
          answerCorrect: correct,
          requeue: requeue,
        );
    _reset();
  }

  void _checkTypedAnswer(QueueItem item, StudySessionState state) {
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final typed = _controller.text;
    if (typed.trim().isEmpty) return;

    final options = AnswerOptions(strictness: state.answerStrictness);
    var best = 0;
    for (final candidate in [expected, ...item.card.altAnswers]) {
      final s = answerSimilarity(typed, candidate, options);
      if (s > best) best = s;
    }

    if (state.learnTypingCheck == 'self_check') {
      setState(() {
        _verdict = 'self_check';
        _similarity = best;
      });
      return;
    }

    final correct = best >= state.learnMatchPercent;
    setState(() {
      _verdict = correct ? 'correct' : 'incorrect';
      _similarity = best;
    });
    if (correct) {
      Future.delayed(const Duration(milliseconds: 450), () {
        if (mounted) _advance(3, true);
      });
    }
  }

  void _pickOption(String option, String expected) {
    if (_pickedOption != null) return;
    final correct = normalizeOption(option) == normalizeOption(expected);
    setState(() => _pickedOption = option);
    Future.delayed(Duration(milliseconds: correct ? 450 : 1400), () {
      if (mounted) _advance(correct ? 3 : 1, correct);
    });
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

    final pool = _answerPool(state, item.direction);
    final hasChoice = _hasChoice(item, state, pool);
    final kind = _questionKind(item, state, hasChoice);
    final successKey = '${item.card.id}:${item.direction}';
    final currentSuccesses = _successCounts[successKey] ?? 0;

    return StudyShell(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(context, kind, currentSuccesses, state),
            Expanded(
              child: _buildQuestion(context, item, state, kind, pool),
            ),
          ],
        ),
      ),
    );
  }

  // ── Подбор типа вопроса ──

  /// Ответная сторона всех карточек очереди, приведённая к направлению
  /// текущей карточки — источник дистракторов для «выбора из 4».
  List<String> _answerPool(StudySessionState state, String direction) {
    final isTermToDef = direction == 'term_to_def';
    return state.items
        .map((it) => isTermToDef ? it.card.definition : it.card.term)
        .where((v) => v.isNotEmpty)
        .toList();
  }

  bool _hasChoice(QueueItem item, StudySessionState state, List<String> pool) {
    if (!state.learnQuestionTypes.contains('choice')) return false;
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final preferred = isTermToDef
        ? item.card.wrongDefinitionAnswers
        : item.card.wrongTermAnswers;
    final options = generateOptions(DistractorOptions(
      correct: expected,
      pool: pool,
      preferred: preferred,
      alternatives: item.card.altAnswers,
      seed: item.card.id,
    ));
    return options.length == 4;
  }

  List<String> _choiceOptions(
      QueueItem item, StudySessionState state, List<String> pool) {
    final isTermToDef = item.direction == 'term_to_def';
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final preferred = isTermToDef
        ? item.card.wrongDefinitionAnswers
        : item.card.wrongTermAnswers;
    return generateOptions(DistractorOptions(
      correct: expected,
      pool: pool.where((v) => v != expected).toList(),
      preferred: preferred,
      alternatives: item.card.altAnswers,
      seed: '${item.card.id}:${item.direction}:${state.index}',
    ));
  }

  /// Чем крепче карточка, тем строже спрашиваем; тип берём из включённых
  /// в настройках, с запасным вариантом, если предпочитаемый недоступен.
  String _questionKind(
      QueueItem item, StudySessionState state, bool hasChoice) {
    final available = state.learnQuestionTypes
        .where((k) => k != 'choice' || hasChoice)
        .toList();
    final fallback = available.isNotEmpty ? available.first : 'recall';
    final stability = item.state.stability ?? 0;

    if (stability >= _recallThreshold) {
      return available.contains('recall') ? 'recall' : fallback;
    }
    if (stability >= _typingThreshold) {
      if (available.contains('typing')) return 'typing';
      if (available.contains('recall')) return 'recall';
      return fallback;
    }
    if (hasChoice) return 'choice';
    if (available.contains('typing')) return 'typing';
    return fallback;
  }

  String _kindLabel(String kind) {
    switch (kind) {
      case 'choice':
        return 'Выберите верный ответ';
      case 'typing':
        return 'Введите ответ';
      default:
        return 'Вспомните ответ и оцените себя';
    }
  }

  Widget _buildHeader(
    BuildContext context,
    String kind,
    int successes,
    StudySessionState state,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final subtle =
        isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle;
    final required = state.learnSuccessesRequired;
    final label = required > 1
        ? '${_kindLabel(kind)} · успешно $successes из $required'
        : _kindLabel(kind);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(label, style: TextStyle(fontSize: 13, color: subtle)),
    );
  }

  Widget _hintChip(BuildContext context, String hint, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isDark
              ? RemoraColors.darkAccentSubtle
              : RemoraColors.lightAccentSubtle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '💡 $hint',
          style: TextStyle(
            fontSize: 13,
            color: isDark ? RemoraColors.darkAccent : RemoraColors.lightAccent,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
    String kind,
    List<String> pool,
  ) {
    switch (kind) {
      case 'choice':
        return _buildChoiceQuestion(context, item, state, pool);
      case 'typing':
        return _buildTypingQuestion(context, item, state);
      case 'recall':
      default:
        return _buildRecallQuestion(context, item, state);
    }
  }

  // ── Выбор из 4 ──

  Widget _buildChoiceQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
    List<String> pool,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';
    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final questionImage =
        isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl;
    final options = _choiceOptions(item, state, pool);
    final border = isDark ? RemoraColors.darkBorder : RemoraColors.lightBorder;
    final success =
        isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess;
    final danger = isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger;
    final subtle =
        isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle;

    return SingleChildScrollView(
      child: Column(
        children: [
          if (item.card.hint != null) _hintChip(context, item.card.hint!, isDark),
          CardContentWidget(
            value: questionText,
            contentType: item.card.contentType,
            codeLanguage: item.card.codeLanguage,
            imageUrl: questionImage,
          ),
          const SizedBox(height: 24),
          for (var i = 0; i < options.length; i++) ...[
            _buildChoiceOption(
              context,
              index: i,
              option: options[i],
              expected: expected,
              border: border,
              success: success,
              danger: danger,
              subtle: subtle,
            ),
            if (i < options.length - 1) const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }

  Widget _buildChoiceOption(
    BuildContext context, {
    required int index,
    required String option,
    required String expected,
    required Color border,
    required Color success,
    required Color danger,
    required Color subtle,
  }) {
    final picked = _pickedOption;
    final isCorrectOption = normalizeOption(option) == normalizeOption(expected);

    var borderColor = border;
    Color? fillColor;
    var opacity = 1.0;
    if (picked != null) {
      if (isCorrectOption) {
        borderColor = success;
        fillColor = success.withValues(alpha: 0.1);
      } else if (option == picked) {
        borderColor = danger;
        fillColor = danger.withValues(alpha: 0.1);
      } else {
        opacity = 0.6;
      }
    }

    return Opacity(
      opacity: opacity,
      child: Material(
        color: fillColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: picked == null ? () => _pickOption(option, expected) : null,
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text('${index + 1}', style: TextStyle(color: subtle, fontSize: 13)),
                const SizedBox(width: 12),
                Expanded(child: Text(option)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Карточка с самооценкой ──

  Widget _buildRecallQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                if (item.card.hint != null)
                  _hintChip(context, item.card.hint!, isDark),
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
          _buildRatingButtons(context, item),
        ],
      ],
    );
  }

  Widget _buildRatingButtons(BuildContext context, QueueItem item) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
        final preview =
            item.previews.where((p) => p.rating == rating).firstOrNull;
        final intervalLabel =
            preview != null ? formatIntervalSeconds(preview.intervalSeconds) : '';

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
                    onPressed: () => _advance(rating, rating >= 3),
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

  // ── Ввод ответа ──

  Widget _buildTypingQuestion(
    BuildContext context,
    QueueItem item,
    StudySessionState state,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isTermToDef = item.direction == 'term_to_def';
    final questionText = isTermToDef ? item.card.term : item.card.definition;
    final expected = isTermToDef ? item.card.definition : item.card.term;
    final questionImage =
        isTermToDef ? item.card.termImageUrl : item.card.definitionImageUrl;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (item.card.hint != null)
                  _hintChip(context, item.card.hint!, isDark),
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
                  onSubmitted: (_) {
                    if (_verdict == null) _checkTypedAnswer(item, state);
                  },
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12),
                if (_verdict != null) _buildTypingResult(context, expected, state),
                if (_verdict == null) ...[
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () => _checkTypedAnswer(item, state),
                          child: const Text('Проверить'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () => _advance(1, false),
                        child: const Text('Не знаю'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        if (_verdict == 'self_check' || _verdict == 'incorrect') ...[
          const SizedBox(height: 16),
          _buildTypingPostButtons(context),
        ],
      ],
    );
  }

  Widget _buildTypingResult(
    BuildContext context,
    String expected,
    StudySessionState state,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subtle =
        isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle;

    if (_verdict == 'self_check') {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? RemoraColors.darkSurfaceMuted
              : RemoraColors.lightSurfaceMuted,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Правильный ответ', style: TextStyle(fontSize: 12, color: subtle)),
            const SizedBox(height: 4),
            Text(expected, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );
    }

    final correct = _verdict == 'correct';
    final color = correct
        ? (isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess)
        : (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            correct ? '✓ Правильно' : '✗ Неправильно',
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
          if (_similarity != null)
            Text(
              'Совпадение: $_similarity% · нужно ${state.learnMatchPercent}%',
              style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.8)),
            ),
          if (!correct) ...[
            const SizedBox(height: 8),
            Text('Ответ: $expected', style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingPostButtons(BuildContext context) {
    if (_verdict == 'self_check') {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => _advance(1, false),
              child: const Text('Не засчитывать'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              onPressed: () => _advance(3, true),
              child: const Text('Засчитать'),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: () => _advance(1, false),
        child: const Text('Дальше'),
      ),
    );
  }
}
