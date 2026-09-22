# remora_api.api.BotsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCodeApiV1UsersMeBotsCodePost**](BotsApi.md#createcodeapiv1usersmebotscodepost) | **POST** /api/v1/users/me/bots/code | Create Code
[**listLinksApiV1UsersMeBotsGet**](BotsApi.md#listlinksapiv1usersmebotsget) | **GET** /api/v1/users/me/bots | List Links
[**revokeApiV1UsersMeBotsLinkIdDelete**](BotsApi.md#revokeapiv1usersmebotslinkiddelete) | **DELETE** /api/v1/users/me/bots/{link_id} | Revoke


# **createCodeApiV1UsersMeBotsCodePost**
> BotCodeCreated createCodeApiV1UsersMeBotsCodePost(botCodeRequest)

Create Code

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getBotsApi();
final BotCodeRequest botCodeRequest = ; // BotCodeRequest | 

try {
    final response = api.createCodeApiV1UsersMeBotsCodePost(botCodeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BotsApi->createCodeApiV1UsersMeBotsCodePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **botCodeRequest** | [**BotCodeRequest**](BotCodeRequest.md)|  | 

### Return type

[**BotCodeCreated**](BotCodeCreated.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLinksApiV1UsersMeBotsGet**
> BuiltList<BotLinkPublic> listLinksApiV1UsersMeBotsGet()

List Links

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getBotsApi();

try {
    final response = api.listLinksApiV1UsersMeBotsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling BotsApi->listLinksApiV1UsersMeBotsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;BotLinkPublic&gt;**](BotLinkPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeApiV1UsersMeBotsLinkIdDelete**
> revokeApiV1UsersMeBotsLinkIdDelete(linkId)

Revoke

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getBotsApi();
final String linkId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.revokeApiV1UsersMeBotsLinkIdDelete(linkId);
} on DioException catch (e) {
    print('Exception when calling BotsApi->revokeApiV1UsersMeBotsLinkIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

