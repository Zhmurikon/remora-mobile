import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for SetsApi
void main() {
  final instance = RemoraApi().getSetsApi();

  group(SetsApi, () {
    // Независимая копия набора из доступного курса
    //
    // В отличие от `/duplicate`, копирует и чужой доступный набор с собственными медиа.
    //
    //Future<SetDetail> copySetApiV1SetsSetIdCopyPost(String setId, String idempotencyKey) async
    test('test copySetApiV1SetsSetIdCopyPost', () async {
      // TODO
    });

    // Создать набор
    //
    //Future<SetDetail> createSetApiV1SetsPost(SetCreate setCreate) async
    test('test createSetApiV1SetsPost', () async {
      // TODO
    });

    // Удалить набор
    //
    //Future deleteSetApiV1SetsSetIdDelete(String setId) async
    test('test deleteSetApiV1SetsSetIdDelete', () async {
      // TODO
    });

    // Дублировать набор
    //
    //Future<SetDetail> duplicateSetApiV1SetsSetIdDuplicatePost(String setId) async
    test('test duplicateSetApiV1SetsSetIdDuplicatePost', () async {
      // TODO
    });

    // Публичный набор по ссылке
    //
    //Future<PublicSet> getPublicSetApiV1SetsPublicSlugGet(String slug) async
    test('test getPublicSetApiV1SetsPublicSlugGet', () async {
      // TODO
    });

    // Получить набор
    //
    //Future<SetDetail> getSetApiV1SetsSetIdGet(String setId) async
    test('test getSetApiV1SetsSetIdGet', () async {
      // TODO
    });

    // Мои наборы
    //
    //Future<BuiltList<SetSummary>> listSetsApiV1SetsGet() async
    test('test listSetsApiV1SetsGet', () async {
      // TODO
    });

    // Сохранить карточки
    //
    //Future<SetDetail> syncCardsApiV1SetsSetIdCardsPut(String setId, CardBatch cardBatch) async
    test('test syncCardsApiV1SetsSetIdCardsPut', () async {
      // TODO
    });

    // Изменить набор
    //
    //Future<SetDetail> updateSetApiV1SetsSetIdPatch(String setId, SetUpdate setUpdate) async
    test('test updateSetApiV1SetsSetIdPatch', () async {
      // TODO
    });

  });
}
