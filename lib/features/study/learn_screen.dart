import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/answers.dart';
import '../../core/learn_exercise.dart';
import '../../data/api_client.dart';
import '../workspace/workspace.dart';
import 'card_content_widget.dart';
import 'learn_pairs.dart';
import 'study_provider.dart';
import 'study_shell.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key, this.seed});
  final String? seed;

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen>
    with WidgetsBindingObserver {
  static const _speech = MethodChannel('remora/learn-speech');
  final _input = TextEditingController();
  final _introduced = <String>{};
  final _successes = <String, int>{};
  late final _seed = widget.seed ?? const Uuid().v4();
  int _turn = 0;
  final _duration = Stopwatch()..start();
  LearnKind? _previous;
  LearnExercise? _held;
  bool? _verdict, _writeTerm, _writeDefinition;
  bool _revealed = false, _saving = false, _audio = false;
  String? _picked;
  int? _similarity;
  QueueItem? _visiblePair;
  bool _pairAnswer = false;
  int? _spokenTurn;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stop();
    _input.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) _stop();
  }

  void _stop() {
    if (_audio) {
      unawaited(_speech.invokeMethod<void>('stop').catchError((Object _) {}));
    }
  }

  Future<void> _speak(
    QueueItem item, {
    bool answer = false,
    bool both = false,
    String? statement,
  }) async {
    if (!_audio ||
        !mounted ||
        WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return;
    }
    final state = ref.read(studySessionProvider);
    final forward = item.direction == 'term_to_def';
    Map<String, String> side(bool term) => {
      'text': term ? item.card.term : item.card.definition,
      'lang': term
          ? item.langTerm ?? state.langTerm
          : item.langDefinition ?? state.langDefinition,
    };
    final parts = [
      side(answer ? !forward : forward),
      if (both) side(!forward),
      if (statement != null) {...side(false), 'text': statement},
    ];
    try {
      final ok = await _speech.invokeMethod<bool>('speak', parts);
      if (mounted && ok == false && _audio) _unavailable();
    } on PlatformException {
      if (mounted && _audio) _unavailable();
    } on MissingPluginException {
      if (mounted && _audio) _unavailable();
    }
  }

  void _unavailable() {
    setState(() => _audio = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Озвучка недоступна. Проверьте языки синтеза речи в настройках Android.',
        ),
      ),
    );
  }

  void _readExercise(LearnExercise exercise) {
    if (exercise.kind == LearnKind.pairs) {
      _speak(
        (_visiblePair ?? exercise.pairs.first).facing('def_to_term'),
        answer: _pairAnswer,
      );
    } else {
      final answer = _revealed || _verdict != null;
      _speak(
        exercise.item,
        answer: answer,
        both: exercise.kind == LearnKind.preview,
        statement: answer ? null : exercise.statement,
      );
    }
  }

  Future<bool> _grade(QueueItem source, QueueItem item, bool correct) async {
    if (_saving) return false;
    setState(() => _saving = true);
    final key = '${item.card.id}:${item.direction}';
    final successes = (_successes[key] ?? 0) + (correct ? 1 : 0);
    try {
      await ref
          .read(studySessionProvider.notifier)
          .answer(
            item: item,
            consume: source,
            rating: correct ? 3 : 1,
            answerCorrect: correct,
            durationMs: _duration.elapsedMilliseconds,
            requeue:
                !correct ||
                successes <
                    ref.read(studySessionProvider).learnSuccessesRequired,
          );
      _successes[key] = successes;
      _introduced.add(item.card.id);
      _duration.reset();
      return true;
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Не удалось сохранить ответ. Попробуйте ещё раз.'),
          ),
        );
      }
      return false;
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _submit(LearnExercise ex, bool correct, [String? picked]) async {
    if (_saving || _verdict != null) return;
    setState(() {
      _verdict = correct;
      _picked = picked;
    });
    final saved = await _grade(ex.source, ex.item, correct);
    if (!mounted) return;
    if (!saved) {
      setState(() {
        _verdict = null;
        _picked = null;
      });
    } else if (ex.kind != LearnKind.recall && !_revealed) {
      _speak(ex.item, answer: true);
    }
  }

  void _next() {
    if (_saving) return;
    _stop();
    final state = ref.read(studySessionProvider);
    if (state.isFinished) {
      openStudyResult(context);
      return;
    }
    setState(() {
      if (_held?.kind != LearnKind.preview) _previous = _held?.kind;
      _turn++;
      _held = null;
      _revealed = false;
      _verdict = null;
      _picked = null;
      _similarity = null;
      _visiblePair = null;
      _pairAnswer = false;
      _input.clear();
      _duration.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studySessionProvider);
    final premium =
        ref
            .watch(workspaceDocument('billing/entitlements'))
            .valueOrNull?['features']?['study.learn_narration'] ==
        true;
    if (!premium && _audio) {
      _stop();
      _audio = false;
    }
    ref.listen(studySessionProvider, (prev, next) {
      if (next.isFinished && !_saving && prev?.isFinished != true) {
        openStudyResult(context);
      }
    });
    if (_held == null && state.currentItem == null) {
      return const StudyShell(child: Center(child: Text('Очередь пуста')));
    }
    final typing = state.learnQuestionTypes.contains('typing');
    final term =
        _writeTerm ?? (typing && state.currentItem?.direction == 'def_to_term');
    final definition =
        _writeDefinition ??
        (typing && state.currentItem?.direction == 'term_to_def');
    final ex = _held ??= prepareLearnExercise(
      items: state.items,
      index: state.index,
      turn: _turn,
      types: state.learnQuestionTypes,
      writeTerm: term,
      writeDefinition: definition,
      seed: _seed,
      previous: _previous,
      introduced: _introduced,
    );
    if (_audio && _spokenTurn != _turn) {
      _spokenTurn = _turn;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && identical(_held, ex)) _readExercise(ex);
      });
    }
    return StudyShell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    ex.kind.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (premium)
                  IconButton(
                    tooltip: _audio ? 'Выключить озвучку' : 'Включить озвучку',
                    icon: Icon(
                      _audio ? Icons.volume_up : Icons.volume_off_outlined,
                    ),
                    onPressed: () {
                      if (_audio) _stop();
                      setState(() {
                        _audio = !_audio;
                        _spokenTurn = null;
                      });
                    },
                  ),
                PopupMenuButton<String>(
                  tooltip: 'Настройки письма',
                  onSelected: (value) {
                    setState(() {
                      if (ex.kind != LearnKind.pairs &&
                          !_saving &&
                          !_revealed &&
                          _verdict == null &&
                          _input.text.isEmpty) {
                        _stop();
                        _held = null;
                        _spokenTurn = null;
                      }
                      _writeTerm = value == 'term' ? !term : term;
                      _writeDefinition = value == 'definition'
                          ? !definition
                          : definition;
                    });
                  },
                  itemBuilder: (_) => [
                    CheckedPopupMenuItem(
                      value: 'term',
                      checked: term,
                      child: const Text('Писать термин'),
                    ),
                    CheckedPopupMenuItem(
                      value: 'definition',
                      checked: definition,
                      child: const Text('Писать определение'),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ex.kind == LearnKind.pairs
                  ? LearnPairs(
                      key: ValueKey(_turn),
                      pairs: ex.pairs,
                      seed: '$_seed:$_turn',
                      grade: (source, correct) =>
                          _grade(source, source.facing('def_to_term'), correct),
                      onSpeak: (item, answer) {
                        _visiblePair = item;
                        _pairAnswer = answer;
                        _speak(item.facing('def_to_term'), answer: answer);
                      },
                      onNext: _next,
                    )
                  : _question(ex, state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _question(LearnExercise ex, StudySessionState state) {
    final item = ex.item, card = item.card;
    final forward = item.direction == 'term_to_def';
    final expected = forward ? card.definition : card.term;
    final writing =
        ex.kind == LearnKind.writeDefinition || ex.kind == LearnKind.writeTerm;
    final finished = _verdict != null;
    Widget content(String value, {String? image}) => CardContentWidget(
      value: value,
      contentType: card.contentType,
      codeLanguage: card.codeLanguage,
      imageUrl: image,
    );
    Widget panel(String value, String? image) => Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: content(value, image: image),
      ),
    );
    final answers = ex.kind == LearnKind.truth
        ? ['Верно', 'Неверно']
        : ex.options;
    final expectedChoice = ex.kind == LearnKind.truth
        ? (ex.truth! ? 'Верно' : 'Неверно')
        : expected;
    void check() {
      if (_input.text.trim().isEmpty || _saving || finished || _revealed) {
        return;
      }
      final opts = AnswerOptions(
        strictness: state.answerStrictness,
        lang: forward
            ? item.langDefinition ?? state.langDefinition
            : item.langTerm ?? state.langTerm,
      );
      final score = [expected, ...card.altAnswers]
          .map((value) => answerSimilarity(_input.text, value, opts))
          .reduce((a, b) => a > b ? a : b);
      setState(() => _similarity = score);
      if (state.learnTypingCheck == 'self_check') {
        setState(() => _revealed = true);
        _speak(item, answer: true);
      } else {
        _submit(ex, score >= state.learnMatchPercent);
      }
    }

    Widget nextButton(VoidCallback action) => FilledButton(
      onPressed: _saving ? null : action,
      child: const Text('Дальше'),
    );
    return ListView(
      children: [
        if (card.hint?.isNotEmpty == true) Text(card.hint!),
        panel(
          forward ? card.term : card.definition,
          forward ? card.termImageUrl : card.definitionImageUrl,
        ),
        if (ex.statement != null) panel(ex.statement!, null),
        if (ex.kind == LearnKind.preview || _revealed || finished)
          panel(
            expected,
            forward ? card.definitionImageUrl : card.termImageUrl,
          ),
        const SizedBox(height: 12),
        if (ex.kind == LearnKind.preview)
          nextButton(() {
            _introduced.add(card.id);
            ref.read(studySessionProvider.notifier).deferPreview();
            _next();
          }),
        if (ex.kind == LearnKind.recall && !_revealed)
          FilledButton.tonal(
            onPressed: () {
              setState(() => _revealed = true);
              _speak(item, answer: true);
            },
            child: const Text('Показать ответ'),
          ),
        if (_revealed && !finished)
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _saving ? null : () => _submit(ex, false),
                  child: Text(writing ? 'Не засчитывать' : 'Не помню'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: _saving ? null : () => _submit(ex, true),
                  child: Text(writing ? 'Засчитать' : 'Помню'),
                ),
              ),
            ],
          ),
        for (final option in answers)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: finished && (option == _picked || option == expectedChoice)
                  ? (option == expectedChoice
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.errorContainer)
                  : Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: finished || _saving
                    ? null
                    : () => _submit(ex, option == expectedChoice, option),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: IgnorePointer(
                    child: SelectionContainer.disabled(child: content(option)),
                  ),
                ),
              ),
            ),
          ),
        if (writing && !_revealed && !finished) ...[
          TextField(
            controller: _input,
            onSubmitted: (_) => check(),
            decoration: const InputDecoration(labelText: 'Введите ответ'),
          ),
          FilledButton(
            onPressed: _saving ? null : check,
            child: const Text('Проверить'),
          ),
          TextButton(
            onPressed: _saving ? null : () => _submit(ex, false),
            child: const Text('Не знаю'),
          ),
        ],
        if (_similarity != null) Text('Совпадение $_similarity%'),
        if (finished) ...[
          Semantics(
            liveRegion: true,
            child: Text(_verdict! ? 'Правильно' : 'Повторим ещё раз'),
          ),
          nextButton(_next),
        ],
      ],
    );
  }
}
