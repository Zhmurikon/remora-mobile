import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/outbox_service.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';
import 'package:remora_mobile/features/study/study_provider.dart';

class _DelayedStudyApi extends RemoraApiClient {
  _DelayedStudyApi({this.empty = false}) : super(Dio());

  final reviewStarted = Completer<void>();
  final releaseReview = Completer<void>();
  final bool empty;
  String? requestedScope;

  late final QueueItem item = QueueItem(
    card: QueueCard(
      id: 'card-1',
      position: 0,
      term: 'term',
      definition: 'definition',
    ),
    direction: 'term_to_def',
    state: CardStateData(
      cardId: 'card-1',
      direction: 'term_to_def',
      state: 'new',
      dueAt: DateTime.utc(2026, 1, 1),
    ),
    previews: [RatingPreview(rating: 3, intervalSeconds: 600)],
  );

  @override
  Future<StudyQueue> getStudyQueue({
    required String setId,
    String mode = 'learn',
    String scope = 'due',
    String direction = 'term_to_def',
    int limit = 60,
  }) async {
    requestedScope = scope;
    return StudyQueue(
      setId: setId,
      setTitle: 'Набор',
      langTerm: 'en',
      langDefinition: 'ru',
      answerStrictness: 'moderate',
      mode: mode,
      schedulerVersion: 'fsrs6-v1',
      items: empty ? const [] : [item],
      dueTotal: 0,
      newTotal: 1,
      newLeftToday: 1,
      reviewsLeftToday: 0,
    );
  }

  @override
  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async {
    if (!reviewStarted.isCompleted) reviewStarted.complete();
    await releaseReview.future;
    return ReviewBatchResult(
      accepted: batch.reviews.map((review) => review.clientReviewId).toList(),
      duplicates: const [],
      rejected: const [],
      states: const [],
    );
  }
}

void main() {
  test('последний ответ синхронизируется до открытия результатов', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final api = _DelayedStudyApi();
    final repository = StudyRepository(db);
    final outbox = OutboxService(repository, api);
    var synced = 0;
    final notifier = StudySessionNotifier(
      api,
      outbox,
      repository,
      () => synced++,
    );
    addTearDown(notifier.dispose);

    await notifier.begin('set-1', StudyMode.learn);
    final answer = notifier.answer(item: api.item, rating: 3);
    await api.reviewStarted.future;

    expect(notifier.state.isFinished, isFalse);

    api.releaseReview.complete();
    await answer;

    expect(notifier.state.isFinished, isTrue);
    expect(notifier.state.pending, 0);
    expect(synced, 1);
  });

  test('карточки запрашивают весь набор без дневного лимита', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final api = _DelayedStudyApi();
    final notifier = StudySessionNotifier(
      api,
      OutboxService(StudyRepository(db), api),
      StudyRepository(db),
    );
    addTearDown(notifier.dispose);

    await notifier.begin('set-1', StudyMode.flashcards);

    expect(api.requestedScope, 'all');
    expect(notifier.state.items, isNotEmpty);
  });

  test('пустая дневная очередь объясняет, как повторить весь набор', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final api = _DelayedStudyApi(empty: true);
    final repository = StudyRepository(db);
    final notifier = StudySessionNotifier(
      api,
      OutboxService(repository, api),
      repository,
    );
    addTearDown(notifier.dispose);

    await notifier.begin('set-1', StudyMode.write);

    expect(notifier.state.items, isEmpty);
    expect(notifier.state.error, contains('Откройте «Карточки»'));
  });
}
