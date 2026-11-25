import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/distractors.dart';
import '../../widgets/ink_motion.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';
import '../../app/theme.dart';

class LearnPairs extends StatefulWidget {
  const LearnPairs({
    super.key,
    required this.pairs,
    required this.seed,
    required this.grade,
    required this.onSpeak,
    required this.onComplete,
    required this.onRepeatedMistake,
    required this.onNext,
  });
  final List<QueueItem> pairs;
  final String seed;
  final Future<bool> Function(
    QueueItem source,
    QueueItem item,
    bool correct,
    String given,
  )
  grade;
  final Future<void> Function() onComplete;
  final VoidCallback onRepeatedMistake;
  final void Function(QueueItem, bool answer) onSpeak;
  final VoidCallback onNext;
  @override
  State<LearnPairs> createState() => _LearnPairsState();
}

class _LearnPairsState extends State<LearnPairs> {
  final _pages = PageController();
  Timer? _advance;
  late final _options = shuffleWithSeed(widget.pairs, widget.seed);
  final _graded = <String>{}, _solved = <String>{};
  int _page = 0, _attempt = 0;
  int _reveal = 0;
  String? _wrong;
  bool _busy = false, _termFirst = false;
  String get _direction => _termFirst ? 'term_to_def' : 'def_to_term';

  @override
  void dispose() {
    _advance?.cancel();
    _pages.dispose();
    super.dispose();
  }

  void _visit(int page) {
    _advance?.cancel();
    if (page == _page && !_pages.position.isScrollingNotifier.value) return;
    if (!MediaQuery.disableAnimationsOf(context)) {
      if (((_pages.page ?? _page) - page).abs() <= 1) {
        _pages.animateToPage(
          page,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOutCubic,
        );
        return;
      }
      // При переходе через несколько пар озвучиваем только целевую страницу.
      setState(() => _reveal++);
    }
    _pages.jumpToPage(page);
  }

  void _scheduleNextPair() {
    final count = widget.pairs.length;
    for (var offset = 1; offset < count; offset++) {
      final next = (_page + offset) % count;
      if (_solved.contains(widget.pairs[next].card.id)) continue;
      _advance?.cancel();
      _advance = Timer(const Duration(seconds: 1), () {
        if (_pages.hasClients && !_pages.position.isScrollingNotifier.value) {
          _visit(next);
        }
      });
      return;
    }
  }

