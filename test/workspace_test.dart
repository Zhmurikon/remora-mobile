import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/workspace/assistant_screen.dart';
import 'package:remora_mobile/features/workspace/billing_screen.dart';
import 'package:remora_mobile/features/workspace/classes_screen.dart';
import 'package:remora_mobile/features/workspace/collection_screens.dart';
import 'package:remora_mobile/features/workspace/workspace.dart';

void main() {
  testWidgets('кабинет содержит четыре раздела и сохранённые статьи', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WorkspaceMenu()));
    for (final name in [
      'ИИ-помощник',
      'Классы',
      'Достижения',
      'Тариф и подписка',
      'Сохранённые статьи',
    ]) {
      expect(find.text(name), findsOneWidget);
    }
    expect(find.textContaining('Практика'), findsNothing);
  });

  testWidgets('ограничение создания задачи сохраняет доступ к истории', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workspaceDocument('billing/entitlements').overrideWith(
            (_) async => {
              'limits': {'ai.sources_per_task': 0},
            },
          ),
          workspaceList('transcriptions').overrideWith(
            (_) async => [
              {
                'id': 's',
                'filename': 'лекция.txt',
                'status': 'completed',
                'result_text': 'Текст лекции',
              },
            ],
          ),
          workspaceList('assistant/tasks').overrideWith(
            (_) async => [
              {
                'id': 't',
                'source_id': 's',
                'source_ids': ['s'],
                'result': 'notes',
                'status': 'completed',
                'note_id': 'n',
              },
            ],
          ),
        ],
        child: const MaterialApp(home: AssistantScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Выбрать файлы'), findsNothing);
    await tester.tap(find.text('лекция.txt'));
    await tester.pumpAndSettle();
    expect(find.text('Открыть конспект'), findsOneWidget);
  });

  testWidgets('ученику доступны задания без управления и отчётов', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workspaceDocument('classes/c').overrideWith(
            (_) async => {
              'title': 'Группа',
              'description': '',
              'my_role': 'student',
              'members': [],
              'is_read_only': false,
              'can_create_assignments': false,
            },
          ),
          workspaceList('classes/c/sets').overrideWith((_) async => []),
          workspaceList('classes/c/assignments').overrideWith(
            (_) async => [
              {
                'title': 'Повторение',
                'set_id': 's',
                'goal_type': 'cards_count',
                'goal_value': 5,
                'progress': {'status': 'in_progress'},
              },
            ],
          ),
        ],
        child: const MaterialApp(home: ClassScreen('c')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Повторение'), findsOneWidget);
    expect(find.text('Добавить набор'), findsNothing);
    expect(find.text('Создать задание'), findsNothing);
    expect(find.text('Отчёт по заданиям'), findsNothing);
  });

  testWidgets('ридер читает принятую версию по идентификатору сохранения', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workspaceDocument('library/accepted/article').overrideWith(
            (_) async => {
              'title': 'Снимок статьи',
              'body': 'Сохранённый текст',
              'media': [],
            },
          ),
        ],
        child: const MaterialApp(home: SavedArticleScreen('accepted')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Снимок статьи'), findsOneWidget);
    expect(
      find.textContaining('Сохранённый текст', findRichText: true),
      findsOneWidget,
    );
  });

  testWidgets('шкала достижений использует прогресс из API', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workspaceDocument('retention/achievements').overrideWith(
            (_) async => {
              'unlocked_count': 0,
              'total_count': 1,
              'items': [
                {
                  'code': 'reviews_10',
                  'category': 'Обучение',
                  'title': 'Разминка',
                  'description': 'Ответьте на 20 карточек',
                  'unlocked': false,
                  'progress': 7,
                  'target': 20,
                },
              ],
            },
          ),
        ],
        child: const MaterialApp(home: AchievementsScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Открыто 0 из 1'), findsOneWidget);
    expect(find.textContaining('7 из 20'), findsOneWidget);
  });

  test('цены и суммы платежей переводятся из копеек в рубли', () {
    expect(rubles(29900), '299 ₽');
    expect(rubles(249950), '2499,50 ₽');
  });
}
