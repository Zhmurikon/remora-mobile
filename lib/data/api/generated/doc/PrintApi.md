# remora_api.api.PrintApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**printCardsApiV1PrintSetsSetIdCardsGet**](PrintApi.md#printcardsapiv1printsetssetidcardsget) | **GET** /api/v1/print/sets/{set_id}/cards | Карточки для вырезания
[**printTermsApiV1PrintSetsSetIdTermsGet**](PrintApi.md#printtermsapiv1printsetssetidtermsget) | **GET** /api/v1/print/sets/{set_id}/terms | Список терминов
[**printTestApiV1PrintTestsAttemptIdGet**](PrintApi.md#printtestapiv1printtestsattemptidget) | **GET** /api/v1/print/tests/{attempt_id} | Тест на печать


# **printCardsApiV1PrintSetsSetIdCardsGet**
> JsonObject printCardsApiV1PrintSetsSetIdCardsGet(setId, layout)

Карточки для вырезания

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getPrintApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String layout = layout_example; // String | 

try {
    final response = api.printCardsApiV1PrintSetsSetIdCardsGet(setId, layout);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PrintApi->printCardsApiV1PrintSetsSetIdCardsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **layout** | **String**|  | [optional] [default to 'double_sided']

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **printTermsApiV1PrintSetsSetIdTermsGet**
> JsonObject printTermsApiV1PrintSetsSetIdTermsGet(setId)

Список терминов

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getPrintApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.printTermsApiV1PrintSetsSetIdTermsGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PrintApi->printTermsApiV1PrintSetsSetIdTermsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **printTestApiV1PrintTestsAttemptIdGet**
> JsonObject printTestApiV1PrintTestsAttemptIdGet(attemptId, answers)

Тест на печать

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getPrintApi();
final String attemptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final bool answers = true; // bool | Печатать ключ вместо бланка

try {
    final response = api.printTestApiV1PrintTestsAttemptIdGet(attemptId, answers);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PrintApi->printTestApiV1PrintTestsAttemptIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attemptId** | **String**|  | 
 **answers** | **bool**| Печатать ключ вместо бланка | [optional] [default to false]

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