  Future<void> _pick(QueueItem question, QueueItem option) async {
    final id = question.card.id;
    if (_busy || _solved.contains(id) || _solved.contains(option.card.id)) {
      return;
    }
    final correct = id == option.card.id;
    setState(() => _busy = true);
    if (!_graded.contains(id)) {
      final saved = await widget.grade(
        question,
        question.facing(_direction),
        correct,
        _termFirst ? option.card.definition : option.card.term,
      );
      if (!mounted) return;
      if (!saved) {
        setState(() => _busy = false);
        return;
      }
      _graded.add(id);
    } else if (!correct) {
      widget.onRepeatedMistake();
    }
    setState(() {
      _attempt++;
      _wrong = !correct && widget.pairs[_page] == question
          ? option.card.id
          : null;
      if (correct) _solved.add(id);
    });
    if (correct && widget.pairs[_page] == question) {
      widget.onSpeak(question.facing(_direction), true);
      _scheduleNextPair();
    } else if (!correct && !MediaQuery.disableAnimationsOf(context)) {
      HapticFeedback.lightImpact();
    }
    if (_solved.length == widget.pairs.length) {
      await Future.wait([
        widget.onComplete(),
        Future<void>.delayed(const Duration(seconds: 1)),
      ]);
      if (!mounted) return;
      await Future<void>.delayed(const Duration(milliseconds: 800));
      if (mounted) widget.onNext();
      return;
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = widget.pairs.length;
    return Column(
      children: [
        Text(
          'Собрано ${_solved.length} из $count',
          style: theme.textTheme.labelMedium,
        ),
        TextButton(
          onPressed: _busy || _solved.length == count
              ? null
              : () {
                  _advance?.cancel();
                  setState(() {
                    _termFirst = !_termFirst;
                    _wrong = null;
                  });
                  widget.onSpeak(widget.pairs[_page].facing(_direction), false);
                },
          child: Text(_termFirst ? 'Начать с определения' : 'Начать с термина'),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              IconButton(
                tooltip: _termFirst
                    ? 'Предыдущий термин'
                    : 'Предыдущее определение',
                onPressed: _page > 0 ? () => _visit(_page - 1) : null,
                icon: const Icon(Icons.chevron_left),
              ),
              for (var i = 0; i < count; i++)
                Semantics(
                  selected: i == _page,
                  label:
                      '${_termFirst ? 'Термин' : 'Определение'} ${i + 1}${_solved.contains(widget.pairs[i].card.id) ? ', решено' : ''}',
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(44, 44),
                      backgroundColor: i == _page
                          ? theme.colorScheme.primaryContainer
                          : null,
                    ),
                    onPressed: () => _visit(i),
                    child: Text('${i + 1}'),
                  ),
                ),
              IconButton(
                tooltip: _termFirst
                    ? 'Следующий термин'
                    : 'Следующее определение',
                onPressed: _page + 1 < count ? () => _visit(_page + 1) : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        Expanded(
          child: InkReveal(
            onMount: false,
            change: (_reveal, _termFirst),
            child: PageView.builder(
              controller: _pages,
              itemCount: count,
              onPageChanged: (i) {
                _advance?.cancel();
                setState(() {
                  _page = i;
                  _wrong = null;
                });
                widget.onSpeak(widget.pairs[i].facing(_direction), false);
              },
              itemBuilder: (context, i) {
                final question = widget.pairs[i];
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: CardContentWidget(
                          value: _termFirst
                              ? question.card.term
                              : question.card.definition,
                          contentType: question.card.contentType,
                          codeLanguage: question.card.codeLanguage,
                          imageUrl: _termFirst
                              ? question.card.termImageUrl
                              : question.card.definitionImageUrl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    for (final option in _options)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TweenAnimationBuilder<double>(
                          key: ValueKey((
                            option.card.id,
                            _wrong == option.card.id && i == _page
                                ? _attempt
                                : 0,
                          )),
                          tween: Tween(
                            begin: _wrong == option.card.id && i == _page
                                ? 0.32
                                : 0.0,
                            end:
                                MediaQuery.disableAnimationsOf(context) &&
                                    _wrong == option.card.id &&
                                    i == _page
                                ? 0.20
                                : 0.0,
                          ),
                          duration: MediaQuery.disableAnimationsOf(context)
                              ? Duration.zero
                              : const Duration(milliseconds: 560),
                          builder: (context, alpha, child) => OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color.alphaBlend(
                                theme.colorScheme.error.withValues(
                                  alpha: alpha,
                                ),
                                theme.colorScheme.surface,
                              ),
                              disabledBackgroundColor:
                                  _solved.contains(question.card.id) &&
                                      option == question
                                  ? Color.alphaBlend(
                                      (theme.brightness == Brightness.dark
                                              ? RemoraColors.darkSuccess
                                              : RemoraColors.lightSuccess)
                                          .withValues(alpha: .25),
                                      theme.colorScheme.surface,
                                    )
                                  : theme.colorScheme.surface,
                              alignment: Alignment.centerLeft,
                              minimumSize: const Size.fromHeight(48),
                            ),
                            onPressed:
                                _busy ||
                                    _solved.contains(question.card.id) ||
                                    _solved.contains(option.card.id)
                                ? null
                                : () => _pick(question, option),
                            child: child,
                          ),
                          child: Text(
                            _termFirst
                                ? option.card.definition
                                : option.card.term,
                            style: TextStyle(
                              decoration: _solved.contains(option.card.id)
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
