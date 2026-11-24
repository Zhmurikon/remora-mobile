import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/outbox_service.dart';
import 'package:remora_mobile/data/repositories/course_repository.dart';
import 'package:remora_mobile/data/repositories/set_repository.dart';
import 'package:remora_mobile/data/repositories/study_repository.dart';
import 'package:remora_mobile/features/study/study_provider.dart';

QueueItem _item(String setId, int position) {
  final id = '$setId-$position';
  return QueueItem(
    sourceSetId: setId,
    direction: 'term_to_def',
    card: QueueCard(
      id: id,
      position: position,
      term: id,
      definition: 'Ответ $id',
    ),
    state: CardStateData(
      cardId: id,
      direction: 'term_to_def',
      state: 'new',
      dueAt: DateTime.utc(2026),
    ),
    previews: [],
  );
}

class _CourseApi extends RemoraApiClient {
  _CourseApi(this.sizes) : super(Dio());
  final Map<String, int> sizes;
  final reviewed = <String>[];
  bool offline = false;
  bool forbidden = false;

  StudyQueue queue(String? set, List<QueueItem> items, int total) => StudyQueue(
    setId: set,
    setTitle: set ?? 'Курс',
    langTerm: 'ru',
    langDefinition: 'ru',
    answerStrictness: 'moderate',
    mode: 'flashcards',
    schedulerVersion: 'fsrs6-v1',
    items: items,
    dueTotal: 0,
    newTotal: total,
    newLeftToday: 0,
    reviewsLeftToday: 0,
  );

  @override
  Future<StudyQueue> getFolderLearnQueue(String folderId) async =>
      queue(null, [_item('a', 0), _item('b', 1), _item('b', 2)], 3);

  @override
  Future<StudyQueue> getCourseStudyQueue(String courseId) async {
    final request = RequestOptions(path: '/course');
    if (offline || forbidden) {
      throw DioException(
        requestOptions: request,
        response: forbidden
            ? Response(requestOptions: request, statusCode: 403)
            : null,
      );
    }
    final all = <QueueItem>[];
    for (var i = 0; sizes.values.any((size) => i < size); i++) {
      for (final e in sizes.entries) {
        if (i < e.value) all.add(_item(e.key, i));
      }
    }
    return queue(null, all.take(200).toList(), all.length);
  }

  @override
  Future<StudyQueue> getStudyQueue({
    required String setId,
    String mode = 'learn',
    String scope = 'due',
    String direction = 'term_to_def',
    int limit = 60,
  }) async {
    expect(scope, 'all');
    final count = sizes[setId]!;
    return queue(
      setId,
      List.generate(count, (i) => _item(setId, i)).take(limit).toList(),
      count,
    );
  }

  @override
  Future<SetDetail> getSetDetail(String setId) async => SetDetail(
    id: setId,
    title: setId,
    description: '',
    visibility: 'private',
    slug: setId,
    cardsCount: sizes[setId]!,
    createdAt: DateTime.utc(2026),
    updatedAt: DateTime.utc(2026),
    langTerm: 'ru',
    langDefinition: 'ru',
    cards: List.generate(
      sizes[setId]!,
      (i) => CardData(
        id: '$setId-$i',
        position: i,
        term: '$setId-$i',
        definition: 'Ответ $i',
        contentType: 'text',
      ),
    ),
  );

  @override
  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async {
    reviewed.addAll(batch.reviews.map((r) => r.cardId));
    return ReviewBatchResult(
      accepted: batch.reviews.map((r) => r.clientReviewId).toList(),
      duplicates: [],
      rejected: [],
      states: [],
    );
  }
}

