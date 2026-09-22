# remora_api.api.ImportsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost**](ImportsApi.md#createankijobapiv1importssetssetidankijobspost) | **POST** /api/v1/imports/sets/{set_id}/anki/jobs | Поставить импорт Anki в очередь
[**getImportJobApiV1ImportsJobsJobIdGet**](ImportsApi.md#getimportjobapiv1importsjobsjobidget) | **GET** /api/v1/imports/jobs/{job_id} | Статус импорта
[**importAnkiApiV1ImportsSetsSetIdAnkiPost**](ImportsApi.md#importankiapiv1importssetssetidankipost) | **POST** /api/v1/imports/sets/{set_id}/anki | Импортировать Anki
[**listImportJobsApiV1ImportsSetsSetIdJobsGet**](ImportsApi.md#listimportjobsapiv1importssetssetidjobsget) | **GET** /api/v1/imports/sets/{set_id}/jobs | Последние импорты набора


# **createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost**
> ImportJobPublic createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost(setId, filename)

Поставить импорт Anki в очередь

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getImportsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String filename = filename_example; // String | 

try {
    final response = api.createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost(setId, filename);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImportsApi->createAnkiJobApiV1ImportsSetsSetIdAnkiJobsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **filename** | **String**|  | 

### Return type

[**ImportJobPublic**](ImportJobPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getImportJobApiV1ImportsJobsJobIdGet**
> ImportJobPublic getImportJobApiV1ImportsJobsJobIdGet(jobId)

Статус импорта

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getImportsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getImportJobApiV1ImportsJobsJobIdGet(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImportsApi->getImportJobApiV1ImportsJobsJobIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  | 

### Return type

[**ImportJobPublic**](ImportJobPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **importAnkiApiV1ImportsSetsSetIdAnkiPost**
> AnkiImportResult importAnkiApiV1ImportsSetsSetIdAnkiPost(setId, filename)

Импортировать Anki

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getImportsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String filename = filename_example; // String | 

try {
    final response = api.importAnkiApiV1ImportsSetsSetIdAnkiPost(setId, filename);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImportsApi->importAnkiApiV1ImportsSetsSetIdAnkiPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **filename** | **String**|  | 

### Return type

[**AnkiImportResult**](AnkiImportResult.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listImportJobsApiV1ImportsSetsSetIdJobsGet**
> BuiltList<ImportJobPublic> listImportJobsApiV1ImportsSetsSetIdJobsGet(setId)

Последние импорты набора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getImportsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.listImportJobsApiV1ImportsSetsSetIdJobsGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ImportsApi->listImportJobsApiV1ImportsSetsSetIdJobsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**BuiltList&lt;ImportJobPublic&gt;**](ImportJobPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

