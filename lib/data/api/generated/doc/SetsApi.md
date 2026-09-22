# remora_api.api.SetsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copySetApiV1SetsSetIdCopyPost**](SetsApi.md#copysetapiv1setssetidcopypost) | **POST** /api/v1/sets/{set_id}/copy | Независимая копия набора из доступного курса
[**createSetApiV1SetsPost**](SetsApi.md#createsetapiv1setspost) | **POST** /api/v1/sets | Создать набор
[**deleteSetApiV1SetsSetIdDelete**](SetsApi.md#deletesetapiv1setssetiddelete) | **DELETE** /api/v1/sets/{set_id} | Удалить набор
[**duplicateSetApiV1SetsSetIdDuplicatePost**](SetsApi.md#duplicatesetapiv1setssetidduplicatepost) | **POST** /api/v1/sets/{set_id}/duplicate | Дублировать набор
[**getPublicSetApiV1SetsPublicSlugGet**](SetsApi.md#getpublicsetapiv1setspublicslugget) | **GET** /api/v1/sets/public/{slug} | Публичный набор по ссылке
[**getSetApiV1SetsSetIdGet**](SetsApi.md#getsetapiv1setssetidget) | **GET** /api/v1/sets/{set_id} | Получить набор
[**listSetsApiV1SetsGet**](SetsApi.md#listsetsapiv1setsget) | **GET** /api/v1/sets | Мои наборы
[**syncCardsApiV1SetsSetIdCardsPut**](SetsApi.md#synccardsapiv1setssetidcardsput) | **PUT** /api/v1/sets/{set_id}/cards | Сохранить карточки
[**updateSetApiV1SetsSetIdPatch**](SetsApi.md#updatesetapiv1setssetidpatch) | **PATCH** /api/v1/sets/{set_id} | Изменить набор


# **copySetApiV1SetsSetIdCopyPost**
> SetDetail copySetApiV1SetsSetIdCopyPost(setId, idempotencyKey)

Независимая копия набора из доступного курса

В отличие от `/duplicate`, копирует и чужой доступный набор с собственными медиа.

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 

try {
    final response = api.copySetApiV1SetsSetIdCopyPost(setId, idempotencyKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->copySetApiV1SetsSetIdCopyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **idempotencyKey** | **String**|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSetApiV1SetsPost**
> SetDetail createSetApiV1SetsPost(setCreate)

Создать набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final SetCreate setCreate = ; // SetCreate | 

try {
    final response = api.createSetApiV1SetsPost(setCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->createSetApiV1SetsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setCreate** | [**SetCreate**](SetCreate.md)|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSetApiV1SetsSetIdDelete**
> deleteSetApiV1SetsSetIdDelete(setId)

Удалить набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteSetApiV1SetsSetIdDelete(setId);
} on DioException catch (e) {
    print('Exception when calling SetsApi->deleteSetApiV1SetsSetIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **duplicateSetApiV1SetsSetIdDuplicatePost**
> SetDetail duplicateSetApiV1SetsSetIdDuplicatePost(setId)

Дублировать набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.duplicateSetApiV1SetsSetIdDuplicatePost(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->duplicateSetApiV1SetsSetIdDuplicatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPublicSetApiV1SetsPublicSlugGet**
> PublicSet getPublicSetApiV1SetsPublicSlugGet(slug)

Публичный набор по ссылке

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String slug = slug_example; // String | 

try {
    final response = api.getPublicSetApiV1SetsPublicSlugGet(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->getPublicSetApiV1SetsPublicSlugGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 

### Return type

[**PublicSet**](PublicSet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSetApiV1SetsSetIdGet**
> SetDetail getSetApiV1SetsSetIdGet(setId)

Получить набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getSetApiV1SetsSetIdGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->getSetApiV1SetsSetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSetsApiV1SetsGet**
> BuiltList<SetSummary> listSetsApiV1SetsGet()

Мои наборы

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();

try {
    final response = api.listSetsApiV1SetsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->listSetsApiV1SetsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SetSummary&gt;**](SetSummary.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncCardsApiV1SetsSetIdCardsPut**
> SetDetail syncCardsApiV1SetsSetIdCardsPut(setId, cardBatch)

Сохранить карточки

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final CardBatch cardBatch = ; // CardBatch | 

try {
    final response = api.syncCardsApiV1SetsSetIdCardsPut(setId, cardBatch);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->syncCardsApiV1SetsSetIdCardsPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **cardBatch** | [**CardBatch**](CardBatch.md)|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSetApiV1SetsSetIdPatch**
> SetDetail updateSetApiV1SetsSetIdPatch(setId, setUpdate)

Изменить набор

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSetsApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final SetUpdate setUpdate = ; // SetUpdate | 

try {
    final response = api.updateSetApiV1SetsSetIdPatch(setId, setUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SetsApi->updateSetApiV1SetsSetIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **setUpdate** | [**SetUpdate**](SetUpdate.md)|  | 

### Return type

[**SetDetail**](SetDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

