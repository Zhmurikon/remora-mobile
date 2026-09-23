import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';

/// Провайдер состояния конфигурации теста.
final testConfigProvider = StateProvider<TestConfig>((ref) => TestConfig());

/// Провайдер для создания/получения тестов.
final testSessionProvider =
    StateNotifierProvider<TestSessionNotifier, TestSessionState>((ref) {
      return TestSessionNotifier(ref.read(apiClientProvider));
    });

class TestSessionState {
  TestSessionState({this.isLoading = false, this.attempt, this.error});

  final bool isLoading;
  final TestAttemptOut? attempt;
  final String? error;

  TestSessionState copyWith({
    bool? isLoading,
    TestAttemptOut? attempt,
    String? error,
  }) {
    return TestSessionState(
      isLoading: isLoading ?? this.isLoading,
      attempt: attempt ?? this.attempt,
      error: error,
    );
  }
}

class TestSessionNotifier extends StateNotifier<TestSessionState> {
  TestSessionNotifier(this._api) : super(TestSessionState());

  final RemoraApiClient _api;

  Future<void> createTest(String setId, TestConfig config) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final attempt = await _api.createTest(setId: setId, config: config);
      state = state.copyWith(isLoading: false, attempt: attempt);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Не удалось создать тест. Проверьте подключение.',
      );
    }
  }
}

/// Экран настройки теста перед запуском.
class TestSetupScreen extends ConsumerStatefulWidget {
  const TestSetupScreen({
    super.key,
    required this.setId,
    required this.setTitle,
  });

  final String setId;
  final String setTitle;

  @override
  ConsumerState<TestSetupScreen> createState() => _TestSetupScreenState();
}

class _TestSetupScreenState extends ConsumerState<TestSetupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final config = ref.watch(testConfigProvider);
    final testState = ref.watch(testSessionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.setTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Настройки теста', style: theme.textTheme.titleLarge),
            const SizedBox(height: 24),
            // Количество вопросов
            Text('Количество вопросов', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                _countChip(context, config, 10),
                const SizedBox(width: 8),
                _countChip(context, config, 20),
                const SizedBox(width: 8),
                _countChip(context, config, 50),
              ],
            ),
            const SizedBox(height: 20),
            // Типы вопросов
            Text('Типы вопросов', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _kindChip(context, config, 'choice', 'Выбор'),
                _kindChip(context, config, 'true_false', 'Верно/Неверно'),
                _kindChip(context, config, 'typing', 'Ввод'),
                _kindChip(context, config, 'matching', 'Сопоставление'),
              ],
            ),
            const SizedBox(height: 20),
            // Направление
            Text('Направление', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                _directionChip(
                  context,
                  config,
                  'term_to_def',
                  'Термин → Определение',
                ),
                const SizedBox(width: 8),
                _directionChip(
                  context,
                  config,
                  'def_to_term',
                  'Определение → Термин',
                ),
                const SizedBox(width: 8),
                _directionChip(context, config, 'both', 'Оба'),
              ],
            ),
            const SizedBox(height: 20),
            // Источник
            Text('Источник карточек', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                _sourceChip(context, config, 'all', 'Все'),
                const SizedBox(width: 8),
                _sourceChip(context, config, 'hard', 'Трудные'),
                const SizedBox(width: 8),
                _sourceChip(context, config, 'new', 'Новые'),
              ],
            ),
            const SizedBox(height: 20),
            // Записывать в расписание
            Row(
              children: [
                Switch(
                  value: config.writeToSchedule,
                  onChanged: (v) {
                    ref.read(testConfigProvider.notifier).state = config
                        .copyWith(writeToSchedule: v);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Записать результаты в расписание',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Ошибка
            if (testState.error != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:
                      (isDark
                              ? RemoraColors.darkDanger
                              : RemoraColors.lightDanger)
                          .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  testState.error!,
                  style: TextStyle(
                    color: isDark
                        ? RemoraColors.darkDanger
                        : RemoraColors.lightDanger,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
            ],
            // Кнопка старта
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: testState.isLoading
                    ? null
                    : () async {
                        await ref
                            .read(testSessionProvider.notifier)
                            .createTest(widget.setId, config);
                        final attempt = ref.read(testSessionProvider).attempt;
                        if (attempt != null && context.mounted) {
                          context.go('/set/${widget.setId}/test/${attempt.id}');
                        }
                      },
                child: testState.isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Начать тест', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _countChip(BuildContext context, TestConfig config, int count) {
    final isSelected = config.questionCount == count;
    return Expanded(
      child: FilterChip(
        selected: isSelected,
        label: Text('$count'),
        onSelected: (_) {
          ref.read(testConfigProvider.notifier).state = config.copyWith(
            questionCount: count,
          );
        },
      ),
    );
  }

  Widget _kindChip(
    BuildContext context,
    TestConfig config,
    String kind,
    String label,
  ) {
    final isSelected = config.kinds.contains(kind);
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      onSelected: (_) {
        final kinds = List<String>.from(config.kinds);
        if (isSelected && kinds.length > 1) {
          kinds.remove(kind);
        } else if (!isSelected) {
          kinds.add(kind);
        }
        ref.read(testConfigProvider.notifier).state = config.copyWith(
          kinds: kinds,
        );
      },
    );
  }

  Widget _directionChip(
    BuildContext context,
    TestConfig config,
    String dir,
    String label,
  ) {
    final isSelected = config.direction == dir;
    return Expanded(
      child: FilterChip(
        selected: isSelected,
        label: Text(label, style: const TextStyle(fontSize: 12)),
        onSelected: (_) {
          ref.read(testConfigProvider.notifier).state = config.copyWith(
            direction: dir,
          );
        },
      ),
    );
  }

  Widget _sourceChip(
    BuildContext context,
    TestConfig config,
    String source,
    String label,
  ) {
    final isSelected = config.source == source;
    return Expanded(
      child: FilterChip(
        selected: isSelected,
        label: Text(label),
        onSelected: (_) {
          ref.read(testConfigProvider.notifier).state = config.copyWith(
            source: source,
          );
        },
      ),
    );
  }
}
