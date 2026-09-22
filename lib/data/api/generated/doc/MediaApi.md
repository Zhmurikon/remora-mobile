# remora_api.api.MediaApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeUploadApiV1MediaAssetIdCompletePost**](MediaApi.md#completeuploadapiv1mediaassetidcompletepost) | **POST** /api/v1/media/{asset_id}/complete | Завершить загрузку
[**createUploadUrlApiV1MediaUploadUrlPost**](MediaApi.md#createuploadurlapiv1mediauploadurlpost) | **POST** /api/v1/media/upload-url | Получить ссылку для загрузки изображения
[**deleteAssetApiV1MediaAssetIdDelete**](MediaApi.md#deleteassetapiv1mediaassetiddelete) | **DELETE** /api/v1/media/{asset_id} | Удалить изображение
[**getAssetApiV1MediaAssetIdGet**](MediaApi.md#getassetapiv1mediaassetidget) | **GET** /api/v1/media/{asset_id} | Получить изображение


# **completeUploadApiV1MediaAssetIdCompletePost**
> MediaAssetPublic completeUploadApiV1MediaAssetIdCompletePost(assetId)

Завершить загрузку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getMediaApi();
final String assetId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.completeUploadApiV1MediaAssetIdCompletePost(assetId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaApi->completeUploadApiV1MediaAssetIdCompletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assetId** | **String**|  | 

### Return type

[**MediaAssetPublic**](MediaAssetPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUploadUrlApiV1MediaUploadUrlPost**
> ImageUploadTicket createUploadUrlApiV1MediaUploadUrlPost(imageUploadRequest)

Получить ссылку для загрузки изображения

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getMediaApi();
final ImageUploadRequest imageUploadRequest = ; // ImageUploadRequest | 

try {
    final response = api.createUploadUrlApiV1MediaUploadUrlPost(imageUploadRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaApi->createUploadUrlApiV1MediaUploadUrlPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **imageUploadRequest** | [**ImageUploadRequest**](ImageUploadRequest.md)|  | 

### Return type

[**ImageUploadTicket**](ImageUploadTicket.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAssetApiV1MediaAssetIdDelete**
> deleteAssetApiV1MediaAssetIdDelete(assetId)

Удалить изображение

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getMediaApi();
final String assetId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteAssetApiV1MediaAssetIdDelete(assetId);
} on DioException catch (e) {
    print('Exception when calling MediaApi->deleteAssetApiV1MediaAssetIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assetId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAssetApiV1MediaAssetIdGet**
> MediaAssetPublic getAssetApiV1MediaAssetIdGet(assetId)

Получить изображение

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getMediaApi();
final String assetId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getAssetApiV1MediaAssetIdGet(assetId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaApi->getAssetApiV1MediaAssetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assetId** | **String**|  | 

### Return type

[**MediaAssetPublic**](MediaAssetPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

