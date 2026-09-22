# remora_api.api.ExportsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**exportSetApiV1SetsSetIdExportGet**](ExportsApi.md#exportsetapiv1setssetidexportget) | **GET** /api/v1/sets/{set_id}/export | Экспортировать набор


# **exportSetApiV1SetsSetIdExportGet**
> JsonObject exportSetApiV1SetsSetIdExportGet(setId, format, sideSeparator, cardSeparator, layout)

Экспортировать набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getExportsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String format = format_example; // String | 
final String sideSeparator = sideSeparator_example; // String | 
final String cardSeparator = cardSeparator_example; // String | 
final String layout = layout_example; // String | 

try {
    final response = api.exportSetApiV1SetsSetIdExportGet(setId, format, sideSeparator, cardSeparator, layout);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ExportsApi->exportSetApiV1SetsSetIdExportGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **format** | **String**|  | 
 **sideSeparator** | **String**|  | [optional] [default to '	']
 **cardSeparator** | **String**|  | [optional] [default to '
']
 **layout** | **String**|  | [optional] [default to 'double_sided']

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

