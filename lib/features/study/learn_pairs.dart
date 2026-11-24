import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/distractors.dart';
import '../../data/api_client.dart';
import 'card_content_widget.dart';

class LearnPairs extends StatefulWidget {
  const LearnPairs({
    super.key,
    required this.pairs,
    required this.seed,
    required this.grade,
    required this.onSpeak,
    required this.onNext,
  });
  final List<QueueItem> pairs;
  final String seed;
  final Future<bool> Function(QueueItem, bool) grade;
  final void Function(QueueItem, bool answer) onSpeak;
  final VoidCallback onNext;
  @override
  State<LearnPairs> createState() => _LearnPairsState();
}

class _LearnPairsState extends State<LearnPairs> {
  final _pages = PageController();
  late final _options = shuffleWithSeed(widget.pairs, widget.seed);
  final _graded = <String>{}, _solved = <String>{};
  int _page = 0, _attempt = 0;
  String? _wrong;
  bool _busy = false;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  Future<void> _pick(QueueItem question, QueueItem option) async {
    final id = question.card.id;
    if (_busy || _solved.contains(id) || _solved.contains(option.card.id)) {
      return;
    }
    final correct = id == option.card.id;
    setState(() => _busy = true);
    if (!_graded.contains(id)) {
      final saved = await widget.grade(question, correct);
      if (!mounted) return;
      if (!saved) {
        setState(() => _busy = false);
        return;
      }
      _graded.add(id);
    }
    setState(() {
      _busy = false;
      _attempt++;
      _wrong = correct ? null : option.card.id;
      if (correct) _solved.add(id);
    });
    if (correct && widget.pairs[_page] == question) {
      widget.onSpeak(question, true);
    } else if (!correct && !MediaQuery.disableAnimationsOf(context)) {
      HapticFeedback.lightImpact();
    }
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              IconButton(
                tooltip: 'Предыдущее определение',
                onPressed: _page > 0
                    ? () => _pages.jumpToPage(_page - 1)
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),
              for (var i = 0; i < count; i++)
                Semantics(
                  selected: i == _page,
                  label:
                      'Определение ${i + 1}${_solved.contains(widget.pairs[i].card.id) ? ', решено' : ''}',
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(44, 44),
                      backgroundColor: i == _page
                          ? theme.colorScheme.primaryContainer
                          : null,
                    ),
                    onPressed: () => _pages.jumpToPage(i),
                    child: Text('${i + 1}'),
                  ),
                ),
              IconButton(
                tooltip: 'Следующее определение',
                onPressed: _page + 1 < count
                    ? () => _pages.jumpToPage(_page + 1)
                    : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pages,
            itemCount: count,
            onPageChanged: (i) {
              setState(() {
                _page = i;
                _wrong = null;
              });
              widget.onSpeak(widget.pairs[i], false);
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
                        value: question.card.definition,
                        contentType: question.card.contentType,
                        codeLanguage: question.card.codeLanguage,
                        imageUrl: question.card.definitionImageUrl,
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
                          _wrong == option.card.id && i == _page ? _attempt : 0,
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
                            backgroundColor: theme.colorScheme.error.withValues(
                              alpha: alpha,
                            ),
                            disabledBackgroundColor:
                                _solved.contains(question.card.id) &&
                                    option == question
                                ? theme.colorScheme.primaryContainer
                                : null,
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
                          option.card.term,
                          style: TextStyle(
                            decoration: _solved.contains(option.card.id)
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ),
                    ),
                  if (i == _page && _wrong != null)
                    Semantics(
                      liveRegion: true,
                      child: Text(
                        'Попробуйте другую пару',
                        style: TextStyle(color: theme.colorScheme.error),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        if (_solved.length == count)
          FilledButton(onPressed: widget.onNext, child: const Text('Дальше')),
      ],
    );
  }
}
