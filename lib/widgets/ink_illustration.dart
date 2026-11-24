import 'package:flutter/material.dart';

import '../app/theme.dart';

enum InkDrawing {
  books,
  cards,
  notebook,
  folder,
  calendar,
  drawer,
  write,
  choice,
  match,
}

/// Штриховка хранится в альфа-канале, поэтому рисунок ложится прямо на бумагу обеих тем.
class InkIllustration extends StatelessWidget {
  const InkIllustration(
    this.drawing, {
    required this.width,
    required this.height,
    super.key,
  });

  final InkDrawing drawing;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/illustrations/ink-${drawing.name}.webp',
    width: width,
    height: height,
    fit: BoxFit.contain,
    color: Theme.of(context).brightness == Brightness.dark
        ? RemoraColors.darkBrandInk
        : null,
    excludeFromSemantics: true,
    filterQuality: FilterQuality.high,
  );
}
