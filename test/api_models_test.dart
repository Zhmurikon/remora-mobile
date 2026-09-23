import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';

/// Контрактные тесты разбора JSON учебных моделей.
///
/// Ловят рассогласование клиента с серверными схемами `CardStateOut`,
/// `ReviewBatchResult`, `TestConfig`, `TestAttemptOut` (app/schemas/study.py,
/// app/schemas/test_mode.py). Именно здесь клиент раньше расходился с сервером:
/// в `CardStateOut` есть `card_id`/`direction` (нужны outbox для upsert
/// локальных состояний), а поля `step` сервер не отдаёт.
void main() {
  group('CardStateData.fromJson', () {
    test('разбирает card_id и direction — их ждёт синхронизация outbox', () {
      final state = CardStateData.fromJson({
        'card_id': '11111111-1111-1111-1111-111111111111',
        'direction': 'term_to_def',
        'state': 'review',
        'stability': 12.5,
        'difficulty': 4.2,
        'due_at': '2026-01-10T08:00:00Z',
        'last_reviewed_at': '2026-01-01T08:00:00Z',
        'reps': 3,
        'lapses': 1,
        'suspended_at': null,
      });

      expect(state.cardId, '11111111-1111-1111-1111-111111111111');
      expect(state.direction, 'term_to_def');
      expect(state.state, 'review');
      expect(state.stability, 12.5);
      expect(state.difficulty, 4.2);
      expect(state.dueAt, DateTime.parse('2026-01-10T08:00:00Z'));
      expect(state.lastReviewedAt, DateTime.parse('2026-01-01T08:00:00Z'));
      expect(state.reps, 3);
      expect(state.lapses, 1);
      expect(state.suspendedAt, isNull);
    });

    test('переносит nullable-поля без падения', () {
      final state = CardStateData.fromJson({
        'card_id': '22222222-2222-2222-2222-222222222222',
        'direction': 'def_to_term',
        'state': 'new',
        'stability': null,
        'difficulty': null,
        'due_at': '2026-02-01T00:00:00Z',
        'last_reviewed_at': null,
        'reps': 0,
        'lapses': 0,
      });

      expect(state.direction, 'def_to_term');
      expect(state.stability, isNull);
      expect(state.difficulty, isNull);
      expect(state.lastReviewedAt, isNull);
      expect(state.reps, 0);
    });
  });

  group('ReviewBatchResult.fromJson', () {
    test('разбирает accepted/duplicates/rejected и состояния карточек', () {
      final result = ReviewBatchResult.fromJson({
        'accepted': ['a1', 'a2'],
        'duplicates': ['d1'],
        'rejected': <String>[],
        'states': [
          {
            'card_id': '33333333-3333-3333-3333-333333333333',
            'direction': 'term_to_def',
            'state': 'learning',
            'stability': 1.0,
            'difficulty': 5.0,
            'due_at': '2026-01-02T00:00:00Z',
            'last_reviewed_at': null,
            'reps': 1,
            'lapses': 0,
          },
        ],
      });

      expect(result.accepted, ['a1', 'a2']);
      expect(result.duplicates, ['d1']);
      expect(result.rejected, isEmpty);
      expect(result.states, hasLength(1));
      // Именно card_id + direction связывают серверное состояние с локальной строкой.
      expect(
        result.states.first.cardId,
        '33333333-3333-3333-3333-333333333333',
      );
      expect(result.states.first.direction, 'term_to_def');
      expect(result.states.first.state, 'learning');
    });
  });

  group('TestConfig', () {
    test('fromJson читает поля серверной схемы', () {
      final config = TestConfig.fromJson({
        'question_count': 30,
        'kinds': ['choice', 'matching'],
        'direction': 'both',
        'source': 'hard',
        'write_to_schedule': false,
      });

      expect(config.questionCount, 30);
      expect(config.kinds, ['choice', 'matching']);
      expect(config.direction, 'both');
      expect(config.source, 'hard');
      expect(config.writeToSchedule, false);
    });

    test('fromJson подставляет значения по умолчанию для пустого объекта', () {
      final config = TestConfig.fromJson({});

      expect(config.questionCount, 20);
      expect(config.kinds, ['choice', 'true_false', 'typing']);
      expect(config.direction, 'term_to_def');
      expect(config.source, 'all');
      expect(config.writeToSchedule, true);
    });

    test('toJson/fromJson дают одинаковую конфигурацию', () {
      final original = TestConfig(
        questionCount: 15,
        kinds: const ['typing'],
        direction: 'def_to_term',
        source: 'new',
        writeToSchedule: false,
      );

      final restored = TestConfig.fromJson(original.toJson());

      expect(restored.questionCount, original.questionCount);
      expect(restored.kinds, original.kinds);
      expect(restored.direction, original.direction);
      expect(restored.source, original.source);
      expect(restored.writeToSchedule, original.writeToSchedule);
    });
  });

  group('CourseDetailData.fromJson', () {
    test('разбирает структуру, автора, статьи и media', () {
      final course = CourseDetailData.fromJson({
        'id': '77777777-7777-7777-7777-777777777777',
        'slug': 'biologiya',
        'title': 'Биология',
        'description': 'Клетки',
        'updated_at': '2026-03-01T12:00:00Z',
        'is_published': true,
        'tags': ['школа'],
        'author': {
          'id': '88888888-8888-8888-8888-888888888888',
          'username': 'ivan',
          'display_name': 'Иван',
          'avatar_url': null,
        },
        'sections': [
          {
            'id': 's1',
            'title': 'Раздел 1',
            'position': 0,
            'articles': [
              {
                'id': 'a1',
                'set_id': '99999999-9999-9999-9999-999999999999',
                'title': 'Клетка',
                'body': '# Клетка\n\nТеория.',
                'position': 0,
                'media': [
                  {
                    'id': 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
                    'url': 'https://cdn/x.png',
                    'width': 800,
                    'height': 600,
                  },
                ],
              },
            ],
          },
        ],
      });

      expect(course.title, 'Биология');
      expect(course.author.name, 'Иван');
      expect(course.sections, hasLength(1));
      final article = course.sections.first.articles.first;
      expect(article.setId, '99999999-9999-9999-9999-999999999999');
      expect(article.body, contains('Теория'));
      expect(article.media.first.url, 'https://cdn/x.png');
    });

    test('author.name откатывается на username без display_name', () {
      final author = CourseAuthorData.fromJson({
        'id': 'x',
        'username': 'petya',
        'display_name': null,
        'avatar_url': null,
      });
      expect(author.name, 'petya');
    });
  });

  group('TestAttemptOut.fromJson', () {
    test('разбирает попытку вместе с вложенным config через TestConfig', () {
      final attempt = TestAttemptOut.fromJson({
        'id': '44444444-4444-4444-4444-444444444444',
        'set_id': '55555555-5555-5555-5555-555555555555',
        'set_title': 'Биология',
        'config': {
          'question_count': 10,
          'kinds': ['choice'],
          'direction': 'term_to_def',
          'source': 'all',
          'write_to_schedule': true,
        },
        'questions': [
          {
            'id': 'q1',
            'kind': 'choice',
            'card_id': '66666666-6666-6666-6666-666666666666',
            'direction': 'term_to_def',
            'prompt': 'Столица Франции?',
            'content_type': 'text',
            'options': ['Париж', 'Берлин', 'Мадрид', 'Рим'],
          },
        ],
        'created_at': '2026-03-01T12:00:00Z',
        'finished_at': null,
        'score': null,
        'correct_count': 0,
        'retake_of_id': null,
      });

      expect(attempt.id, '44444444-4444-4444-4444-444444444444');
      expect(attempt.setTitle, 'Биология');
      expect(attempt.config.questionCount, 10);
      expect(attempt.config.kinds, ['choice']);
      expect(attempt.questions, hasLength(1));
      expect(attempt.questions.first.kind, 'choice');
      expect(attempt.questions.first.options, hasLength(4));
      expect(attempt.finishedAt, isNull);
      expect(attempt.correctCount, 0);
    });
  });
}
