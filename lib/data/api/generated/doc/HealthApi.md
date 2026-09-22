# remora_api.api.HealthApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthApiV1HealthGet**](HealthApi.md#healthapiv1healthget) | **GET** /api/v1/health | Живость приложения
[**readyApiV1ReadyGet**](HealthApi.md#readyapiv1readyget) | **GET** /api/v1/ready | Готовность зависимостей


# **healthApiV1HealthGet**
> HealthResponse healthApiV1HealthGet()

Живость приложения

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getHealthApi();

try {
    final response = api.healthApiV1HealthGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->healthApiV1HealthGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HealthResponse**](HealthResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readyApiV1ReadyGet**
> ReadinessResponse readyApiV1ReadyGet()

Готовность зависимостей

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getHealthApi();

try {
    final response = api.readyApiV1ReadyGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->readyApiV1ReadyGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ReadinessResponse**](ReadinessResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

