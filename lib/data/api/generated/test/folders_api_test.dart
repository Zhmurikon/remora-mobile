import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for FoldersApi
void main() {
  final instance = RemoraApi().getFoldersApi();

  group(FoldersApi, () {
    // Создать папку
    //
    //Future<FolderPublic> createFolderApiV1FoldersPost(FolderCreate folderCreate) async
    test('test createFolderApiV1FoldersPost', () async {
      // TODO
    });

    // Удалить папку
    //
    //Future deleteFolderApiV1FoldersFolderIdDelete(String folderId) async
    test('test deleteFolderApiV1FoldersFolderIdDelete', () async {
      // TODO
    });

    // Мои папки
    //
    //Future<BuiltList<FolderPublic>> listFoldersApiV1FoldersGet() async
    test('test listFoldersApiV1FoldersGet', () async {
      // TODO
    });

    // Изменить папку
    //
    //Future<FolderPublic> updateFolderApiV1FoldersFolderIdPatch(String folderId, FolderUpdate folderUpdate) async
    test('test updateFolderApiV1FoldersFolderIdPatch', () async {
      // TODO
    });

  });
}
