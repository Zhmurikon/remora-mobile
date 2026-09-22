import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';

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

  group('StudyRepository — Review Outbox', () {
    test('enqueue и получение неотправленных ответов', () async {
      expect(await repo.pendingCount(), 0);

      await repo.enqueueReview(ReviewOutboxCompanion(
        clientReviewId: const Value('r1'),
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        mode: const Value('flashcards'),
        rating: const Value(3),
        reviewedAt: Value(DateTime(2025, 1, 1)),
      ));

      expect(await repo.pendingCount(), 1);

      await repo.enqueueReview(ReviewOutboxCompanion(
        clientReviewId: const Value('r2'),
        cardId: const Value('card2'),
        direction: const Value('term_to_def'),
        mode: const Value('flashcards'),
        rating: const Value(4),
        reviewedAt: Value(DateTime(2025, 1, 1, 0, 1)),
      ));

      expect(await repo.pendingCount(), 2);

      final pending = await repo.getPendingReviews();
      expect(pending.length, 2);
      expect(pending[0].clientReviewId, 'r1');
      expect(pending[1].clientReviewId, 'r2');
    });

    test('идемпотентная запись по clientReviewId', () async {
      final entry = ReviewOutboxCompanion(
        clientReviewId: const Value('r1'),
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        mode: const Value('flashcards'),
        rating: const Value(3),
        reviewedAt: Value(DateTime(2025, 1, 1)),
      );

      await repo.enqueueReview(entry);
      await repo.enqueueReview(entry); // дубль — не ломается
      expect(await repo.pendingCount(), 1);
    });

    test('удаление отправленных ответов', () async {
      for (final id in ['r1', 'r2', 'r3']) {
        await repo.enqueueReview(ReviewOutboxCompanion(
          clientReviewId: Value(id),
          cardId: const Value('card1'),
          direction: const Value('term_to_def'),
          mode: const Value('flashcards'),
          rating: const Value(3),
          reviewedAt: Value(DateTime(2025, 1, 1)),
        ));
      }

      expect(await repo.pendingCount(), 3);

      await repo.removeReviews(['r1', 'r3']);
      expect(await repo.pendingCount(), 1);

      final remaining = await repo.getPendingReviews();
      expect(remaining.first.clientReviewId, 'r2');
    });

    test('bumpAttempts увеличивает счётчик', () async {
      await repo.enqueueReview(ReviewOutboxCompanion(
        clientReviewId: const Value('r1'),
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        mode: const Value('flashcards'),
        rating: const Value(2),
        reviewedAt: Value(DateTime(2025, 1, 1)),
      ));

      await repo.bumpAttempts('r1');
      final pending = await repo.getPendingReviews();
      expect(pending.first.attempts, 1);

      await repo.bumpAttempts('r1');
      final pending2 = await repo.getPendingReviews();
      expect(pending2.first.attempts, 2);
      expect(pending2.first.lastAttemptAt, isNotNull);
    });
  });

  group('StudyRepository — Card States', () {
    test('upsert и чтение состояния карточки', () async {
      // Сначала создаём набор и карточку (FK constraint)
      await db.sets.insertOnConflictUpdate(SetsCompanion(
        id: const Value('set1'),
        title: const Value('Test Set'),
        visibility: const Value('private'),
        slug: const Value('test'),
        cardsCount: const Value(1),
        createdAt: Value(DateTime(2025, 1, 1)),
        updatedAt: Value(DateTime(2025, 1, 1)),
      ));
      await db.cards.insertOnConflictUpdate(CardsCompanion(
        id: const Value('card1'),
        setId: const Value('set1'),
        position: const Value(0),
        term: const Value('hello'),
        definition: const Value('привет'),
      ));

      // Создаём состояние
      await repo.upsertCardState(CardStatesCompanion(
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        state: const Value('learning'),
        stability: const Value(1.5),
        difficulty: const Value(5.0),
        step: const Value(1),
        dueAt: Value(DateTime(2025, 1, 2)),
      ));

      final row = await repo.getCardState('card1', 'term_to_def');
      expect(row, isNotNull);
      expect(row!.state, 'learning');
      expect(row.stability, 1.5);
      expect(row.difficulty, 5.0);
      expect(row.step, 1);
    });

    test('upsert обновляет существующую запись', () async {
      await db.sets.insertOnConflictUpdate(SetsCompanion(
        id: const Value('set1'),
        title: const Value('Test Set'),
        visibility: const Value('private'),
        slug: const Value('test'),
        cardsCount: const Value(1),
        createdAt: Value(DateTime(2025, 1, 1)),
        updatedAt: Value(DateTime(2025, 1, 1)),
      ));
      await db.cards.insertOnConflictUpdate(CardsCompanion(
        id: const Value('card1'),
        setId: const Value('set1'),
        position: const Value(0),
        term: const Value('hello'),
        definition: const Value('привет'),
      ));

      await repo.upsertCardState(CardStatesCompanion(
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        state: const Value('new'),
        dueAt: Value(DateTime(2025, 1, 1)),
      ));

      await repo.upsertCardState(CardStatesCompanion(
        cardId: const Value('card1'),
        direction: const Value('term_to_def'),
        state: const Value('review'),
        stability: const Value(10.0),
        difficulty: const Value(4.5),
        dueAt: Value(DateTime(2025, 1, 11)),
      ));

      final row = await repo.getCardState('card1', 'term_to_def');
      expect(row!.state, 'review');
      expect(row.stability, 10.0);
    });

    test('массовое обновление состояний', () async {
      await db.sets.insertOnConflictUpdate(SetsCompanion(
        id: const Value('set1'),
        title: const Value('Test Set'),
        visibility: const Value('private'),
        slug: const Value('test'),
        cardsCount: const Value(2),
        createdAt: Value(DateTime(2025, 1, 1)),
        updatedAt: Value(DateTime(2025, 1, 1)),
      ));
      for (final id in ['card1', 'card2']) {
        await db.cards.insertOnConflictUpdate(CardsCompanion(
          id: Value(id),
          setId: const Value('set1'),
          position: const Value(0),
          term: const Value('term'),
          definition: const Value('def'),
        ));
      }

      await repo.upsertCardStates([
        CardStatesCompanion(
          cardId: const Value('card1'),
          direction: const Value('term_to_def'),
          state: const Value('learning'),
          dueAt: Value(DateTime(2025, 1, 2)),
        ),
        CardStatesCompanion(
          cardId: const Value('card2'),
          direction: const Value('term_to_def'),
          state: const Value('review'),
          dueAt: Value(DateTime(2025, 1, 15)),
        ),
      ]);

      final states = await repo.getSetStates('set1');
      expect(states.length, 2);
    });
  });
}
