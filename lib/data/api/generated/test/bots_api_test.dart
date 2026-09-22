import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for BotsApi
void main() {
  final instance = RemoraApi().getBotsApi();

  group(BotsApi, () {
    // Create Code
    //
    //Future<BotCodeCreated> createCodeApiV1UsersMeBotsCodePost(BotCodeRequest botCodeRequest) async
    test('test createCodeApiV1UsersMeBotsCodePost', () async {
      // TODO
    });

    // List Links
    //
    //Future<BuiltList<BotLinkPublic>> listLinksApiV1UsersMeBotsGet() async
    test('test listLinksApiV1UsersMeBotsGet', () async {
      // TODO
    });

    // Revoke
    //
    //Future revokeApiV1UsersMeBotsLinkIdDelete(String linkId) async
    test('test revokeApiV1UsersMeBotsLinkIdDelete', () async {
      // TODO
    });

  });
}
