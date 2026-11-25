import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

enum SpaceScene {
  spark('spark', 675),
  doubleStar('double', 900),
  comet('comet', 525),
  orbit('orbit', 775),
  nova('nova', 1000),
  perfect('perfect', 2576),
  partial('partial', 3300),
  failed('failed', 3400);

  const SpaceScene(this.asset, this.ms);
  final String asset;
  final int ms;
  bool get isFinale => index >= perfect.index;
  int get frames => (ms * 24 / 1000).ceil() + 1;
  static SpaceScene forStreak(int streak) => switch (streak) {
    >= 8 => nova,
    >= 5 => orbit,
    >= 3 => comet,
    2 => doubleStar,
    _ => spark,
  };
}

class SpaceField extends StatefulWidget {
  const SpaceField({super.key, required this.child});
  final Widget child;
  @override
  State<SpaceField> createState() => SpaceFieldState();
}

class SpaceFieldState extends State<SpaceField> {
  SpaceScene? _scene;
  int _play = 0;
  bool _visible = false;
  Completer<void>? _finished;
  void _finish() {
    final current = _finished;
    if (current != null && !current.isCompleted) current.complete();
  }

  @override
  void dispose() {
    _finish();
    super.dispose();
  }

  Future<void> reward(int streak) async {
    _finish();
    final completion = _finished = Completer<void>();
    final scene = SpaceScene.forStreak(streak);
    setState(() {
      _scene = scene;
      _play++;
      _visible = true;
    });
    final reduced = MediaQuery.disableAnimationsOf(context);
    await Future.wait([
      completion.future,
      Future<void>.delayed(Duration(milliseconds: reduced ? 450 : 600)),
    ]);
  }

  void fade() {
    if (!_visible) return;
    final reduced = MediaQuery.disableAnimationsOf(context);
    setState(() {
      _visible = false;
      if (reduced) _scene = null;
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      if (_scene case final scene?)
        IgnorePointer(
          child: ExcludeSemantics(
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: _visible || MediaQuery.disableAnimationsOf(context)
                  ? Duration.zero
                  : const Duration(milliseconds: 320),
              onEnd: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && !_visible) setState(() => _scene = null);
                });
              },
              child: SpaceSprite(
                key: ValueKey(_play),
                scene: scene,
                onFinished: _finish,
              ),
            ),
          ),
        ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: SizedBox.expand(child: widget.child),
        ),
      ),
    ],
  );
}

// Кадры взяты из тех же пиксельных сцен, что на сайте. Android рисует их без WebView и сети.
class SpaceSprite extends StatefulWidget {
  const SpaceSprite({super.key, required this.scene, this.onFinished});
  final VoidCallback? onFinished;
  final SpaceScene scene;
  @override
  State<SpaceSprite> createState() => _SpaceSpriteState();
}

class _SpaceSpriteState extends State<SpaceSprite>
    with SingleTickerProviderStateMixin {
  late final _time = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: widget.scene.ms),
  );
  ImageStream? _stream;
  ImageInfo? _image;
  late final _listener = ImageStreamListener(
    _loaded,
    onError: (Object error, StackTrace? stack) {
      widget.onFinished?.call();
      FlutterError.reportError(
        FlutterErrorDetails(exception: error, stack: stack),
      );
    },
  );
  bool _reduced = false;

  void _loaded(ImageInfo info, bool sync) {
    _image?.dispose();
    if (!mounted) {
      info.dispose();
      return;
    }
    setState(() => _image = info);
    if (_reduced) {
      widget.onFinished?.call();
    } else {
      _time.forward(from: 0).then((_) {
        if (mounted) widget.onFinished?.call();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced = MediaQuery.disableAnimationsOf(context);
    if (_reduced) {
      _time.value = 1;
      if (_image != null) widget.onFinished?.call();
    }
    final stream = AssetImage(
      'assets/rewards/${widget.scene.asset}.png',
    ).resolve(createLocalImageConfiguration(context));
    if (stream.key != _stream?.key) {
      _stream?.removeListener(_listener);
      _stream = stream..addListener(_listener);
    }
  }

  @override
  void dispose() {
    _stream?.removeListener(_listener);
    _image?.dispose();
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: CustomPaint(
      painter: _Frames(widget.scene, _image?.image, _time),
      size: Size.infinite,
    ),
  );
}

class _Frames extends CustomPainter {
  _Frames(this.scene, this.sheet, this.time) : super(repaint: time);
  final SpaceScene scene;
  final ui.Image? sheet;
  final Animation<double> time;
  @override
  void paint(Canvas canvas, Size size) {
    final image = sheet;
    if (image == null || size.isEmpty) return;
    final frame = (time.value * (scene.frames - 1)).round();
    final w = image.width / 8, h = image.height / (scene.frames / 8).ceil();
    final src = Rect.fromLTWH(frame % 8 * w, frame ~/ 8 * h, w, h);
    final paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false;
    if (scene.isFinale) {
      final fit = applyBoxFit(BoxFit.contain, src.size, size);
      canvas.drawImageRect(
        image,
        src,
        Alignment.center.inscribe(fit.destination, Offset.zero & size),
        paint,
      );
    } else {
      // При повороте устройства обе группы остаются у краёв рабочей области.
      final scale = math.min(size.width / w, size.height / h);
      final half = Size(w * scale / 2, h * scale);
      // На высоком телефоне звезда и её орбита остаются одним рисунком.
      final top = (size.height - half.height) * .3;
      for (final side in [0, 1]) {
        final source = Rect.fromLTWH(
          src.left + side * w / 2,
          src.top,
          w / 2,
          h,
        );
        final origin = Offset(side * (size.width - half.width), top);
        canvas.drawImageRect(image, source, origin & half, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_Frames old) =>
      old.sheet != sheet || old.scene != scene || old.time != time;
}
