import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';

final testSessionProvider =
    StateNotifierProvider<TestSessionNotifier, TestSessionState>((ref) {
      return TestSessionNotifier(ref.read(apiClientProvider));
    });

class TestSessionState {
  const TestSessionState({this.isLoading = false, this.attempt, this.error});

  final bool isLoading;
  final TestAttemptOut? attempt;
  final String? error;

  TestSessionState copyWith({
    bool? isLoading,
    TestAttemptOut? attempt,
    bool clearAttempt = false,
    String? error,
  }) {
    return TestSessionState(
      isLoading: isLoading ?? this.isLoading,
      attempt: clearAttempt ? null : attempt ?? this.attempt,
      error: error,
    );
  }
}

class TestSessionNotifier extends StateNotifier<TestSessionState> {
  TestSessionNotifier(this._api) : super(const TestSessionState());

  final RemoraApiClient _api;

  Future<void> createTest(String setId, TestConfig config) async {
    state = state.copyWith(isLoading: true, clearAttempt: true, error: null);
    try {
      final attempt = await _api.createTest(setId: setId, config: config);
      state = state.copyWith(isLoading: false, attempt: attempt);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        clearAttempt: true,
        error: 'Не удалось создать квиз. Проверьте подключение и повторите.',
      );
    }
  }
}

class TestSetupScreen extends ConsumerStatefulWidget {
  const TestSetupScreen({
    super.key,
    required this.setId,
    required this.setTitle,
    this.customQuiz = false,
  });

  final String setId;
  final String setTitle;
  final bool customQuiz;

  @override
  ConsumerState<TestSetupScreen> createState() => _TestSetupScreenState();
}

class _TestSetupScreenState extends ConsumerState<TestSetupScreen> {
  late TestConfig _config;

  @override
  void initState() {
    super.initState();
    _config = TestConfig(writeToSchedule: !widget.customQuiz);
  }

