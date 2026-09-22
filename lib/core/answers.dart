/// Нормализация и сравнение ответов для режимов «Письмо», «Тест» и «Аудирование».
///
/// Порт `packages/core/src/answers.ts`. Логика продублирована на Python
/// (`apps/api/app/core/answers.py`): клиент показывает вердикт мгновенно,
/// сервер проверяет ответы теста заново. Обе реализации сверяются одним
/// набором кейсов — `packages/core/src/answer-cases.json`.
///
/// Отдельный статус «опечатка» существует, чтобы промах по клавише не ломал
/// расписание: ошибкой это не считается, но ответ нужно ввести заново.
library;

typedef Strictness = String;
typedef AnswerVerdict = String;

const strictnessStrict = 'strict';
const strictnessModerate = 'moderate';
const strictnessLenient = 'lenient';

const verdictCorrect = 'correct';
const verdictTypo = 'typo';
const verdictIncorrect = 'incorrect';

class AnswerOptions {
  final Strictness strictness;
  final List<String> alternatives;
  final String? lang;

  const AnswerOptions({
    this.strictness = strictnessModerate,
    this.alternatives = const [],
    this.lang,
  });
}

class AnswerResult {
  final AnswerVerdict verdict;
  final String? matched;
  final num distance;

  const AnswerResult({
    required this.verdict,
    this.matched,
    required this.distance,
  });
}

/// Апострофы удаляются, остальная пунктуация заменяется пробелом:
/// «don't» → «dont», но «кошка,собака» → «кошка собака».
final _apostrophes = RegExp(r"['\u2019\u02BC`\u00B4]");
final _punctuation = RegExp(r'[.,;:!?«»„""()\[\]{}<>/\\|—–\-_…*+=~^&%$#@]');

/// Артикли отбрасываются только в начале ответа и только для не-русских языков.
const _articles = <String, List<String>>{
  'en': ['a', 'an', 'the'],
  'de': ['der', 'die', 'das', 'den', 'dem', 'des', 'ein', 'eine', 'einen', 'einem', 'einer'],
  'fr': ['le', 'la', 'les', 'un', 'une', 'des', "l'", 'du', 'de'],
  'es': ['el', 'la', 'los', 'las', 'un', 'una', 'unos', 'unas'],
  'it': ['il', 'lo', 'la', 'i', 'gli', 'le', 'un', 'uno', 'una'],
};

/// Таблицы допуска на опечатку. Совпадают с Python до единицы.
const _typoThresholds = <Strictness, List<(double, int)>>{
  strictnessStrict: [(double.infinity, 0)],
  strictnessModerate: [
    (3, 0),
    (7, 1),
    (double.infinity, 2),
  ],
  strictnessLenient: [
    (2, 0),
    (5, 1),
    (10, 2),
    (double.infinity, 3),
  ],
};

