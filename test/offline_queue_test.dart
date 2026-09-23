import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/core/domain.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';

/// Офлайн-старт сессии обучения — DoD M5 «набор проходится офлайн».
/// Очередь строится из скачанного набора без обращения к сети.
void main() {
  late AppDatabase db;
  late StudyRepository repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = StudyRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  Future<void> insertCard(String setId, String cardId, int position) async {
    await db.cards.insertOnConflictUpdate(CardsCompanion(
      id: Value(cardId),
      setId: Value(setId),
      position: Value(position),
      term: Value('term-$cardId'),
      definition: Value('def-$cardId'),
    ));
  }

  Future<void> seedSet(String setId, {required int cardCount}) async {
    await db.sets.insertOnConflictUpdate(SetsCompanion(
      id: Value(setId),
      title: Value('Набор $setId'),
      visibility: const Value('private'),
      slug: Value(setId),
      cardsCount: Value(cardCount),
      langTerm: const Value('en'),
      langDefinition: const Value('ru'),
      createdAt: Value(DateTime(2026, 1, 1)),
      updatedAt: Value(DateTime(2026, 1, 1)),
    ));
    for (var i = 0; i < cardCount; i++) {
      await insertCard(setId, '$setId-c$i', i);
    }
  }

  StudyQueue fakeQueue({
    String answerStrictness = 'moderate',
    int matchPercent = 90,
    List<String> questionTypes = const ['choice', 'typing', 'recall'],
  }) {
    return StudyQueue(
      setId: 's1',
      setTitle: 'x',
      langTerm: 'en',
      langDefinition: 'ru',
      answerStrictness: answerStrictness,
      learnQuestionTypes: questionTypes,
      learnMatchPercent: matchPercent,
      mode: 'learn',
      schedulerVersion: 'fsrs6-v1',
      items: const [],
      dueTotal: 0,
      newTotal: 0,
      newLeftToday: 0,
      reviewsLeftToday: 0,
    );
  }

  test('набор не скачан — очередь null', () async {
    expect(await repo.buildOfflineQueue('missing', mode: 'learn'), isNull);
  });

  test('свежий набор — все карточки новые, с четырьмя превью', () async {
    await seedSet('s1', cardCount: 5);

    final q = await repo.buildOfflineQueue('s1', mode: 'flashcards');

    expect(q, isNotNull);
    expect(q!.items.length, 5);
    expect(q.newTotal, 5);
    expect(q.dueTotal, 0);
    expect(q.setTitle, 'Набор s1');
    expect(q.langTerm, 'en');
    for (final it in q.items) {
      expect(it.state.state, cardStateNew);
      expect(it.previews.map((p) => p.rating).toList(), [1, 2, 3, 4]);
    }
  });

  test('лимит ограничивает размер очереди', () async {
    await seedSet('s1', cardCount: 30);
    final q = await repo.buildOfflineQueue('s1', mode: 'learn', limit: 10);
    expect(q!.items.length, 10);
  });

  test('просроченная карточка входит, будущая — нет', () async {
    await seedSet('s1', cardCount: 0);
    await insertCard('s1', 'c-past', 0);
    await insertCard('s1', 'c-future', 1);
    final now = DateTime.now().toUtc();
    await db.cardStates.insertOnConflictUpdate(CardStatesCompanion(
      cardId: const Value('c-past'),
      direction: const Value('term_to_def'),
      state: const Value('review'),
      stability: const Value(5),
      difficulty: const Value(5),
      dueAt: Value(now.subtract(const Duration(days: 1))),
      lastReviewedAt: Value(now.subtract(const Duration(days: 6))),
    ));
    await db.cardStates.insertOnConflictUpdate(CardStatesCompanion(
      cardId: const Value('c-future'),
      direction: const Value('term_to_def'),
      state: const Value('review'),
      stability: const Value(50),
      difficulty: const Value(5),
      dueAt: Value(now.add(const Duration(days: 10))),
      lastReviewedAt: Value(now.subtract(const Duration(days: 1))),
    ));

    final q = await repo.buildOfflineQueue('s1', mode: 'flashcards');
    final ids = q!.items.map((it) => it.card.id).toList();

    expect(ids, contains('c-past'));
    expect(ids, isNot(contains('c-future')));
    expect(q.dueTotal, 1);
    expect(q.newTotal, 0);
  });

  test('настройки берутся из кэша SyncMeta', () async {
    await seedSet('s1', cardCount: 1);
    await repo.saveStudySettings(
      's1',
      fakeQueue(answerStrictness: 'strict', matchPercent: 80),
    );

    final q = await repo.buildOfflineQueue('s1', mode: 'learn');

    expect(q!.answerStrictness, 'strict');
    expect(q.learnMatchPercent, 80);
  });

  test('без кэша настроек — разумные значения по умолчанию', () async {
    await seedSet('s1', cardCount: 1);
    final q = await repo.buildOfflineQueue('s1', mode: 'learn');
    expect(q!.answerStrictness, 'moderate');
    expect(q.learnTypingCheck, 'automatic');
    expect(q.learnMatchPercent, 90);
  });

  test('applyLocalReview: новая карточка получает состояние и будущий срок', () async {
    await seedSet('s1', cardCount: 1);
    const cardId = 's1-c0';
    expect(await repo.getCardState(cardId, 'term_to_def'), isNull);

    final now = DateTime.now().toUtc();
    await repo.applyLocalReview(
      cardId: cardId,
      direction: 'term_to_def',
      rating: ratingGood,
      reviewedAt: now,
    );

    final after = await repo.getCardState(cardId, 'term_to_def');
    expect(after, isNotNull);
    expect(after!.state, isNot(cardStateNew));
    expect(after.dueAt.toUtc().isAfter(now), isTrue);
    expect(after.lastReviewedAt, isNotNull);
  });

  test('отвеченная офлайн карточка уходит из следующей очереди', () async {
    await seedSet('s1', cardCount: 1);
    await repo.applyLocalReview(
      cardId: 's1-c0',
      direction: 'term_to_def',
      rating: ratingGood,
      reviewedAt: DateTime.now().toUtc(),
    );

    final q = await repo.buildOfflineQueue('s1', mode: 'flashcards');

    // Набор скачан (не null), но due-карточек не осталось.
    expect(q, isNotNull);
    expect(q!.items, isEmpty);
  });

  test('cacheQueueCards делает набор доступным офлайн', () async {
    // Набор не скачан заранее — только кэш из онлайн-очереди.
    final items = [
      QueueItem(
        card: QueueCard(id: 'q1', position: 0, term: 'cat', definition: 'кот'),
        direction: 'term_to_def',
        state: CardStateData(
          cardId: 'q1',
          direction: 'term_to_def',
          state: cardStateNew,
          dueAt: DateTime.now().toUtc(),
        ),
        previews: const [],
      ),
    ];
    await repo.cacheQueueCards('s1', items);

    final q = await repo.buildOfflineQueue('s1', mode: 'flashcards');
    expect(q, isNotNull);
    expect(q!.items.single.card.term, 'cat');
  });
}
