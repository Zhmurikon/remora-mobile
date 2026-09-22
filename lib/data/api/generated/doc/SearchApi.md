# remora_api.api.SearchApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**coursesApiV1SearchCoursesGet**](SearchApi.md#coursesapiv1searchcoursesget) | **GET** /api/v1/search/courses | Поиск публичных курсов
[**selectedApiV1SearchCoursesSelectedGet**](SearchApi.md#selectedapiv1searchcoursesselectedget) | **GET** /api/v1/search/courses/selected | Выбранные публичные курсы


# **coursesApiV1SearchCoursesGet**
> CourseSearchResult coursesApiV1SearchCoursesGet(q, tag, language, authorId, minCards, maxCards, updatedAfter, sort, cursor, limit)

Поиск публичных курсов

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSearchApi();
final String q = q_example; // String | 
final String tag = tag_example; // String | 
final String language = language_example; // String | 
final String authorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int minCards = 56; // int | 
final int maxCards = 56; // int | 
final DateTime updatedAfter = 2013-10-20T19:20:30+01:00; // DateTime | 
final String sort = sort_example; // String | 
final int cursor = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.coursesApiV1SearchCoursesGet(q, tag, language, authorId, minCards, maxCards, updatedAfter, sort, cursor, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->coursesApiV1SearchCoursesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**|  | [optional] [default to '']
 **tag** | **String**|  | [optional] 
 **language** | **String**|  | [optional] 
 **authorId** | **String**|  | [optional] 
 **minCards** | **int**|  | [optional] [default to 0]
 **maxCards** | **int**|  | [optional] 
 **updatedAfter** | **DateTime**|  | [optional] 
 **sort** | **String**|  | [optional] [default to 'relevance']
 **cursor** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**CourseSearchResult**](CourseSearchResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectedApiV1SearchCoursesSelectedGet**
> BuiltList<CourseSearchItem> selectedApiV1SearchCoursesSelectedGet(ids)

Выбранные публичные курсы

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getSearchApi();
final BuiltList<String?> ids = ; // BuiltList<String?> | 

try {
    final response = api.selectedApiV1SearchCoursesSelectedGet(ids);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->selectedApiV1SearchCoursesSelectedGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**BuiltList&lt;String?&gt;**](String.md)|  | 

### Return type

[**BuiltList&lt;CourseSearchItem&gt;**](CourseSearchItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