  Future<void> _start() async {
    await ref
        .read(testSessionProvider.notifier)
        .createTest(widget.setId, _config);
    if (!mounted) return;
    final attempt = ref.read(testSessionProvider).attempt;
    if (attempt != null) {
      context.go('/set/${widget.setId}/test/${attempt.id}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(testSessionProvider);
    return Scaffold(
      appBar: AppBar(title: Text(widget.setTitle)),
      body: QuizSetupView(
        config: _config,
        isLoading: state.isLoading,
        error: state.error,
        customQuiz: widget.customQuiz,
        onChanged: (config) => setState(() => _config = config),
        onStart: _start,
      ),
    );
  }
}

class QuizSetupView extends StatelessWidget {
  const QuizSetupView({
    required this.config,
    required this.isLoading,
    required this.error,
    required this.customQuiz,
    required this.onChanged,
    required this.onStart,
    super.key,
  });

  final TestConfig config;
  final bool isLoading;
  final String? error;
  final bool customQuiz;
  final ValueChanged<TestConfig> onChanged;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                RemoraSpacing.lg,
                RemoraSpacing.md,
                RemoraSpacing.lg,
                RemoraSpacing.xl,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        customQuiz ? 'Свой квиз' : 'Настройки теста',
                        style: context.remoraType.readingTitle.copyWith(
                          fontSize: 36,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xs),
                      Text(
                        customQuiz
                            ? 'Соберите короткую проверку под текущую задачу.'
                            : 'Проверьте знания в готовом формате.',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: RemoraSpacing.xl),
                      _ConfigSection(
                        title: 'Количество',
                        description:
                            'Если подходящих карточек меньше, квиз будет короче.',
                        child: SegmentedButton<int>(
                          segments: const [10, 20, 50]
                              .map(
                                (value) => ButtonSegment(
                                  value: value,
                                  label: Text('$value'),
                                ),
                              )
                              .toList(),
                          selected: {config.questionCount},
                          showSelectedIcon: false,
                          onSelectionChanged: (selection) => onChanged(
                            config.copyWith(questionCount: selection.first),
                          ),
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xl),
                      _ConfigSection(
                        title: 'Форматы вопросов',
                        description: 'Можно включить несколько форматов.',
                        child: Wrap(
                          spacing: RemoraSpacing.xs,
                          runSpacing: RemoraSpacing.xs,
                          children: [
                            _kindChip('choice', 'Выбор ответа'),
                            _kindChip('true_false', 'Верно / неверно'),
                            _kindChip('typing', 'Ввод ответа'),
                            _kindChip('matching', 'Сопоставление'),
                          ],
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xl),
                      _ConfigSection(
                        title: 'Направление',
                        child: Wrap(
                          spacing: RemoraSpacing.xs,
                          runSpacing: RemoraSpacing.xs,
                          children: [
                            _choiceChip(
                              label: 'Термин → определение',
                              selected: config.direction == 'term_to_def',
                              onSelected: () => onChanged(
                                config.copyWith(direction: 'term_to_def'),
                              ),
                            ),
                            _choiceChip(
                              label: 'Определение → термин',
                              selected: config.direction == 'def_to_term',
                              onSelected: () => onChanged(
                                config.copyWith(direction: 'def_to_term'),
                              ),
                            ),
                            _choiceChip(
                              label: 'Оба направления',
                              selected: config.direction == 'both',
                              onSelected: () =>
                                  onChanged(config.copyWith(direction: 'both')),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xl),
                      _ConfigSection(
                        title: 'Какие карточки',
                        child: Wrap(
                          spacing: RemoraSpacing.xs,
                          runSpacing: RemoraSpacing.xs,
                          children: [
                            _sourceChip('all', 'Все'),
                            _sourceChip('hard', 'Трудные'),
                            _sourceChip('new', 'Новые'),
                          ],
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.xl),
                      Material(
                        color: context.remora.surfaceMuted,
                        borderRadius: BorderRadius.circular(RemoraRadii.card),
                        child: SwitchListTile(
                          value: config.writeToSchedule,
                          onChanged: (value) => onChanged(
                            config.copyWith(writeToSchedule: value),
                          ),
                          title: const Text('Учитывать результаты'),
                          subtitle: const Text(
                            'Обновлять расписание повторений после ответов',
                          ),
                          secondary: const Icon(Icons.event_repeat_rounded),
                        ),
                      ),
                      if (error != null) ...[
                        const SizedBox(height: RemoraSpacing.md),
                        Semantics(
                          liveRegion: true,
                          child: Text(
                            error!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              RemoraSpacing.lg,
              RemoraSpacing.sm,
              RemoraSpacing.lg,
              RemoraSpacing.md,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              border: Border(top: BorderSide(color: theme.colorScheme.outline)),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: SizedBox(
                  width: double.infinity,
                  height: RemoraSizes.minTouchTarget,
                  child: FilledButton.icon(
                    onPressed: isLoading ? null : onStart,
                    icon: isLoading
                        ? const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.play_arrow_rounded),
                    label: Text(
                      'Начать квиз · до ${config.questionCount} вопросов',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kindChip(String kind, String label) {
    final selected = config.kinds.contains(kind);
    return FilterChip(
      selected: selected,
      label: Text(label),
      onSelected: (_) {
        if (selected && config.kinds.length == 1) return;
        final kinds = [...config.kinds];
        selected ? kinds.remove(kind) : kinds.add(kind);
        onChanged(config.copyWith(kinds: kinds));
      },
    );
  }

  Widget _choiceChip({
    required String label,
    required bool selected,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }

  Widget _sourceChip(String source, String label) {
    return _choiceChip(
      label: label,
      selected: config.source == source,
      onSelected: () => onChanged(config.copyWith(source: source)),
    );
  }
}

class _ConfigSection extends StatelessWidget {
  const _ConfigSection({
    required this.title,
    required this.child,
    this.description,
  });

  final String title;
  final String? description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: theme.textTheme.titleLarge),
        if (description != null) ...[
          const SizedBox(height: RemoraSpacing.xxs),
          Text(description!, style: theme.textTheme.bodySmall),
        ],
        const SizedBox(height: RemoraSpacing.sm),
        child,
      ],
    );
  }
}
