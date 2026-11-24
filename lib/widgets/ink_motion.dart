import 'package:flutter/material.dart';

abstract final class InkMotion {
  static const duration = Duration(milliseconds: 180);
  static const quick = Duration(milliseconds: 120);
  static const curve = Curves.easeOutCubic;
  static const style = AnimationStyle(
    duration: duration,
    reverseDuration: quick,
    curve: curve,
  );

  static AnimationStyle styleOf(BuildContext context) =>
      MediaQuery.disableAnimationsOf(context)
      ? AnimationStyle.noAnimation
      : style;
}

/// Системный жест «Назад» остаётся под управлением Android.
class InkPageTransitions extends PredictiveBackPageTransitionsBuilder {
  const InkPageTransitions({required this.reduced});
  final bool reduced;

  @override
  Duration get transitionDuration =>
      reduced ? Duration.zero : InkMotion.duration;

  @override
  Duration get reverseTransitionDuration =>
      reduced ? Duration.zero : InkMotion.quick;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (reduced) return child;
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

/// Новое содержимое занимает своё место сразу. Поля, фокус и цели нажатия
/// остаются в одном дереве даже при нескольких быстрых изменениях подряд.
class InkReveal extends StatefulWidget {
  const InkReveal({
    required this.child,
    this.change,
    this.onMount = true,
    this.turnPage = false,
    super.key,
  });
  final Widget child;
  final Object? change;
  final bool onMount;
  final bool turnPage;

  @override
  State<InkReveal> createState() => _InkRevealState();
}

class _InkRevealState extends State<InkReveal>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: InkMotion.duration,
    value: 1,
  );
  late final _ease = _controller.drive(CurveTween(curve: InkMotion.curve));
  late final _opacity = _ease.drive(Tween(begin: 0.55, end: 1.0));
  bool _first = true;
  bool _reduced = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced = MediaQuery.disableAnimationsOf(context);
    if (_reduced) {
      _controller.value = 1;
    } else if (_first && widget.onMount) {
      _controller.forward(from: 0);
    }
    _first = false;
  }

  @override
  void didUpdateWidget(InkReveal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_reduced && widget.change != oldWidget.change) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _opacity,
    child: AnimatedBuilder(
      animation: _ease,
      child: widget.child,
      builder: (_, child) {
        final remaining = 1 - _ease.value;
        if (widget.turnPage) {
          return Transform(
            alignment: Alignment.centerLeft,
            transformHitTests: false,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-0.22 * remaining),
            child: child,
          );
        }
        return Transform.translate(
          offset: Offset(0, 6 * remaining),
          transformHitTests: false,
          child: child,
        );
      },
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class InkProgressBar extends StatelessWidget {
  const InkProgressBar({
    required this.value,
    this.color,
    this.backgroundColor,
    super.key,
  });
  final double value;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget bar(double progress) => LinearProgressIndicator(
      value: progress,
      semanticsValue: '${(100 * value).round()}%',
      color: color,
      backgroundColor: backgroundColor,
    );
    if (MediaQuery.disableAnimationsOf(context)) return bar(value);
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value),
      duration: InkMotion.duration,
      curve: InkMotion.curve,
      builder: (_, progress, _) => bar(progress),
    );
  }
}
