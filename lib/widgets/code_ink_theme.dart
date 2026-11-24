import 'package:flutter/material.dart';

import '../app/theme.dart';

/// Одинаковая подсветка примеров в статье, конспекте и на стороне карточки.
Map<String, TextStyle> codeInkTheme(bool dark) => dark ? _dark : _light;

final _light = _styles(
  ink: RemoraColors.lightFg,
  paper: RemoraColors.lightSurfaceMuted,
  muted: RemoraColors.lightFgMuted,
  blue: RemoraColors.lightPrimary,
  green: RemoraColors.lightSuccess,
  ochre: RemoraColors.lightWarning,
);
final _dark = _styles(
  ink: RemoraColors.darkFg,
  paper: RemoraColors.darkSurfaceMuted,
  muted: RemoraColors.darkFgMuted,
  blue: RemoraColors.darkPrimary,
  green: RemoraColors.darkSuccess,
  ochre: RemoraColors.darkWarning,
);

Map<String, TextStyle> _styles({
  required Color ink,
  required Color paper,
  required Color muted,
  required Color blue,
  required Color green,
  required Color ochre,
}) => {
  'root': TextStyle(color: ink, backgroundColor: paper),
  for (final key in ['comment', 'meta']) key: TextStyle(color: muted),
  for (final key in [
    'keyword',
    'built_in',
    'type',
    'operator',
    'function',
    'class',
    'title',
    'attribute',
  ])
    key: TextStyle(color: blue),
  for (final key in ['string', 'regexp']) key: TextStyle(color: green),
  for (final key in ['number', 'symbol', 'literal'])
    key: TextStyle(color: ochre),
  for (final key in ['params', 'punctuation', 'variable'])
    key: TextStyle(color: ink),
};
