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
import 'study_flip_card.dart';
import 'study_feedback.dart';
import 'space_rewards.dart';
import '../../app/theme.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key, this.seed});
  final String? seed;

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen>
    with WidgetsBindingObserver {
  static const _speech = MethodChannel('remora/learn-speech');
  final _field = GlobalKey<SpaceFieldState>();
  int _streak = 0;
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
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _readExercise(LearnExercise exercise) {
    if (exercise.kind == LearnKind.pairs) {
      _speak(
        _visiblePair ?? exercise.pairs.first.facing('def_to_term'),
        answer: _pairAnswer,
      );
    } else {
      final answer = _revealed || _verdict != null;
      _speak(
        exercise.item,
        answer: answer,

        statement: answer ? null : exercise.statement,
      );
    }
  }

  Future<bool> _grade(
    QueueItem source,
    QueueItem item,
    bool correct, [
    String? given,
  ]) async {
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
            given: given,
            rating: correct ? 3 : 1,
            answerCorrect: correct,
            durationMs: _duration.elapsedMilliseconds,
            requeue:
                !correct ||
                successes <
                    ref.read(studySessionProvider).learnSuccessesRequired,
          );
      _streak = correct ? _streak + 1 : 0;
      _successes[key] = successes;
      _introduced.add(item.card.id);
      _duration.reset();
      return true;
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Не удалось сохранить ответ. Попробуйте ещё раз.',
              textAlign: TextAlign.center,
            ),
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
    final saved = await _grade(
      ex.source,
      ex.item,
      correct,
      picked ?? (_input.text.trim().isEmpty ? null : _input.text),
    );
    if (!mounted) return;
    if (!saved) {
      setState(() {
        _verdict = null;
        _picked = null;
      });
    } else {
      final speech = ex.kind != LearnKind.recall && !_revealed
          ? _speak(ex.item, answer: true)
          : Future<void>.value();
      if (correct) {
        await Future.wait([
          speech,
          if (_field.currentState case final field?) field.reward(_streak),
        ]);
      }
      if (mounted &&
          identical(_held, ex) &&
          (correct || ex.kind == LearnKind.recall)) {
        _next();
      }
    }
  }

  void _next() {
    if (_saving) return;
    _field.currentState?.fade();
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
      busy: _saving || _verdict == true,
      child: SpaceField(
        key: _field,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
          child: Column(
            children: [
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        ex.kind.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    if (premium)
                      IconButton(
                        tooltip: _audio
                            ? 'Выключить озвучку'
                            : 'Включить озвучку',
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
              ),
              Expanded(
                child: ex.kind == LearnKind.pairs
                    ? LearnPairs(
                        key: ValueKey(_turn),
                        pairs: ex.pairs,
                        seed: '$_seed:$_turn',
                        grade: _grade,
                        onRepeatedMistake: () => _streak = 0,
                        onComplete: () async {
                          setState(() => _verdict = true);
                          await _field.currentState?.reward(_streak);
                        },
                        onSpeak: (item, answer) {
                          _visiblePair = item;
                          _pairAnswer = answer;
                          _speak(item, answer: answer);
                        },
                        onNext: _next,
                      )
                    : _question(ex, state),
              ),
            ],
          ),
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
    Widget panel(String value, String? image, {Color? color}) => Card(
      color: color,
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
    final colors = Theme.of(context).colorScheme;
    final success = Theme.of(context).brightness == Brightness.dark
        ? RemoraColors.darkSuccess
        : RemoraColors.lightSuccess;
    return ListView(
      children: [
        if (ex.kind == LearnKind.recall || ex.kind == LearnKind.preview)
          SizedBox(
            height: (MediaQuery.sizeOf(context).height * 0.42).clamp(
              220.0,
              400.0,
            ),
            child: StudyFlipCard(
              key: ValueKey(_turn),
              item: item,
              isAnswer: _revealed,
              showSideName: ex.kind == LearnKind.preview,
              onFlip: finished || _saving
                  ? null
                  : () {
                      setState(() => _revealed = !_revealed);
                      _speak(item, answer: _revealed);
                    },
            ),
          )
        else ...[
          if (card.hint?.isNotEmpty == true) Text(card.hint!),
          panel(
            forward ? card.term : card.definition,
            forward ? card.termImageUrl : card.definitionImageUrl,
          ),
          if (ex.statement != null) panel(ex.statement!, null),
        ],
        const SizedBox(height: 16),
        if (ex.kind == LearnKind.preview)
          Center(
            child: nextButton(() {
              if (!_revealed) {
                setState(() => _revealed = true);
                _speak(item, answer: true);
                return;
              }
              _introduced.add(card.id);
              ref.read(studySessionProvider.notifier).deferPreview();
              _next();
            }),
          ),
        for (final option in answers)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: finished && (option == _picked || option == expectedChoice)
                  ? (option == expectedChoice
                        ? Color.alphaBlend(
                            success.withValues(alpha: _verdict! ? .36 : .16),
                            colors.surface,
                          )
                        : colors.errorContainer)
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
                  child: Semantics(
                    liveRegion: finished && option == _picked,
                    label: finished && option == expectedChoice
                        ? 'Правильный вариант'
                        : finished && option == _picked
                        ? 'Ошибка'
                        : null,
                    child: IgnorePointer(
                      child: SelectionContainer.disabled(
                        child: content(option),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (writing) ...[
          TextField(
            controller: _input,
            readOnly: _revealed || finished,
            onSubmitted: (_) => check(),
            decoration: InputDecoration(
              filled: true,
              fillColor: switch (_verdict) {
                true => Color.alphaBlend(
                  success.withValues(alpha: .36),
                  colors.surface,
                ),
                false => colors.errorContainer,
                null => colors.surface,
              },
              labelText: 'Ваш ответ',
            ),
          ),
          if (_revealed || _verdict == false)
            panel(
              expected,
              forward ? card.definitionImageUrl : card.termImageUrl,
              color: Color.alphaBlend(
                success.withValues(alpha: .16),
                colors.surface,
              ),
            ),
          if (!_revealed && !finished)
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: [
                FilledButton(
                  onPressed: _saving ? null : check,
                  child: const Text('Проверить'),
                ),
                TextButton(
                  onPressed: _saving ? null : () => _submit(ex, false),
                  child: const Text('Не знаю'),
                ),
              ],
            ),
        ],
        if (_similarity != null) StudyFeedback('Совпадение $_similarity%'),
        if (_revealed &&
            (ex.kind == LearnKind.recall || (writing && !finished)))
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            children: [
              OutlinedButton(
                onPressed: finished || _saving
                    ? null
                    : () => _submit(ex, false),
                child: Text(writing ? 'Не засчитывать' : 'Не помню'),
              ),
              FilledButton(
                onPressed: finished || _saving ? null : () => _submit(ex, true),
                child: Text(writing ? 'Засчитать' : 'Помню'),
              ),
            ],
          ),
        if (answers.isNotEmpty || (writing && finished))
          SizedBox(
            height: 64,
            child: Center(child: _verdict == false ? nextButton(_next) : null),
          ),
      ],
    );
  }
}
