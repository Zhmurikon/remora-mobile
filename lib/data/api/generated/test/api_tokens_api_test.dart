import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for ApiTokensApi
void main() {
  final instance = RemoraApi().getApiTokensApi();

  group(ApiTokensApi, () {
    // Create Token
    //
    //Future<ApiTokenCreated> createTokenApiV1UsersMeApiTokensPost(ApiTokenCreate apiTokenCreate) async
    test('test createTokenApiV1UsersMeApiTokensPost', () async {
      // TODO
    });

    // List Tokens
    //
    //Future<BuiltList<ApiTokenPublic>> listTokensApiV1UsersMeApiTokensGet() async
    test('test listTokensApiV1UsersMeApiTokensGet', () async {
      // TODO
    });

    // Revoke Token
    //
    //Future revokeTokenApiV1UsersMeApiTokensTokenIdDelete(String tokenId) async
    test('test revokeTokenApiV1UsersMeApiTokensTokenIdDelete', () async {
      // TODO
    });

  });
}
