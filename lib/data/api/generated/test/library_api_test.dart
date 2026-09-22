import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for LibraryApi
void main() {
  final instance = RemoraApi().getLibraryApi();

  group(LibraryApi, () {
    // Принять обновление
    //
    //Future<LibraryItem> acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost(String saveId) async
    test('test acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost', () async {
      // TODO
    });

    // Course Library State
    //
    //Future<LibraryState> courseLibraryStateApiV1LibraryCoursesSlugStateGet(String slug) async
    test('test courseLibraryStateApiV1LibraryCoursesSlugStateGet', () async {
      // TODO
    });

    // Изменения оригинала
    //
    //Future<LibraryDiff> libraryChangesApiV1LibrarySaveIdChangesGet(String saveId) async
    test('test libraryChangesApiV1LibrarySaveIdChangesGet', () async {
      // TODO
    });

    // Сохранённые оригиналы
    //
    //Future<BuiltList<LibraryItem>> listLibraryApiV1LibraryGet() async
    test('test listLibraryApiV1LibraryGet', () async {
      // TODO
    });

    // Убрать сохранение
    //
    //Future removeFromLibraryApiV1LibrarySaveIdDelete(String saveId) async
    test('test removeFromLibraryApiV1LibrarySaveIdDelete', () async {
      // TODO
    });

    // Сохранить оригинал
    //
    //Future<LibraryItem> saveToLibraryApiV1LibraryPost(LibrarySaveCreate librarySaveCreate) async
    test('test saveToLibraryApiV1LibraryPost', () async {
      // TODO
    });

  });
}
