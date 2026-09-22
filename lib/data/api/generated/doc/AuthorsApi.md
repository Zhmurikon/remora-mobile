# remora_api.api.AuthorsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authorProfileApiV1AuthorsUsernameGet**](AuthorsApi.md#authorprofileapiv1authorsusernameget) | **GET** /api/v1/authors/{username} | Публичный профиль автора


# **authorProfileApiV1AuthorsUsernameGet**
> AuthorProfile authorProfileApiV1AuthorsUsernameGet(username)

Публичный профиль автора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthorsApi();
final String username = username_example; // String | 

try {
    final response = api.authorProfileApiV1AuthorsUsernameGet(username);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthorsApi->authorProfileApiV1AuthorsUsernameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 

### Return type

[**AuthorProfile**](AuthorProfile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

