import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for MediaApi
void main() {
  final instance = RemoraApi().getMediaApi();

  group(MediaApi, () {
    // Завершить загрузку
    //
    //Future<MediaAssetPublic> completeUploadApiV1MediaAssetIdCompletePost(String assetId) async
    test('test completeUploadApiV1MediaAssetIdCompletePost', () async {
      // TODO
    });

    // Получить ссылку для загрузки изображения
    //
    //Future<ImageUploadTicket> createUploadUrlApiV1MediaUploadUrlPost(ImageUploadRequest imageUploadRequest) async
    test('test createUploadUrlApiV1MediaUploadUrlPost', () async {
      // TODO
    });

    // Удалить изображение
    //
    //Future deleteAssetApiV1MediaAssetIdDelete(String assetId) async
    test('test deleteAssetApiV1MediaAssetIdDelete', () async {
      // TODO
    });

    // Получить изображение
    //
    //Future<MediaAssetPublic> getAssetApiV1MediaAssetIdGet(String assetId) async
    test('test getAssetApiV1MediaAssetIdGet', () async {
      // TODO
    });

  });
}
