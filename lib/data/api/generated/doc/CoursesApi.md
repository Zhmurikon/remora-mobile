# remora_api.api.CoursesApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copyCourseApiV1CoursesCourseIdCopyPost**](CoursesApi.md#copycourseapiv1coursescourseidcopypost) | **POST** /api/v1/courses/{course_id}/copy | Copy Course
[**courseEditorApiV1CoursesCourseIdEditorGet**](CoursesApi.md#courseeditorapiv1coursescourseideditorget) | **GET** /api/v1/courses/{course_id}/editor | Course Editor
[**courseSitemapApiV1CoursesSitemapGet**](CoursesApi.md#coursesitemapapiv1coursessitemapget) | **GET** /api/v1/courses/sitemap | Карта публичных курсов
[**createCourseApiV1CoursesPost**](CoursesApi.md#createcourseapiv1coursespost) | **POST** /api/v1/courses | Создать курс из набора
[**getCourseApiV1CoursesCourseIdGet**](CoursesApi.md#getcourseapiv1coursescourseidget) | **GET** /api/v1/courses/{course_id} | Структура моего курса
[**likeCourseApiV1CoursesPublicSlugLikePost**](CoursesApi.md#likecourseapiv1coursespublicsluglikepost) | **POST** /api/v1/courses/public/{slug}/like | Поставить лайк курсу
[**listCoursesApiV1CoursesGet**](CoursesApi.md#listcoursesapiv1coursesget) | **GET** /api/v1/courses | Мои курсы
[**publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet**](CoursesApi.md#publicarticleapiv1coursespublicslugarticlesarticleidget) | **GET** /api/v1/courses/public/{slug}/articles/{article_id} | Карточки статьи курса
[**publicCourseApiV1CoursesPublicSlugGet**](CoursesApi.md#publiccourseapiv1coursespublicslugget) | **GET** /api/v1/courses/public/{slug} | Опубликованный курс
[**publishCourseApiV1CoursesCourseIdPublishPost**](CoursesApi.md#publishcourseapiv1coursescourseidpublishpost) | **POST** /api/v1/courses/{course_id}/publish | Опубликовать курс
[**relatedCoursesApiV1CoursesPublicSlugRelatedGet**](CoursesApi.md#relatedcoursesapiv1coursespublicslugrelatedget) | **GET** /api/v1/courses/public/{slug}/related | Похожие курсы
[**reportCourseApiV1CoursesPublicSlugReportPost**](CoursesApi.md#reportcourseapiv1coursespublicslugreportpost) | **POST** /api/v1/courses/public/{slug}/report | Пожаловаться на курс
[**saveStructureApiV1CoursesCourseIdStructurePut**](CoursesApi.md#savestructureapiv1coursescourseidstructureput) | **PUT** /api/v1/courses/{course_id}/structure | Save Structure
[**unlikeCourseApiV1CoursesPublicSlugLikeDelete**](CoursesApi.md#unlikecourseapiv1coursespublicsluglikedelete) | **DELETE** /api/v1/courses/public/{slug}/like | Убрать лайк с курса
[**unpublishCourseApiV1CoursesCourseIdUnpublishPost**](CoursesApi.md#unpublishcourseapiv1coursescourseidunpublishpost) | **POST** /api/v1/courses/{course_id}/unpublish | Снять курс с публикации
[**updateCourseApiV1CoursesCourseIdPut**](CoursesApi.md#updatecourseapiv1coursescourseidput) | **PUT** /api/v1/courses/{course_id} | Изменить описание курса


# **copyCourseApiV1CoursesCourseIdCopyPost**
> CourseEditorDetail copyCourseApiV1CoursesCourseIdCopyPost(courseId, idempotencyKey, courseCopyRequest)

Copy Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final CourseCopyRequest courseCopyRequest = ; // CourseCopyRequest | 

try {
    final response = api.copyCourseApiV1CoursesCourseIdCopyPost(courseId, idempotencyKey, courseCopyRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->copyCourseApiV1CoursesCourseIdCopyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **courseCopyRequest** | [**CourseCopyRequest**](CourseCopyRequest.md)|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **courseEditorApiV1CoursesCourseIdEditorGet**
> CourseEditorDetail courseEditorApiV1CoursesCourseIdEditorGet(courseId)

Course Editor

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.courseEditorApiV1CoursesCourseIdEditorGet(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->courseEditorApiV1CoursesCourseIdEditorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **courseSitemapApiV1CoursesSitemapGet**
> BuiltList<CourseSitemapEntry> courseSitemapApiV1CoursesSitemapGet()

Карта публичных курсов

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();

try {
    final response = api.courseSitemapApiV1CoursesSitemapGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->courseSitemapApiV1CoursesSitemapGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CourseSitemapEntry&gt;**](CourseSitemapEntry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCourseApiV1CoursesPost**
> CourseDetail createCourseApiV1CoursesPost(courseCreate)

Создать курс из набора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final CourseCreate courseCreate = ; // CourseCreate | 

try {
    final response = api.createCourseApiV1CoursesPost(courseCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->createCourseApiV1CoursesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseCreate** | [**CourseCreate**](CourseCreate.md)|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCourseApiV1CoursesCourseIdGet**
> CourseDetail getCourseApiV1CoursesCourseIdGet(courseId)

Структура моего курса

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getCourseApiV1CoursesCourseIdGet(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->getCourseApiV1CoursesCourseIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **likeCourseApiV1CoursesPublicSlugLikePost**
> CourseDetail likeCourseApiV1CoursesPublicSlugLikePost(slug)

Поставить лайк курсу

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 

try {
    final response = api.likeCourseApiV1CoursesPublicSlugLikePost(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->likeCourseApiV1CoursesPublicSlugLikePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCoursesApiV1CoursesGet**
> BuiltList<CourseSummary> listCoursesApiV1CoursesGet()

Мои курсы

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();

try {
    final response = api.listCoursesApiV1CoursesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->listCoursesApiV1CoursesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CourseSummary&gt;**](CourseSummary.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet**
> PublicSet publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet(slug, articleId, after, revision)

Карточки статьи курса

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 
final String articleId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int after = 56; // int | 
final DateTime revision = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet(slug, articleId, after, revision);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->publicArticleApiV1CoursesPublicSlugArticlesArticleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 
 **articleId** | **String**|  | 
 **after** | **int**|  | [optional] 
 **revision** | **DateTime**|  | [optional] 

### Return type

[**PublicSet**](PublicSet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publicCourseApiV1CoursesPublicSlugGet**
> CourseDetail publicCourseApiV1CoursesPublicSlugGet(slug)

Опубликованный курс

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 

try {
    final response = api.publicCourseApiV1CoursesPublicSlugGet(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->publicCourseApiV1CoursesPublicSlugGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publishCourseApiV1CoursesCourseIdPublishPost**
> CourseDetail publishCourseApiV1CoursesCourseIdPublishPost(courseId, coursePublication)

Опубликовать курс

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final CoursePublication coursePublication = ; // CoursePublication | 

try {
    final response = api.publishCourseApiV1CoursesCourseIdPublishPost(courseId, coursePublication);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->publishCourseApiV1CoursesCourseIdPublishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **coursePublication** | [**CoursePublication**](CoursePublication.md)|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **relatedCoursesApiV1CoursesPublicSlugRelatedGet**
> BuiltList<CourseSearchItem> relatedCoursesApiV1CoursesPublicSlugRelatedGet(slug, limit)

Похожие курсы

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 
final int limit = 56; // int | 

try {
    final response = api.relatedCoursesApiV1CoursesPublicSlugRelatedGet(slug, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->relatedCoursesApiV1CoursesPublicSlugRelatedGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 
 **limit** | **int**|  | [optional] [default to 4]

### Return type

[**BuiltList&lt;CourseSearchItem&gt;**](CourseSearchItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportCourseApiV1CoursesPublicSlugReportPost**
> ReportSubmitted reportCourseApiV1CoursesPublicSlugReportPost(slug, reportCreate)

Пожаловаться на курс

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 
final ReportCreate reportCreate = ; // ReportCreate | 

try {
    final response = api.reportCourseApiV1CoursesPublicSlugReportPost(slug, reportCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->reportCourseApiV1CoursesPublicSlugReportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 
 **reportCreate** | [**ReportCreate**](ReportCreate.md)|  | 

### Return type

[**ReportSubmitted**](ReportSubmitted.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveStructureApiV1CoursesCourseIdStructurePut**
> CourseEditorDetail saveStructureApiV1CoursesCourseIdStructurePut(courseId, idempotencyKey, courseStructureWrite)

Save Structure

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final CourseStructureWrite courseStructureWrite = ; // CourseStructureWrite | 

try {
    final response = api.saveStructureApiV1CoursesCourseIdStructurePut(courseId, idempotencyKey, courseStructureWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->saveStructureApiV1CoursesCourseIdStructurePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **courseStructureWrite** | [**CourseStructureWrite**](CourseStructureWrite.md)|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unlikeCourseApiV1CoursesPublicSlugLikeDelete**
> CourseDetail unlikeCourseApiV1CoursesPublicSlugLikeDelete(slug)

Убрать лайк с курса

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String slug = slug_example; // String | 

try {
    final response = api.unlikeCourseApiV1CoursesPublicSlugLikeDelete(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->unlikeCourseApiV1CoursesPublicSlugLikeDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unpublishCourseApiV1CoursesCourseIdUnpublishPost**
> CourseDetail unpublishCourseApiV1CoursesCourseIdUnpublishPost(courseId)

Снять курс с публикации

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.unpublishCourseApiV1CoursesCourseIdUnpublishPost(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->unpublishCourseApiV1CoursesCourseIdUnpublishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCourseApiV1CoursesCourseIdPut**
> CourseDetail updateCourseApiV1CoursesCourseIdPut(courseId, courseMetadata)

Изменить описание курса

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final CourseMetadata courseMetadata = ; // CourseMetadata | 

try {
    final response = api.updateCourseApiV1CoursesCourseIdPut(courseId, courseMetadata);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->updateCourseApiV1CoursesCourseIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **courseMetadata** | [**CourseMetadata**](CourseMetadata.md)|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

