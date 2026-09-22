import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for AuthorsApi
void main() {
  final instance = RemoraApi().getAuthorsApi();

  group(AuthorsApi, () {
    // Публичный профиль автора
    //
    //Future<AuthorProfile> authorProfileApiV1AuthorsUsernameGet(String username) async
    test('test authorProfileApiV1AuthorsUsernameGet', () async {
      // TODO
    });

  });
}
