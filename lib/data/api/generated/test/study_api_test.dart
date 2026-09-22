import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for StudyApi
void main() {
  final instance = RemoraApi().getStudyApi();

  group(StudyApi, () {
    // Собрать тест по набору
    //
    //Future<TestAttemptOut> createTestApiV1StudySetsSetIdTestsPost(String setId, TestConfig testConfig) async
    test('test createTestApiV1StudySetsSetIdTestsPost', () async {
      // TODO
    });

    // Завершить тренировку
    //
    //Future<SessionOut> finishSessionApiV1StudySessionsSessionIdFinishPost(String sessionId) async
    test('test finishSessionApiV1StudySessionsSessionIdFinishPost', () async {
      // TODO
    });

    // Незавершённая тренировка
    //
    //Future<SessionOut> getActiveSessionApiV1StudySessionsActiveGet(String setId, { StudyMode mode }) async
    test('test getActiveSessionApiV1StudySessionsActiveGet', () async {
      // TODO
    });

    // Прогноз нагрузки на ближайшие дни
    //
    //Future<BuiltList<ForecastDay>> getForecastApiV1StudyForecastGet({ int days, String setId }) async
    test('test getForecastApiV1StudyForecastGet', () async {
      // TODO
    });

    // Очередь карточек на тренировку
    //
    //Future<StudyQueue> getQueueApiV1StudySetsSetIdQueueGet(String setId, { StudyMode mode, QueueScope scope, DirectionMode direction, int limit, bool shuffle }) async
    test('test getQueueApiV1StudySetsSetIdQueueGet', () async {
      // TODO
    });

    // Настройки заучивания для набора
    //
    //Future<SetLearnSettingsOut> getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet(String setId) async
    test('test getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet', () async {
      // TODO
    });

    // Статистика по набору
    //
    //Future<SetStats> getSetStatsApiV1StudySetsSetIdStatsGet(String setId) async
    test('test getSetStatsApiV1StudySetsSetIdStatsGet', () async {
      // TODO
    });

    // Настройки обучения
    //
    //Future<StudySettingsOut> getStudySettingsApiV1StudySettingsGet() async
    test('test getStudySettingsApiV1StudySettingsGet', () async {
      // TODO
    });

    // Попытка теста
    //
    //Future<TestAttemptOut> getTestApiV1StudyTestsAttemptIdGet(String attemptId) async
    test('test getTestApiV1StudyTestsAttemptIdGet', () async {
      // TODO
    });

    // Разбор теста
    //
    //Future<TestResult> getTestResultApiV1StudyTestsAttemptIdResultGet(String attemptId) async
    test('test getTestResultApiV1StudyTestsAttemptIdResultGet', () async {
      // TODO
    });

    // Сбросить свой прогресс набора в обоих направлениях
    //
    //Future resetProgressApiV1StudySetsSetIdResetPost(String setId) async
    test('test resetProgressApiV1StudySetsSetIdResetPost', () async {
      // TODO
    });

    // Вернуть общие настройки заучивания для набора
    //
    //Future resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete(String setId) async
    test('test resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete', () async {
      // TODO
    });

    // Пересдать ошибки
    //
    //Future<TestAttemptOut> retakeTestApiV1StudyTestsAttemptIdRetakePost(String attemptId) async
    test('test retakeTestApiV1StudyTestsAttemptIdRetakePost', () async {
      // TODO
    });

    // Начать тренировку
    //
    //Future<SessionOut> startSessionApiV1StudySessionsPost(SessionCreate sessionCreate) async
    test('test startSessionApiV1StudySessionsPost', () async {
      // TODO
    });

    // Отправить ответы батчем
    //
    //Future<ReviewBatchResult> submitReviewsApiV1StudyReviewsPost(ReviewBatch reviewBatch) async
    test('test submitReviewsApiV1StudyReviewsPost', () async {
      // TODO
    });

    // Проверить ответы теста
    //
    //Future<TestResult> submitTestApiV1StudyTestsAttemptIdSubmitPost(String attemptId, TestSubmit testSubmit) async
    test('test submitTestApiV1StudyTestsAttemptIdSubmitPost', () async {
      // TODO
    });

    // Переопределить настройки заучивания для набора
    //
    //Future<SetLearnSettingsOut> updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut(String setId, SetLearnSettingsUpdate setLearnSettingsUpdate) async
    test('test updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut', () async {
      // TODO
    });

    // Изменить настройки обучения
    //
    //Future<StudySettingsOut> updateStudySettingsApiV1StudySettingsPatch(StudySettingsUpdate studySettingsUpdate) async
    test('test updateStudySettingsApiV1StudySettingsPatch', () async {
      // TODO
    });

  });
}
