import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import 'test_setup_screen.dart';

/// Провайдер ответов пользователя во время теста.
final testAnswersProvider = StateProvider<Map<String, TestAnswerIn>>(
  (ref) => {},
);

/// Экран прохождения теста.
class TestTakingScreen extends ConsumerStatefulWidget {
  const TestTakingScreen({
    super.key,
    required this.setId,
    required this.attemptId,
  });

  final String setId;
  final String attemptId;

  @override
  ConsumerState<TestTakingScreen> createState() => _TestTakingScreenState();
}

class _TestTakingScreenState extends ConsumerState<TestTakingScreen> {
  TestAttemptOut? _attempt;
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _error;
  int _currentIndex = 0;
  final _typingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Провайдер ответов глобальный: очищаем его для новой попытки, иначе
    // ответы прошлого теста/пересдачи попали бы в отправку и в счётчик.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(testAnswersProvider.notifier).state = {};
      }
    });
    _loadAttempt();
  }

  @override
  void dispose() {
    _typingController.dispose();
    super.dispose();
  }

  Future<void> _loadAttempt() async {
    try {
      final api = ref.read(apiClientProvider);
      // Пробуем получить из провайдера (только что создан)
      final cached = ref.read(testSessionProvider).attempt;
      if (cached != null && cached.id == widget.attemptId) {
        setState(() {
          _attempt = cached;
          _isLoading = false;
        });
        return;
      }
      // Иначе загружаем с сервера
      final attempt = await api.getTest(widget.attemptId);
      setState(() {
        _attempt = attempt;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Не удалось загрузить тест';
      });
    }
  }

  void _saveAnswer(TestAnswerIn answer) {
    final answers = {...ref.read(testAnswersProvider)};
    answers[answer.questionId] = answer;
    ref.read(testAnswersProvider.notifier).state = answers;
  }

  void _goToNext() {
    if (_attempt == null) return;
    if (_currentIndex < _attempt!.questions.length - 1) {
      _typingController.clear();
      setState(() => _currentIndex++);
    }
  }

  void _goToPrev() {
    if (_currentIndex > 0) {
      _typingController.clear();
      setState(() => _currentIndex--);
    }
  }

  Future<void> _submit() async {
    if (_attempt == null || _isSubmitting) return;

    setState(() => _isSubmitting = true);
    try {
      final api = ref.read(apiClientProvider);
      final answers = ref.read(testAnswersProvider).values.toList();

      // Добавляем пустые ответы для пропущенных вопросов
      for (final q in _attempt!.questions) {
        if (!answers.any((a) => a.questionId == q.id)) {
          answers.add(TestAnswerIn(questionId: q.id, value: ''));
        }
      }

      final result = await api.submitTest(
        attemptId: _attempt!.id,
        answers: answers,
      );

      if (mounted) {
        context.go(
          '/set/${widget.setId}/test/${widget.attemptId}/result',
          extra: result,
        );
      }
    } catch (e) {
      setState(() {
        _isSubmitting = false;
        _error = 'Не удалось отправить тест. Проверьте подключение.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_attempt == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Тест')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _error ?? 'Тест не найден',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('К наборам'),
              ),
            ],
          ),
        ),
      );
    }

    final questions = _attempt!.questions;
    final answers = ref.watch(testAnswersProvider);
    final question = questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _attempt!.setTitle,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${_currentIndex + 1} / ${questions.length}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            final shouldExit = await _confirmExit(context);
            if (shouldExit && context.mounted) {
              context.go('/set/${widget.setId}/study');
            }
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / questions.length,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildQuestion(context, question, answers),
              ),
            ),
            _buildNavigation(context, question, answers),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Номер и тип
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Вопрос ${_currentIndex + 1} · ${_kindLabel(question.kind)}',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Вопрос
        CardContentWidget(
          value: question.prompt,
          contentType: question.contentType,
          codeLanguage: question.codeLanguage,
          imageUrl: question.promptImageUrl,
        ),
        const SizedBox(height: 24),
        // Ответ
        _buildAnswerInput(context, question, answers),
      ],
    );
  }

  Widget _buildAnswerInput(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    switch (question.kind) {
      case 'choice':
        return _buildChoiceInput(context, question, answers);
      case 'true_false':
        return _buildTrueFalseInput(context, question, answers);
      case 'typing':
        return _buildTypingInput(context, question, answers);
      case 'matching':
        return _buildMatchingInput(context, question, answers);
      default:
        return const Text('Неизвестный тип вопроса');
    }
  }

  Widget _buildChoiceInput(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    final current = answers[question.id]?.value;

    return Column(
      children: question.options.map((option) {
        final isSelected = current == option;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                _saveAnswer(
                  TestAnswerIn(questionId: question.id, value: option),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTrueFalseInput(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final current = answers[question.id]?.value;

    return Column(
      children: [
        if (question.statement != null) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                question.statement!,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _saveAnswer(
                      TestAnswerIn(questionId: question.id, value: 'true'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: current == 'true'
                        ? (isDark
                              ? RemoraColors.darkSuccess
                              : RemoraColors.lightSuccess)
                        : null,
                    foregroundColor: current == 'true' ? Colors.white : null,
                  ),
                  child: const Text('Верно', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _saveAnswer(
                      TestAnswerIn(questionId: question.id, value: 'false'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: current == 'false'
                        ? (isDark
                              ? RemoraColors.darkDanger
                              : RemoraColors.lightDanger)
                        : null,
                    foregroundColor: current == 'false' ? Colors.white : null,
                  ),
                  child: const Text('Неверно', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypingInput(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    final current = answers[question.id]?.value;

    // Восстановить текст при навигации
    if (current != null && _typingController.text != current) {
      _typingController.text = current;
    }

    return TextField(
      controller: _typingController,
      decoration: InputDecoration(
        hintText: 'Введите ответ…',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      style: const TextStyle(fontSize: 18),
      onChanged: (text) {
        _saveAnswer(TestAnswerIn(questionId: question.id, value: text));
      },
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildMatchingInput(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final currentValues = answers[question.id]?.values ?? [];
    final rights = List<String>.from(
      question.options.isNotEmpty ? question.options : question.pairs,
    );

    return Column(
      children: List.generate(question.pairs.length, (i) {
        final left = question.pairs[i];
        final selectedRight = i < currentValues.length
            ? currentValues[i]
            : null;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? RemoraColors.darkSurfaceMuted
                        : RemoraColors.lightSurfaceMuted,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    left,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: DropdownButtonFormField<String>(
                  // Ключ с текущим выбором пересоздаёт поле при внешнем
                  // изменении ответа: initialValue применяется только при
                  // построении, поэтому без ключа сброс не отразился бы.
                  key: ValueKey('${question.id}_${i}_$selectedRight'),
                  initialValue: selectedRight,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  items: ['', ...rights]
                      .map(
                        (r) => DropdownMenuItem(
                          value: r,
                          child: Text(r.isEmpty ? '—' : r),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    final values = List<String>.from(
                      currentValues.length > question.pairs.length
                          ? currentValues.sublist(0, question.pairs.length)
                          : currentValues,
                    );
                    while (values.length <= i) {
                      values.add('');
                    }
                    values[i] = val ?? '';
                    _saveAnswer(
                      TestAnswerIn(questionId: question.id, values: values),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNavigation(
    BuildContext context,
    TestQuestionOut question,
    Map<String, TestAnswerIn> answers,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isLast = _currentIndex >= _attempt!.questions.length - 1;
    final isFirst = _currentIndex == 0;
    final answeredCount = answers.length;
    final totalCount = _attempt!.questions.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? RemoraColors.darkBorder : RemoraColors.lightBorder,
          ),
        ),
      ),
      child: Row(
        children: [
          // Назад
          OutlinedButton(
            onPressed: isFirst ? null : _goToPrev,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 12),
          // Счётчик
          Expanded(
            child: Text(
              'Отвечено: $answeredCount / $totalCount',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(width: 12),
          // Вперёд / Отправить
          if (isLast)
            FilledButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Отправить'),
            )
          else
            FilledButton(
              onPressed: _goToNext,
              child: const Icon(Icons.arrow_forward),
            ),
        ],
      ),
    );
  }

  String _kindLabel(String kind) {
    switch (kind) {
      case 'choice':
        return 'Выбор';
      case 'true_false':
        return 'Верно/Неверно';
      case 'typing':
        return 'Ввод';
      case 'matching':
        return 'Сопоставление';
      default:
        return kind;
    }
  }

  Future<bool> _confirmExit(BuildContext context) async {
    final answers = ref.read(testAnswersProvider);
    final answeredCount = answers.length;
    final totalCount = _attempt?.questions.length ?? 0;

    if (answeredCount == 0) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Выйти из теста?'),
        content: Text(
          'Отвечено $answeredCount из $totalCount.\n'
          'Неотвеченные вопросы будут засчитаны как неправильные.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Продолжить'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
