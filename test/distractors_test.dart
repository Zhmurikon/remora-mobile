import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/core/distractors.dart';

const _pool = [
  'собака', 'кошка', 'лошадь', 'корова', 'овца',
  'коза', 'курица', 'утка', 'гусь', 'индейка',
];

void main() {
  group('generateOptions', () {
    test('предпочитает авторские варианты, дополняет и исключает синонимы', () {
      for (var count = 0; count <= 6; count++) {
        final preferred = List.generate(count, (i) => 'авторский-$i');
        final options = generateOptions(DistractorOptions(
          correct: 'ответ',
          pool: ['a', 'b', 'c', 'синоним'],
          preferred: preferred,
          alternatives: ['синоним'],
          seed: 'authored',
        ));
        expect(options, hasLength(4));
        expect(options, contains('ответ'));
        expect(options, isNot(contains('синоним')));
        expect(
          options.where((o) => preferred.contains(o)).length,
          count < 3 ? count : 3,
        );
      }
    });

    test('перемешивает авторские варианты воспроизводимо, без дублей', () {
      final params = DistractorOptions(
        correct: 'ёж',
        preferred: ['ЕЖ', 'один', 'ОДИН', '', 'два', 'три', 'четыре', 'пять'],
        pool: ['один'],
        seed: 'first',
      );
      expect(generateOptions(params), generateOptions(params));
      expect(generateOptions(params).toSet().length, 4);

      final results = <String>{};
      for (var i = 0; i < 10; i++) {
        results.add(
          generateOptions(DistractorOptions(
            correct: params.correct,
            preferred: params.preferred,
            pool: params.pool,
            seed: '$i',
          )).join('|'),
        );
      }
      expect(results.length, greaterThan(1));
    });

    test('всегда содержит правильный ответ', () {
      final options = generateOptions(DistractorOptions(
        correct: 'кролик', pool: _pool, seed: 'card-1',
      ));
      expect(options, contains('кролик'));
      expect(options, hasLength(4));
    });

    test('не повторяет варианты', () {
      final options = generateOptions(DistractorOptions(
        correct: 'кошка',
        pool: ['Кошка', 'кошка ', 'кот', 'котёнок', 'котенок', 'пёс'],
        seed: 'card-2',
      ));
      final normalized = options
          .map((o) => o.trim().toLowerCase().replaceAll('ё', 'е'))
          .toList();
      expect(normalized.toSet().length, normalized.length);
    });

    test('не подмешивает вариант, равный правильному ответу', () {
      final options = generateOptions(DistractorOptions(
        correct: 'кот',
        pool: ['Кот', 'КОТ', 'кот', 'пёс', 'мышь', 'ёж'],
        seed: 'card-3',
      ));
      expect(
        options.where((o) => o.toLowerCase() == 'кот').length,
        1,
      );
    });

    test('держит порядок стабильным при одинаковом seed', () {
      final first = generateOptions(DistractorOptions(
        correct: 'кролик', pool: _pool, seed: 'card-4',
      ));
      final second = generateOptions(DistractorOptions(
        correct: 'кролик', pool: _pool, seed: 'card-4',
      ));
      expect(second, first);
    });

    test('даёт разный порядок для разных карточек', () {
      final results = ['a', 'b', 'c', 'd', 'e']
          .map((seed) =>
              generateOptions(DistractorOptions(
                correct: 'кролик', pool: _pool, seed: seed,
              )).join('|'))
          .toSet();
      expect(results.length, greaterThan(1));
    });

    test('не падает на бедном наборе', () {
      expect(
        generateOptions(DistractorOptions(correct: 'один', pool: [], seed: 'card-5')),
        ['один'],
      );
      expect(
        generateOptions(DistractorOptions(correct: 'один', pool: ['два'], seed: 'card-6')),
        hasLength(2),
      );
    });

    test('уважает запрошенное число вариантов', () {
      expect(
        generateOptions(DistractorOptions(correct: 'кролик', pool: _pool, count: 6, seed: 's')),
        hasLength(6),
      );
      expect(
        generateOptions(DistractorOptions(correct: 'кролик', pool: _pool, count: 2, seed: 's')),
        hasLength(2),
      );
    });

    test('предпочитает похожие варианты случайным', () {
      final options = generateOptions(DistractorOptions(
        correct: 'существительное',
        pool: ['прилагательное', 'числительное', 'местоимение', 'до', 'и', 'на', 'от', 'за', 'по'],
        seed: 'grammar',
      ));
      final short = options.where((o) => o.length <= 2);
      expect(short, isEmpty);
    });
  });

  group('canAskMultipleChoice', () {
    test('требует достаточно уникальных ответов', () {
      expect(canAskMultipleChoice(_pool), true);
      expect(canAskMultipleChoice(['один', 'два']), false);
      expect(canAskMultipleChoice(['один', 'ОДИН', 'один ']), false);
      expect(canAskMultipleChoice(['один', 'два'], 3), true);
    });
  });

  group('similarity', () {
    test('одинаковые строки — максимально похожи', () {
      expect(similarity('кошка', 'кошка'), closeTo(1, 1e-5));
      expect(similarity('Кошка ', 'кошка'), closeTo(1, 1e-5));
    });

    test('близкие слова выше далёких', () {
      expect(
        similarity('кошка', 'кошки'),
        greaterThan(similarity('кошка', 'бегемот')),
      );
    });

    test('переживает пустые строки', () {
      expect(similarity('', 'кошка'), 0);
      expect(similarity('  ', ''), 0);
    });
  });
}
