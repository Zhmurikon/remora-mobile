import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/media_cache.dart';
import 'package:remora_mobile/data/repositories/outbox_service.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';

class _RejectedApi extends RemoraApiClient {
  _RejectedApi() : super(Dio());

  var calls = 0;

  @override
  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async {
    calls++;
    return ReviewBatchResult(
      accepted: const [],
      duplicates: const [],
      rejected: batch.reviews.map((item) => item.clientReviewId).toList(),
      states: const [],
    );
  }
}

void main() {
  test('имя базы однозначно привязано к пользователю', () {
    expect(databaseFileName('user-a'), 'remora-user-a.sqlite');
    expect(databaseFileName('user-b'), isNot(databaseFileName('user-a')));
    expect(databaseFileName('id/with:path'), 'remora-id_with_path.sqlite');
  });

  test('rejected удаляется из outbox без повторного цикла', () async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final repository = StudyRepository(db);
    final api = _RejectedApi();
    final service = OutboxService(repository, api);
    await repository.enqueueReview(
      ReviewOutboxCompanion(
        clientReviewId: const Value('review-1'),
        cardId: const Value('card-1'),
        direction: const Value('term_to_def'),
        mode: const Value('learn'),
        rating: const Value(3),
        reviewedAt: Value(DateTime.utc(2026, 1, 1)),
      ),
    );

    await service.flush();

    expect(api.calls, 1);
    expect(await repository.pendingCount(), 0);
  });

  test('медиа скачивается в стабильный пользовательский файл', () async {
    final root = await Directory.systemTemp.createTemp('remora-media-test-');
    addTearDown(() => root.delete(recursive: true));
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) {
      request.response.headers.contentType = ContentType('image', 'png');
      request.response.add([1, 2, 3, 4]);
      request.response.close();
    });
    final cache = MediaCache(Dio(), 'user-a', root);
    final url =
        'http://${server.address.host}:${server.port}/asset.png?signature=one';

    final first = await cache.download(url, key: 'article-media-1');
    final second = await cache.download(
      '$url&rotated=two',
      key: 'article-media-1',
    );

    expect(first, isNotNull);
    expect(second, first);
    expect(await File(first!).readAsBytes(), [1, 2, 3, 4]);
    expect(first, contains('media/user-a/article-media-1.png'));

    final orphan = File('${root.path}/media/user-a/orphan.png');
    await orphan.writeAsBytes([9]);
    await cache.prune([first], gracePeriod: Duration.zero);
    expect(await File(first).exists(), isTrue);
    expect(await orphan.exists(), isFalse);
  });
}
