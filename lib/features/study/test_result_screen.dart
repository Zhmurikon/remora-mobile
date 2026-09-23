import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';

/// Экран результатов теста с разбором каждого вопроса.
class TestResultScreen extends ConsumerStatefulWidget {
  const TestResultScreen({
    super.key,
    required this.setId,
    required this.attemptId,
    this.result,
  });

  final String setId;
  final String attemptId;
  final TestResult? result;

  @override
  ConsumerState<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends ConsumerState<TestResultScreen> {
  TestResult? _result;
  bool _isLoading = true;
  bool _isRetaking = false;

  @override
  void initState() {
    super.initState();
    _result = widget.result;
    if (_result != null) {
      _isLoading = false;
    } else {
      _loadResult();
    }
  }

  Future<void> _loadResult() async {
    try {
      final api = ref.read(apiClientProvider);
      final result = await api.getTestResult(widget.attemptId);
      setState(() {
        _result = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _retake() async {
    setState(() => _isRetaking = true);
    try {
      final api = ref.read(apiClientProvider);
      final attempt = await api.retakeTest(widget.attemptId);
      if (mounted) {
        context.go('/set/${widget.setId}/test/${attempt.id}');
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isRetaking = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Не удалось создать пересдачу')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final result = _result;
    if (result == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Результаты')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Не удалось загрузить результаты'),
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

    final scorePercent = (result.score * 100).round();
    final scoreColor = scorePercent >= 80
        ? (isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess)
        : scorePercent >= 50
        ? (isDark ? RemoraColors.darkWarning : RemoraColors.lightWarning)
        : (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты теста'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/set/${widget.setId}/study'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Сводка
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Оценка кружком
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: scoreColor.withValues(alpha: 0.12),
                    ),
                    child: Center(
                      child: Text(
                        '$scorePercent%',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: scoreColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${result.correctCount} из ${result.total}',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text('правильных ответов', style: theme.textTheme.bodySmall),
                  const SizedBox(height: 16),
                  // Детали
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statChip(
                        context,
                        'Правильно',
                        '${result.correctCount}',
                        isDark
                            ? RemoraColors.darkSuccess
                            : RemoraColors.lightSuccess,
                      ),
                      _statChip(
                        context,
                        'Ошибки',
                        '${result.total - result.correctCount}',
                        isDark
                            ? RemoraColors.darkDanger
                            : RemoraColors.lightDanger,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Разбор вопросов
          Text('Разбор вопросов', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          ...result.review.asMap().entries.map(
            (entry) =>
                _buildReviewCard(context, entry.key + 1, entry.value, isDark),
          ),

          // Кнопки
          const SizedBox(height: 24),
          if (result.wrongCardIds.isNotEmpty) ...[
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _isRetaking ? null : _retake,
                child: _isRetaking
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text('Пересдать ошибки (${result.wrongCardIds.length})'),
              ),
            ),
            const SizedBox(height: 12),
          ],
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.go('/set/${widget.setId}/study'),
              child: const Text('К режимам обучения'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _statChip(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildReviewCard(
    BuildContext context,
    int number,
    TestQuestionReview review,
    bool isDark,
  ) {
    final color = review.correct
        ? (isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess)
        : (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Row(
                children: [
                  Icon(
                    review.correct ? Icons.check_circle : Icons.cancel,
                    color: color,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$number. ${_kindLabel(review.question.kind)}',
                    style: TextStyle(fontWeight: FontWeight.w600, color: color),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Вопрос
              Text(
                review.question.prompt,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              // Ответ пользователя
              if (review.given != null && review.given!.isNotEmpty) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ваш ответ: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(
                      child: Text(
                        review.given!,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (review.givenValues.isNotEmpty) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ваши ответы: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(
                      child: Text(
                        review.givenValues
                            .where((v) => v.isNotEmpty)
                            .join(', '),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              // Правильный ответ
              if (!review.correct) ...[
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Правильно: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(
                      child: Text(
                        review.expected,
                        style: TextStyle(
                          color: isDark
                              ? RemoraColors.darkSuccess
                              : RemoraColors.lightSuccess,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
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
}
