import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/ink_motion.dart';
import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'study_flip_card.dart';
import 'study_provider.dart';
import 'space_rewards.dart';
import 'study_shell.dart';

/// Режим «Карточки»: переворот, навигация, самооценка.
class FlashcardsScreen extends ConsumerStatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen> {
  final _field = GlobalKey<SpaceFieldState>();
  QueueItem? _held;
  final _keyboardFocus = FocusNode();
  bool _isFlipped = false;
  bool _submitting = false;

  @override
  void dispose() {
    _keyboardFocus.dispose();
    super.dispose();
  }

  void _flip() {
    if (_submitting) return;
    HapticFeedback.selectionClick();
    setState(() => _isFlipped = !_isFlipped);
  }

  Future<void> _rate(int rating) async {
    if (_submitting) return;
    final state = ref.read(studySessionProvider);
    final item = state.currentItem;
    if (item == null) return;

    setState(() {
      _held = item;
      _submitting = true;
    });
    try {
      await ref
          .read(studySessionProvider.notifier)
          .answer(item: item, rating: rating);
    } catch (_) {
      if (mounted) {
        setState(() {
          _held = null;
          _submitting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Не удалось сохранить ответ. Попробуйте ещё раз.'),
          ),
        );
      }
      return;
    }
    if (!mounted) return;
    if (rating >= 3) {
      await _field.currentState?.reward(ref.read(studySessionProvider).streak);
    }
    if (!mounted) return;
    if (ref.read(studySessionProvider).isFinished) {
      openStudyResult(context);
      return;
    }
    _field.currentState?.fade();
    setState(() {
      _held = null;
      _isFlipped = false;
      _submitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(studySessionProvider);

    final item = _held ?? state.currentItem;
    if (item == null) {
      return const StudyShell(child: Center(child: Text('Очередь пуста')));
    }

    return StudyShell(
      busy: _submitting,
      child: SpaceField(
        key: _field,
        child: KeyboardListener(
          focusNode: _keyboardFocus,
          autofocus: true,
          onKeyEvent: (event) {
            if (event is! KeyDownEvent) return;
            switch (event.logicalKey) {
              case LogicalKeyboardKey.space:
              case LogicalKeyboardKey.enter:
                _flip();
              case LogicalKeyboardKey.digit1:
                if (_isFlipped) _rate(1);
              case LogicalKeyboardKey.digit2:
                if (_isFlipped) _rate(3);
            }
          },
          child: FlashcardStudyView(
            item: item,
            isFlipped: _isFlipped,
            submitting: _submitting,
            onFlip: _flip,
            onRate: _rate,
          ),
        ),
      ),
    );
  }
}

class FlashcardStudyView extends StatelessWidget {
  const FlashcardStudyView({
    required this.item,
    required this.isFlipped,
    required this.submitting,
    required this.onFlip,
    required this.onRate,
    super.key,
  });

  final QueueItem item;
  final bool isFlipped;
  final bool submitting;
  final VoidCallback onFlip;
  final ValueChanged<int> onRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(RemoraSpacing.md),
      child: Column(
        children: [
          Expanded(
            child: InkReveal(
              change: (item.card.id, item.direction),
              onMount: false,
              child: StudyFlipCard(
                key: ValueKey((item.card.id, item.direction)),
                item: item,
                isAnswer: isFlipped,
                onFlip: submitting ? null : onFlip,
              ),
            ),
          ),
          const SizedBox(height: RemoraSpacing.md),
          Visibility(
            visible: isFlipped,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: _RatingPanel(submitting: submitting, onRate: onRate),
          ),
        ],
      ),
    );
  }
}

class _RatingPanel extends StatelessWidget {
  const _RatingPanel({required this.submitting, required this.onRate});

  final bool submitting;
  final ValueChanged<int> onRate;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 8,
      children: [
        OutlinedButton(
          onPressed: submitting ? null : () => onRate(1),
          child: const Text('Не помню'),
        ),
        FilledButton(
          onPressed: submitting ? null : () => onRate(3),
          child: const Text('Помню'),
        ),
      ],
    );
  }
}
