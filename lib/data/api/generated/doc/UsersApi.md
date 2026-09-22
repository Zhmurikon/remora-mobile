# remora_api.api.UsersApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createAccountExportApiV1UsersMeExportPost**](UsersApi.md#createaccountexportapiv1usersmeexportpost) | **POST** /api/v1/users/me/export | Запросить полный экспорт аккаунта
[**getAccountExportApiV1UsersMeExportJobIdGet**](UsersApi.md#getaccountexportapiv1usersmeexportjobidget) | **GET** /api/v1/users/me/export/{job_id} | Статус экспорта аккаунта
[**latestAccountExportApiV1UsersMeExportLatestGet**](UsersApi.md#latestaccountexportapiv1usersmeexportlatestget) | **GET** /api/v1/users/me/export/latest | Последний экспорт аккаунта


# **createAccountExportApiV1UsersMeExportPost**
> AccountExportPublic createAccountExportApiV1UsersMeExportPost()

Запросить полный экспорт аккаунта

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getUsersApi();

try {
    final response = api.createAccountExportApiV1UsersMeExportPost();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->createAccountExportApiV1UsersMeExportPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AccountExportPublic**](AccountExportPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountExportApiV1UsersMeExportJobIdGet**
> AccountExportPublic getAccountExportApiV1UsersMeExportJobIdGet(jobId)

Статус экспорта аккаунта

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getUsersApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getAccountExportApiV1UsersMeExportJobIdGet(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->getAccountExportApiV1UsersMeExportJobIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  | 

### Return type

[**AccountExportPublic**](AccountExportPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **latestAccountExportApiV1UsersMeExportLatestGet**
> AccountExportPublic latestAccountExportApiV1UsersMeExportLatestGet()

Последний экспорт аккаунта

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getUsersApi();

try {
    final response = api.latestAccountExportApiV1UsersMeExportLatestGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->latestAccountExportApiV1UsersMeExportLatestGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AccountExportPublic**](AccountExportPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