/// Карта снятия диакритики с латиницы. Кириллица не затрагивается:
/// «й» — это отдельная буква, а не «и» с кратким знаком.
const _diacriticsMap = <String, String>{
  // lowercase
  '\u00E0': 'a', '\u00E1': 'a', '\u00E2': 'a', '\u00E3': 'a', '\u00E4': 'a', '\u00E5': 'a',
  '\u0101': 'a', '\u0103': 'a', '\u0105': 'a',
  '\u00E6': 'ae',
  '\u00E7': 'c', '\u0107': 'c', '\u0109': 'c', '\u010D': 'c',
  '\u010F': 'd', '\u0111': 'd',
  '\u00E8': 'e', '\u00E9': 'e', '\u00EA': 'e', '\u00EB': 'e',
  '\u0113': 'e', '\u0115': 'e', '\u0117': 'e', '\u0119': 'e', '\u011B': 'e',
  '\u011D': 'g', '\u011F': 'g', '\u0121': 'g',
  '\u0125': 'h', '\u0127': 'h',
  '\u00EC': 'i', '\u00ED': 'i', '\u00EE': 'i', '\u00EF': 'i',
  '\u0129': 'i', '\u012B': 'i', '\u012D': 'i', '\u0131': 'i',
  '\u0135': 'j',
  '\u0137': 'k',
  '\u013A': 'l', '\u013C': 'l', '\u013E': 'l', '\u0142': 'l',
  '\u00F1': 'n', '\u0144': 'n', '\u0146': 'n', '\u0148': 'n',
  '\u00F2': 'o', '\u00F3': 'o', '\u00F4': 'o', '\u00F5': 'o', '\u00F6': 'o',
  '\u00F8': 'o', '\u014D': 'o', '\u014F': 'o', '\u0151': 'o',
  '\u0153': 'oe',
  '\u0155': 'r', '\u0159': 'r',
  '\u015B': 's', '\u015D': 's', '\u015F': 's', '\u0161': 's', '\u0219': 's',
  '\u0163': 't', '\u0165': 't', '\u0167': 't', '\u021B': 't',
  '\u00F9': 'u', '\u00FA': 'u', '\u00FB': 'u', '\u00FC': 'u',
  '\u0169': 'u', '\u016B': 'u', '\u016D': 'u', '\u016F': 'u', '\u0171': 'u', '\u0173': 'u',
  '\u0175': 'w',
  '\u00FD': 'y', '\u00FF': 'y', '\u0177': 'y',
  '\u017A': 'z', '\u017C': 'z', '\u017E': 'z',
  // uppercase
  '\u00C0': 'a', '\u00C1': 'a', '\u00C2': 'a', '\u00C3': 'a', '\u00C4': 'a', '\u00C5': 'a',
  '\u0100': 'a', '\u0102': 'a', '\u0104': 'a',
  '\u00C6': 'ae',
  '\u00C7': 'c', '\u0106': 'c', '\u0108': 'c', '\u010C': 'c',
  '\u010E': 'd', '\u0110': 'd',
  '\u00C8': 'e', '\u00C9': 'e', '\u00CA': 'e', '\u00CB': 'e',
  '\u0112': 'e', '\u0114': 'e', '\u0116': 'e', '\u0118': 'e', '\u011A': 'e',
  '\u011C': 'g', '\u011E': 'g', '\u0120': 'g',
  '\u0124': 'h', '\u0126': 'h',
  '\u00CC': 'i', '\u00CD': 'i', '\u00CE': 'i', '\u00CF': 'i',
  '\u0128': 'i', '\u012A': 'i', '\u012C': 'i',
  '\u0134': 'j',
  '\u0136': 'k',
  '\u0139': 'l', '\u013B': 'l', '\u013D': 'l', '\u0141': 'l',
  '\u00D1': 'n', '\u0143': 'n', '\u0145': 'n', '\u0147': 'n',
  '\u00D2': 'o', '\u00D3': 'o', '\u00D4': 'o', '\u00D5': 'o', '\u00D6': 'o',
  '\u00D8': 'o', '\u014C': 'o', '\u014E': 'o', '\u0150': 'o',
  '\u0152': 'oe',
  '\u0154': 'r', '\u0158': 'r',
  '\u015A': 's', '\u015C': 's', '\u015E': 's', '\u0160': 's', '\u0218': 's',
  '\u0162': 't', '\u0164': 't', '\u0166': 't', '\u021A': 't',
  '\u00D9': 'u', '\u00DA': 'u', '\u00DB': 'u', '\u00DC': 'u',
  '\u0168': 'u', '\u016A': 'u', '\u016C': 'u', '\u016E': 'u', '\u0170': 'u', '\u0172': 'u',
  '\u0174': 'w',
  '\u00DD': 'y', '\u0178': 'y', '\u0176': 'y',
  '\u0179': 'z', '\u017B': 'z', '\u017D': 'z',
};

final _diacriticsPattern = RegExp(
  '[\u00C0-\u00C5\u00C7\u00C8-\u00CB\u00CC-\u00CF'
  '\u00D1-\u00D6\u00D8\u00D9-\u00DC\u00DD'
  '\u00E0-\u00E5\u00E7\u00E8-\u00EB\u00EC-\u00EF'
  '\u00F1-\u00F6\u00F8\u00F9-\u00FC\u00FD\u00FF'
  '\u0100-\u017E\u0218-\u021B]',
);

