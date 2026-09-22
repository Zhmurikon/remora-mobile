import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/core/answers.dart';

void main() {
  final casesFile = File('../../packages/core/src/answer-cases.json');
  final casesJson = jsonDecode(casesFile.readAsStringSync()) as Map<String, dynamic>;
  final cases = (casesJson['cases'] as List).cast<Map<String, dynamic>>();

  group('контракт нормализатора ответов', () {
    for (final item in cases) {
      test(item['name'] as String, () {
        final result = checkAnswer(
          item['typed'] as String,
          item['expected'] as String,
          AnswerOptions(
            strictness: (item['strictness'] as String?) ?? strictnessModerate,
            alternatives: (item['alternatives'] as List<dynamic>?)
                    ?.map((e) => e as String)
                    .toList() ??
                [],
            lang: item['lang'] as String?,
          ),
        );
        expect(result.verdict, item['verdict']);
        if (item.containsKey('matched')) {
          expect(result.matched, item['matched']);
        }
      });
    }

    test('покрывает не меньше 60 кейсов', () {
      expect(cases.length, greaterThanOrEqualTo(60));
    });
  });

  group('normalizeAnswer', () {
    test('приводит регистр, пробелы и ё во всех режимах', () {
      for (final strictness in [strictnessStrict, strictnessModerate, strictnessLenient]) {
        expect(
          normalizeAnswer('  Ёлка\n\tЗелёная ', AnswerOptions(strictness: strictness)),
          'елка зеленая',
        );
      }
    });

    test('сохраняет пунктуацию и диакритику в строгом режиме', () {
      expect(
        normalizeAnswer('café, s\u2019il vous pla\u00EEt', const AnswerOptions(strictness: strictnessStrict)),
        'caf\u00E9, s\u2019il vous pla\u00EEt',
      );
    });

    test('снимает диакритику только с латиницы', () {
      expect(normalizeAnswer('café'), 'cafe');
      expect(normalizeAnswer('мой'), 'мой');
      expect(normalizeAnswer('тайный'), 'тайный');
    });
  });

  group('levenshtein', () {
    const pairs = <(String, String, int)>[
      ('', '', 0),
      ('кошка', 'кошка', 0),
      ('кошка', 'кошки', 1),
      ('кот', '', 3),
      ('', 'кот', 3),
      ('recieve', 'receive', 2),
      ('abc', 'cba', 2),
    ];

    for (final (left, right, expected) in pairs) {
      test('$left → $right = $expected', () {
        expect(levenshtein(left, right), expected);
        expect(levenshtein(right, left), expected);
      });
    }
  });

  group('typoThreshold', () {
    test('строгий режим не прощает ничего', () {
      expect(typoThreshold(3, strictnessStrict), 0);
      expect(typoThreshold(50, strictnessStrict), 0);
    });

    test('растёт с длиной ответа', () {
      expect(typoThreshold(3), 0);
      expect(typoThreshold(7), 1);
      expect(typoThreshold(20), 2);
      expect(typoThreshold(20, strictnessLenient), 3);
    });
  });

  group('answerSimilarity', () {
    test('возвращает понятный процент после нормализации', () {
      expect(answerSimilarity('  Ёлка ', 'елка'), 100);
      expect(answerSimilarity('кот', 'кит'), 67);
      expect(answerSimilarity('', 'кот'), 0);
    });
  });
}
