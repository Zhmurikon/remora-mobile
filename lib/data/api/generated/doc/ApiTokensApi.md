# remora_api.api.ApiTokensApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTokenApiV1UsersMeApiTokensPost**](ApiTokensApi.md#createtokenapiv1usersmeapitokenspost) | **POST** /api/v1/users/me/api-tokens | Create Token
[**listTokensApiV1UsersMeApiTokensGet**](ApiTokensApi.md#listtokensapiv1usersmeapitokensget) | **GET** /api/v1/users/me/api-tokens | List Tokens
[**revokeTokenApiV1UsersMeApiTokensTokenIdDelete**](ApiTokensApi.md#revoketokenapiv1usersmeapitokenstokeniddelete) | **DELETE** /api/v1/users/me/api-tokens/{token_id} | Revoke Token


# **createTokenApiV1UsersMeApiTokensPost**
> ApiTokenCreated createTokenApiV1UsersMeApiTokensPost(apiTokenCreate)

Create Token

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getApiTokensApi();
final ApiTokenCreate apiTokenCreate = ; // ApiTokenCreate | 

try {
    final response = api.createTokenApiV1UsersMeApiTokensPost(apiTokenCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ApiTokensApi->createTokenApiV1UsersMeApiTokensPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiTokenCreate** | [**ApiTokenCreate**](ApiTokenCreate.md)|  | 

### Return type

[**ApiTokenCreated**](ApiTokenCreated.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTokensApiV1UsersMeApiTokensGet**
> BuiltList<ApiTokenPublic> listTokensApiV1UsersMeApiTokensGet()

List Tokens

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getApiTokensApi();

try {
    final response = api.listTokensApiV1UsersMeApiTokensGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ApiTokensApi->listTokensApiV1UsersMeApiTokensGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ApiTokenPublic&gt;**](ApiTokenPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeTokenApiV1UsersMeApiTokensTokenIdDelete**
> revokeTokenApiV1UsersMeApiTokensTokenIdDelete(tokenId)

Revoke Token

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getApiTokensApi();
final String tokenId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.revokeTokenApiV1UsersMeApiTokensTokenIdDelete(tokenId);
} on DioException catch (e) {
    print('Exception when calling ApiTokensApi->revokeTokenApiV1UsersMeApiTokensTokenIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

