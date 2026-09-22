/// Варианты ответов для вопросов с выбором в режиме «Заучивание».
///
/// Порт `packages/core/src/distractors.ts`. Дистракторы берём из того же набора:
/// «выбери перевод» с вариантами из другой темы решается по одному взгляду.
/// Порядок вариантов детерминирован по `seed`: при каждом ре-рендере карточки
/// правильный ответ остаётся на том же месте.
library;

const defaultOptionCount = 4;

class DistractorOptions {
  final String correct;
  final List<String> pool;
  final List<String> preferred;
  final List<String> alternatives;
  final int count;
  final String seed;

  const DistractorOptions({
    required this.correct,
    required this.pool,
    this.preferred = const [],
    this.alternatives = const [],
    this.count = defaultOptionCount,
    required this.seed,
  });
}

/// Генерирует варианты ответов, включая правильный.
List<String> generateOptions(DistractorOptions opts) {
  final normalizedCorrect = _normalize(opts.correct);
  final seen = <String>{normalizedCorrect, ...opts.alternatives.map(_normalize)};

  final authored = _shuffle(
    opts.preferred.where((candidate) {
      final key = _normalize(candidate);
      if (key.isEmpty || seen.contains(key)) return false;
      seen.add(key);
      return true;
    }).toList(),
    _createRandom('${opts.seed}:preferred'),
  ).take((opts.count - 1).clamp(0, 999)).toList();

  final candidates = <String>[];
  for (final candidate in opts.pool) {
    final key = _normalize(candidate);
    if (key.isEmpty || seen.contains(key)) continue;
    seen.add(key);
    candidates.add(candidate);
  }

  final random = _createRandom(opts.seed);
  final ranked = candidates
      .asMap()
      .entries
      .map((entry) {
        final candidate = entry.value;
        final index = entry.key;
        return _Ranked(
          candidate: candidate,
          score: similarity(opts.correct, candidate) + random() * 0.15,
          index: index,
        );
      })
      .toList()
    ..sort((a, b) {
      final cmp = b.score.compareTo(a.score);
      return cmp != 0 ? cmp : a.index.compareTo(b.index);
    });

  final remaining = (opts.count - 1 - authored.length).clamp(0, 999);
  final options = [
    opts.correct,
    ...authored,
    ...ranked.take(remaining).map((r) => r.candidate),
  ];

  return _shuffle(options, _createRandom('${opts.seed}:order'));
}

/// Достаточно ли материала в наборе, чтобы спрашивать выбором.
bool canAskMultipleChoice(List<String> pool, [int count = defaultOptionCount]) {
  final unique = pool.map(_normalize).where((v) => v.isNotEmpty).toSet();
  return unique.length >= count - 1;
}

/// Грубая мера похожести двух ответов: 0 — ничего общего, 1 — почти одно и то же.
double similarity(String left, String right) {
  final first = _normalize(left);
  final second = _normalize(right);
  if (first.isEmpty || second.isEmpty) return 0;

  final maxLen = first.length > second.length ? first.length : second.length;
  final lengthScore = 1 - (first.length - second.length).abs() / maxLen;

  var prefix = 0;
  final minLen = first.length < second.length ? first.length : second.length;
  while (prefix < minLen && first[prefix] == second[prefix]) {
    prefix++;
  }
  final prefixScore = prefix / minLen;

  final firstWords = first.split(RegExp(r'\s+')).toSet();
  final secondWords = second.split(RegExp(r'\s+'));
  final shared = secondWords.where((w) => firstWords.contains(w)).length;
  final maxWordCount = firstWords.length > secondWords.length ? firstWords.length : secondWords.length;
  final wordScore = shared / maxWordCount;

  return lengthScore * 0.4 + prefixScore * 0.35 + wordScore * 0.25;
}

String _normalize(String value) {
  return value.trim().toLowerCase().replaceAll('ё', 'е').replaceAll(RegExp(r'\s+'), ' ');
}

/// Нормализация для внешнего использования (совпадает с `normalizeOption` в TS).
String normalizeOption(String value) => _normalize(value);

class _Ranked {
  final String candidate;
  final double score;
  final int index;
  _Ranked({required this.candidate, required this.score, required this.index});
}

List<T> _shuffle<T>(List<T> items, double Function() random) {
  final result = List<T>.of(items);
  for (var i = result.length - 1; i > 0; i--) {
    final j = (random() * (i + 1)).floor();
    final tmp = result[i];
    result[i] = result[j];
    result[j] = tmp;
  }
  return result;
}

/// Воспроизводимый генератор: один seed → одна последовательность.
/// FNV-1a хеш + xorshift32. Совпадает с TS-версией побитно.
double Function() _createRandom(String seed) {
  var state = 2166136261;
  for (var i = 0; i < seed.length; i++) {
    state ^= seed.codeUnitAt(i);
    state = ((state & 0xFFFF) * 16777619 + ((state >> 16) & 0xFFFF) * 16777619 * 65536) & 0xFFFFFFFF;
    if (state >= 0x80000000) state -= 0x100000000;
  }
  return () {
    state = (state ^ ((state << 13) & 0xFFFFFFFF)) & 0xFFFFFFFF;
    state = state ^ ((state >> 17) & 0xFFFFFFFF);
    state = (state ^ ((state << 5) & 0xFFFFFFFF)) & 0xFFFFFFFF;
    final unsigned = state < 0 ? state + 0x100000000 : state;
    return (unsigned % 1000000) / 1000000;
  };
}
