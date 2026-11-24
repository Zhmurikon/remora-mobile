import '../data/api_client.dart';
import 'distractors.dart';

enum LearnKind {
  preview('Знакомство с карточкой'),
  recall('Вспомните ответ'),
  easyTerm('Выберите термин'),
  pairs('Соедините пары'),
  truth('Верна ли пара?'),
  definition('Выберите определение'),
  term('Выберите термин'),
  writeTerm('Напишите термин'),
  writeDefinition('Напишите определение');

  const LearnKind(this.title);
  final String title;
}

class LearnExercise {
  const LearnExercise(
    this.kind,
    this.source, {
    this.direction,
    this.options = const [],
    this.pairs = const [],
    this.statement,
    this.truth,
  });
  final LearnKind kind;
  final QueueItem source;
  final String? direction;
  final List<String> options;
  final List<QueueItem> pairs;
  final String? statement;
  final bool? truth;
  QueueItem get item => source.facing(direction ?? source.direction);
}

LearnExercise prepareLearnExercise({
  required List<QueueItem> items,
  required int index,
  required int turn,
  required List<String> types,
  required bool writeTerm,
  required bool writeDefinition,
  required String seed,
  LearnKind? previous,
  required Set<String> introduced,
}) {
  final source = items[index];
  final card = source.card;
  final choices = types.contains('choice');
  final recall = types.contains('recall');
  if (choices &&
      recall &&
      source.state.reps == 0 &&
      !introduced.contains(card.id) &&
      turn % 4 == 0) {
    return LearnExercise(LearnKind.preview, source);
  }
  const forward = 'term_to_def', reverse = 'def_to_term';
  final questionSeed = '$seed:${card.id}:$turn';
  bool sameLanguage(QueueItem it) =>
      it.langTerm == source.langTerm &&
      it.langDefinition == source.langDefinition;
  final others = items.where((it) => it.card.id != card.id && sameLanguage(it));
  final methods = <LearnExercise>[];
  List<String> options(bool term, bool authored) => generateOptions(
    DistractorOptions(
      correct: term ? card.term : card.definition,
      seed: questionSeed,
      alternatives: card.altAnswers,
      preferred: authored
          ? (term ? card.wrongTermAnswers : card.wrongDefinitionAnswers)
          : [],
      pool: term && authored
          ? []
          : [
              for (final it in others)
                if (normalizeOption(term ? it.card.definition : it.card.term) !=
                    normalizeOption(term ? card.definition : card.term))
                  term ? it.card.term : it.card.definition,
            ],
    ),
  );
  void choice(LearnKind kind, bool term, bool authored) {
    if (!choices || (term ? card.term : card.definition).trim().isEmpty) return;
    final values = options(term, authored);
    if (values.length >= (authored ? 2 : 3)) {
      methods.add(
        LearnExercise(
          kind,
          source,
          direction: term ? reverse : forward,
          options: values,
        ),
      );
    }
  }

  choice(LearnKind.easyTerm, true, false);
  if (choices) {
    final terms = <String>{}, defs = <String>{};
    final pairs = <QueueItem>[];
    for (final it in items.skip(index).where(sameLanguage)) {
      final t = normalizeOption(it.card.term),
          d = normalizeOption(it.card.definition);
      if (t.isEmpty || d.isEmpty || terms.contains(t) || defs.contains(d)) {
        continue;
      }
      terms.add(t);
      defs.add(d);
      pairs.add(it);
      if (pairs.length == 4) break;
    }
    if (pairs.length >= 3 && pairs.first == source) {
      methods.add(LearnExercise(LearnKind.pairs, source, pairs: pairs));
    }
  }
  if (recall) methods.add(LearnExercise(LearnKind.recall, source));
  if (writeDefinition && card.definition.trim().isNotEmpty) {
    methods.add(
      LearnExercise(LearnKind.writeDefinition, source, direction: forward),
    );
  }
  if (choices &&
      card.term.trim().isNotEmpty &&
      card.definition.trim().isNotEmpty) {
    final wrong = options(
      false,
      true,
    ).where((v) => normalizeOption(v) != normalizeOption(card.definition));
    if (wrong.isNotEmpty) {
      final positive = shuffleWithSeed([true, false], questionSeed).first;
      methods.add(
        LearnExercise(
          LearnKind.truth,
          source,
          direction: forward,
          truth: positive,
          statement: positive ? card.definition : wrong.first,
        ),
      );
    }
  }
  choice(LearnKind.definition, false, true);
  if (writeTerm && card.term.trim().isNotEmpty) {
    methods.add(LearnExercise(LearnKind.writeTerm, source, direction: reverse));
  }
  choice(LearnKind.term, true, true);
  if (methods.isEmpty) return LearnExercise(LearnKind.recall, source);
  final rotation = shuffleWithSeed(methods, seed);
  final position = turn % methods.length;
  return rotation[position].kind == previous && rotation.length > 1
      ? rotation[(position + 1) % rotation.length]
      : rotation[position];
}