void main() {
  late AppDatabase db;
  late StudyRepository repo;
  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = StudyRepository(db);
  });
  tearDown(() => db.close());
  StudySessionNotifier session(_CourseApi api) {
    final notifier = StudySessionNotifier(api, OutboxService(repo, api), repo);
    addTearDown(notifier.dispose);
    return notifier;
  }

  test(
    'просмотр и ответы на пары в папке сохраняют порядок и направление',
    () async {
      final api = _CourseApi({});
      final notifier = session(api);
      await notifier.beginFolder('folder');
      final original = [...notifier.state.items];
      notifier.deferPreview();
      expect(notifier.state.items, [original[1], original[2], original[0]]);
      expect(notifier.state.answered, 0);
      final source = original[2];
      await notifier.answer(
        item: source.facing('def_to_term'),
        consume: source,
        rating: 1,
        answerCorrect: false,
        requeue: true,
      );
      expect(notifier.state.items.skip(notifier.state.index), [
        original[1],
        original[0],
        source,
      ]);
      final pending = await repo.getPendingReviews();
      expect(pending.single.cardId, source.card.id);
      expect(pending.single.direction, 'def_to_term');
      expect(pending.single.answerCorrect, false);
      await notifier.finish();
      expect(api.reviewed, [source.card.id]);
    },
  );

  test(
    'все режимы перемешивают весь курс, включая материал больше 200 карточек',
    () async {
      final api = _CourseApi({'a': 211, 'b': 45});
      final notifier = session(api);
      List<String>? previous;
      for (final mode in StudyMode.values) {
        await notifier.beginCourse('course', mode);
        final ids = notifier.state.items.map((it) => it.card.id).toList();
        expect(ids.toSet(), {
          for (final entry in api.sizes.entries)
            for (var i = 0; i < entry.value; i++) '${entry.key}-$i',
        });
        expect(ids.length, 256);
        expect(ids, isNot(equals(previous)));
        expect(notifier.state.mode, mode);
        previous = ids;
      }
      final card = notifier.state.currentItem!;
      await notifier.answer(item: card, rating: 3);
      await notifier.finish();
      expect(api.reviewed, [card.card.id]);
      expect(notifier.state.pending, 0);
    },
  );

  test(
    'офлайн использует только полностью скачанные материалы своего курса',
    () async {
      final api = _CourseApi({'a': 7, 'b': 4, 'other': 2})..offline = true;
      final notifier = session(api);
      final date = DateTime.utc(2026);
      await db.courses.insertOne(
        CoursesCompanion.insert(
          id: 'course',
          slug: 'course',
          title: 'Курс',
          updatedAt: date,
        ),
      );
      await db.courseSections.insertOne(
        CourseSectionsCompanion.insert(
          id: 'section',
          courseId: 'course',
          title: 'Раздел',
          position: 0,
        ),
      );
      for (final (i, set) in ['a', 'b', 'a'].indexed) {
        await db.courseArticles.insertOne(
          CourseArticlesCompanion.insert(
            id: 'article-$i',
            sectionId: 'section',
            courseId: 'course',
            setId: set,
            title: 'Урок',
            position: 0,
          ),
        );
      }
      await db.syncMeta.insertOne(
        SyncMetaCompanion.insert(
          entityType: 'course_bundle',
          entityId: 'course',
          lastSyncedAt: date,
        ),
      );
      await repo.downloadFullSet(api, 'a');
      await repo.downloadFullSet(api, 'other');
      await notifier.beginCourse('course', StudyMode.learn);
      expect(notifier.state.error, contains('скачайте курс'));
      await repo.downloadFullSet(api, 'b');
      await notifier.beginCourse('course', StudyMode.learn);
      expect(notifier.state.total, 11);
      expect(notifier.state.isOnline, isFalse);
      expect(
        notifier.state.items.any((it) => it.card.id.startsWith('other')),
        isFalse,
      );
      api.offline = false;
      api.forbidden = true;
      await notifier.beginCourse('course', StudyMode.learn);
      expect(notifier.state.total, 0);
      expect(notifier.state.items, isEmpty);
      expect(notifier.state.error, isNotNull);
    },
  );

  test(
    'скачивание сохранённого курса берёт принятые материалы для офлайн-колоды',
    () async {
      final api = _CourseApi({'accepted': 4});
      final repository = CourseRepository(
        db,
        api,
        null,
        SetRepository(db, api),
      );
      final date = DateTime.utc(2026);
      await db.courses.insertOne(
        CoursesCompanion.insert(
          id: 'course',
          slug: 'course',
          title: 'Курс',
          updatedAt: date,
        ),
      );
      final detail = CourseDetailData.fromJson({
        'id': 'course',
        'slug': 'course',
        'title': 'Курс',
        'updated_at': date.toIso8601String(),
        'can_edit': false,
        'author': {'id': 'author', 'username': 'Автор'},
        'sections': [
          {
            'id': 'section',
            'title': 'Раздел',
            'position': 0,
            'articles': [
              for (final id in ['accepted', 'unaccepted'])
                {
                  'id': 'article-$id',
                  'set_id': id,
                  'title': id,
                  'position': 0,
                  'body': '',
                },
            ],
          },
        ],
      });
      await repository.downloadCourseSets(detail);
      final queue = await repo.offlineCourseQueue('course');
      expect(queue!.items.map((item) => item.card.id), [
        'accepted-0',
        'accepted-1',
        'accepted-2',
        'accepted-3',
      ]);
    },
  );

  test('пустой курс не открывает предыдущую тренировку', () async {
    final api = _CourseApi({'a': 2});
    final notifier = session(api);
    await notifier.beginCourse('course', StudyMode.flashcards);
    api.sizes.clear();
    await notifier.beginCourse('course', StudyMode.flashcards);
    expect(notifier.state.items, isEmpty);
    expect(notifier.state.error, contains('пока нет карточек'));
  });
}
