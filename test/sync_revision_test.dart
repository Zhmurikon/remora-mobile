import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/api_client.dart';
import 'package:remora_mobile/data/db/app_database.dart';
import 'package:remora_mobile/data/repositories/course_repository.dart';
import 'package:remora_mobile/data/repositories/set_repository.dart';

void main() {
  late AppDatabase db;
  late SetRepository sets;
  late CourseRepository courses;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    final api = RemoraApiClient(Dio());
    sets = SetRepository(db, api);
    courses = CourseRepository(db, api);
  });

  tearDown(() => db.close());

  test('набор становится устаревшим после изменения updated_at', () async {
    final firstRevision = DateTime.utc(2026, 1, 1);
    await db.sets.insertOne(
      SetsCompanion.insert(
        id: 'set-1',
        title: 'Набор',
        visibility: 'private',
        slug: 'set',
        cardsCount: 1,
        createdAt: firstRevision,
        updatedAt: firstRevision,
      ),
    );
    await db.syncMeta.insertOne(
      SyncMetaCompanion.insert(
        entityType: 'set',
        entityId: 'set-1',
        lastSyncedAt: firstRevision,
        revision: Value(
          (firstRevision.millisecondsSinceEpoch ~/
                  Duration.millisecondsPerSecond)
              .toString(),
        ),
      ),
    );

    expect(await sets.getOutdatedDownloadedSetIds(), isEmpty);

    final nextRevision = DateTime.utc(2026, 1, 2);
    await (db.update(db.sets)..where((set) => set.id.equals('set-1'))).write(
      SetsCompanion(updatedAt: Value(nextRevision)),
    );

    expect(await sets.getOutdatedDownloadedSetIds(), {'set-1'});
  });

  test('курс без ревизии полной загрузки требует обновления', () async {
    final revision = DateTime.utc(2026, 2, 1);
    await db.courses.insertOne(
      CoursesCompanion.insert(
        id: 'course-1',
        slug: 'course',
        title: 'Курс',
        updatedAt: revision,
      ),
    );
    await db.syncMeta.insertOne(
      SyncMetaCompanion.insert(
        entityType: 'course',
        entityId: 'course-1',
        lastSyncedAt: revision,
      ),
    );

    expect(await courses.getOutdatedDownloadedCourseIds(), {'course-1'});
  });
}
