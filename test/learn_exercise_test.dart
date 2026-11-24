import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/core/learn_exercise.dart';
import 'package:remora_mobile/data/api_client.dart';

void main() {
  final fixture = jsonDecode(
    File('../../packages/core/src/learn-round-cases.json').readAsStringSync(),
  );
  final items = [for (final row in fixture['items']) QueueItem.fromJson(row)];
  test('совпадает с вебом по типу, направлению, вариантам и порядку пар', () {
    LearnKind? previous;
    for (var turn = 0; turn < fixture['rounds'].length; turn++) {
      final ex = prepareLearnExercise(
        items: items,
        index: 0,
        turn: turn,
        types: ['recall', 'choice'],
        writeTerm: true,
        writeDefinition: true,
        seed: fixture['seed'],
        previous: previous,
        introduced: {'0'},
      );
      expect({
        'kind': ex.kind.name,
        'direction': ex.item.direction,
        if (ex.options.isNotEmpty) 'options': ex.options,
        if (ex.pairs.isNotEmpty)
          'pairs': [for (final it in ex.pairs) it.card.id],
        if (ex.statement != null) 'statement': ex.statement,
        if (ex.truth != null) 'truth': ex.truth,
      }, fixture['rounds'][turn]);
      previous = ex.kind;
    }
  });
  test('просмотр новой карточки и ограниченный набор без письма', () {
    final kinds = [
      for (var turn = 0; turn < 16; turn++)
        prepareLearnExercise(
          items: items.take(2).toList(),
          index: 0,
          turn: turn,
          types: ['choice', 'recall'],
          writeTerm: false,
          writeDefinition: false,
          seed: 'small',
          introduced: turn == 0 ? {} : {'0'},
        ).kind,
    ];
    expect(kinds.first, LearnKind.preview);
    expect(kinds.skip(1), isNot(contains(LearnKind.preview)));
    for (final k in [
      LearnKind.pairs,
      LearnKind.writeTerm,
      LearnKind.writeDefinition,
    ]) {
      expect(kinds, isNot(contains(k)));
    }
  });
}
