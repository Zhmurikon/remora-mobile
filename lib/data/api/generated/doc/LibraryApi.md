# remora_api.api.LibraryApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost**](LibraryApi.md#acceptlibraryupdateapiv1librarysaveidacceptpost) | **POST** /api/v1/library/{save_id}/accept | Принять обновление
[**courseLibraryStateApiV1LibraryCoursesSlugStateGet**](LibraryApi.md#courselibrarystateapiv1librarycoursesslugstateget) | **GET** /api/v1/library/courses/{slug}/state | Course Library State
[**libraryChangesApiV1LibrarySaveIdChangesGet**](LibraryApi.md#librarychangesapiv1librarysaveidchangesget) | **GET** /api/v1/library/{save_id}/changes | Изменения оригинала
[**listLibraryApiV1LibraryGet**](LibraryApi.md#listlibraryapiv1libraryget) | **GET** /api/v1/library | Сохранённые оригиналы
[**removeFromLibraryApiV1LibrarySaveIdDelete**](LibraryApi.md#removefromlibraryapiv1librarysaveiddelete) | **DELETE** /api/v1/library/{save_id} | Убрать сохранение
[**saveToLibraryApiV1LibraryPost**](LibraryApi.md#savetolibraryapiv1librarypost) | **POST** /api/v1/library | Сохранить оригинал


# **acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost**
> LibraryItem acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost(saveId)

Принять обновление

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();
final String saveId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost(saveId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->acceptLibraryUpdateApiV1LibrarySaveIdAcceptPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saveId** | **String**|  | 

### Return type

[**LibraryItem**](LibraryItem.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **courseLibraryStateApiV1LibraryCoursesSlugStateGet**
> LibraryState courseLibraryStateApiV1LibraryCoursesSlugStateGet(slug)

Course Library State

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();
final String slug = slug_example; // String | 

try {
    final response = api.courseLibraryStateApiV1LibraryCoursesSlugStateGet(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->courseLibraryStateApiV1LibraryCoursesSlugStateGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 

### Return type

[**LibraryState**](LibraryState.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **libraryChangesApiV1LibrarySaveIdChangesGet**
> LibraryDiff libraryChangesApiV1LibrarySaveIdChangesGet(saveId)

Изменения оригинала

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();
final String saveId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.libraryChangesApiV1LibrarySaveIdChangesGet(saveId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->libraryChangesApiV1LibrarySaveIdChangesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saveId** | **String**|  | 

### Return type

[**LibraryDiff**](LibraryDiff.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLibraryApiV1LibraryGet**
> BuiltList<LibraryItem> listLibraryApiV1LibraryGet()

Сохранённые оригиналы

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();

try {
    final response = api.listLibraryApiV1LibraryGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->listLibraryApiV1LibraryGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;LibraryItem&gt;**](LibraryItem.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeFromLibraryApiV1LibrarySaveIdDelete**
> removeFromLibraryApiV1LibrarySaveIdDelete(saveId)

Убрать сохранение

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();
final String saveId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.removeFromLibraryApiV1LibrarySaveIdDelete(saveId);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->removeFromLibraryApiV1LibrarySaveIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saveId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveToLibraryApiV1LibraryPost**
> LibraryItem saveToLibraryApiV1LibraryPost(librarySaveCreate)

Сохранить оригинал

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getLibraryApi();
final LibrarySaveCreate librarySaveCreate = ; // LibrarySaveCreate | 

try {
    final response = api.saveToLibraryApiV1LibraryPost(librarySaveCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LibraryApi->saveToLibraryApiV1LibraryPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **librarySaveCreate** | [**LibrarySaveCreate**](LibrarySaveCreate.md)|  | 

### Return type

[**LibraryItem**](LibraryItem.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