/// Снимает диакритику только с латиницы. В кириллице «й» — это «и» с кратким,
/// и слепая свёртка приравняла бы «мой» к «мои».
String _removeDiacritics(String input) {
  return input.replaceAllMapped(_diacriticsPattern, (match) {
    return _diacriticsMap[match[0]!] ?? match[0]!;
  });
}

String _stripArticle(String value, String? lang) {
  final langKey = (lang ?? 'ru').substring(0, 2).toLowerCase();
  final articles = _articles[langKey];
  if (articles == null) return value;
  final spaceAt = value.indexOf(' ');
  if (spaceAt == -1) return value;
  final head = value.substring(0, spaceAt);
  return articles.contains(head) ? value.substring(spaceAt + 1) : value;
}

/// Допустимое расстояние, при котором ответ считается опечаткой.
int typoThreshold(int length, [Strictness strictness = strictnessModerate]) {
  for (final (maxLength, threshold) in _typoThresholds[strictness]!) {
    if (length <= maxLength) return threshold;
  }
  return 0;
}

/// Нормализация ответа: регистр, пробелы, ё→е, диакритика, пунктуация, артикли.
String normalizeAnswer(String value, [AnswerOptions? options]) {
  final opts = options ?? const AnswerOptions();
  final strictness = opts.strictness;

  var result = value.trim().toLowerCase().replaceAll('ё', 'е');

  if (strictness != strictnessStrict) {
    result = _removeDiacritics(result);
    result = result.replaceAll(_apostrophes, '').replaceAll(_punctuation, ' ');
  }

  result = result.replaceAll(RegExp(r'\s+'), ' ').trim();

  if (strictness != strictnessStrict) {
    result = _stripArticle(result, opts.lang);
  }

  return result;
}

/// Проверяет ответ: верно / опечатка / неверно.
AnswerResult checkAnswer(String typed, String expected, [AnswerOptions? options]) {
  final opts = options ?? const AnswerOptions();
  final strictness = opts.strictness;
  final candidates = [expected, ...opts.alternatives];
  final normalizedTyped = normalizeAnswer(typed, opts);

  if (normalizedTyped.isEmpty) {
    return const AnswerResult(verdict: verdictIncorrect, distance: double.infinity);
  }

  var best = const AnswerResult(verdict: verdictIncorrect, distance: double.infinity);

  for (final candidate in candidates) {
    final normalized = normalizeAnswer(candidate, opts);
    if (normalized.isEmpty) continue;

    if (normalized == normalizedTyped) {
      return AnswerResult(verdict: verdictCorrect, matched: candidate, distance: 0);
    }

    final distance = levenshtein(normalizedTyped, normalized);
    if (distance < best.distance) {
      final threshold = typoThreshold(normalized.length, strictness);
      best = AnswerResult(
        verdict: distance <= threshold ? verdictTypo : verdictIncorrect,
        matched: candidate,
        distance: distance,
      );
    }
  }

  return best;
}

/// Расстояние Левенштейна. Итеративная версия на двух строках.
int levenshtein(String left, String right) {
  if (left == right) return 0;
  if (left.isEmpty) return right.length;
  if (right.isEmpty) return left.length;

  var previous = List<int>.generate(right.length + 1, (i) => i);
  var current = List<int>.filled(right.length + 1, 0);

  for (var i = 1; i <= left.length; i++) {
    current[0] = i;
    for (var j = 1; j <= right.length; j++) {
      final substitution = previous[j - 1] + (left[i - 1] == right[j - 1] ? 0 : 1);
      current[j] = [current[j - 1] + 1, previous[j] + 1, substitution].reduce(
        (a, b) => a < b ? a : b,
      );
    }
    final tmp = previous;
    previous = current;
    current = tmp;
  }

  return previous[right.length];
}

/// Процент посимвольного совпадения после той же нормализации.
int answerSimilarity(String typed, String expected, [AnswerOptions? options]) {
  final left = normalizeAnswer(typed, options);
  final right = normalizeAnswer(expected, options);
  if (left.isEmpty || right.isEmpty) return 0;
  final longest = left.length > right.length ? left.length : right.length;
  return ((1 - levenshtein(left, right) / longest) * 100).round();
}
