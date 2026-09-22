# remora_api.api.AgentApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copyCourseApiV1AgentCoursesCourseIdCopyPost**](AgentApi.md#copycourseapiv1agentcoursescourseidcopypost) | **POST** /api/v1/agent/courses/{course_id}/copy | Copy Course
[**createCourseApiV1AgentCoursesPost**](AgentApi.md#createcourseapiv1agentcoursespost) | **POST** /api/v1/agent/courses | Create Course
[**createSetApiV1AgentSetsPost**](AgentApi.md#createsetapiv1agentsetspost) | **POST** /api/v1/agent/sets | Create Set
[**deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost**](AgentApi.md#deletecoursearticleapiv1agentcoursescourseidarticlesarticleiddeletepost) | **POST** /api/v1/agent/courses/{course_id}/articles/{article_id}/delete | Delete Course Article
[**deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost**](AgentApi.md#deletecoursesectionapiv1agentcoursescourseidsectionssectioniddeletepost) | **POST** /api/v1/agent/courses/{course_id}/sections/{section_id}/delete | Delete Course Section
[**getCourseApiV1AgentCoursesCourseIdGet**](AgentApi.md#getcourseapiv1agentcoursescourseidget) | **GET** /api/v1/agent/courses/{course_id} | Get Course
[**getCourseStructureApiV1AgentCoursesCourseIdStructureGet**](AgentApi.md#getcoursestructureapiv1agentcoursescourseidstructureget) | **GET** /api/v1/agent/courses/{course_id}/structure | Get Course Structure
[**getSetApiV1AgentSetsSetIdGet**](AgentApi.md#getsetapiv1agentsetssetidget) | **GET** /api/v1/agent/sets/{set_id} | Get Set
[**listCoursesApiV1AgentCoursesGet**](AgentApi.md#listcoursesapiv1agentcoursesget) | **GET** /api/v1/agent/courses | List Courses
[**listSetsApiV1AgentSetsGet**](AgentApi.md#listsetsapiv1agentsetsget) | **GET** /api/v1/agent/sets | List Sets
[**publishCourseApiV1AgentCoursesCourseIdPublishPost**](AgentApi.md#publishcourseapiv1agentcoursescourseidpublishpost) | **POST** /api/v1/agent/courses/{course_id}/publish | Publish Course
[**unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost**](AgentApi.md#unpublishcourseapiv1agentcoursescourseidunpublishpost) | **POST** /api/v1/agent/courses/{course_id}/unpublish | Unpublish Course
[**updateCourseApiV1AgentCoursesCourseIdPut**](AgentApi.md#updatecourseapiv1agentcoursescourseidput) | **PUT** /api/v1/agent/courses/{course_id} | Update Course
[**updateCourseStructureApiV1AgentCoursesCourseIdStructurePut**](AgentApi.md#updatecoursestructureapiv1agentcoursescourseidstructureput) | **PUT** /api/v1/agent/courses/{course_id}/structure | Update Course Structure
[**updateSetApiV1AgentSetsSetIdPut**](AgentApi.md#updatesetapiv1agentsetssetidput) | **PUT** /api/v1/agent/sets/{set_id} | Update Set


# **copyCourseApiV1AgentCoursesCourseIdCopyPost**
> CourseEditorDetail copyCourseApiV1AgentCoursesCourseIdCopyPost(courseId, idempotencyKey, courseCopyRequest)

Copy Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final CourseCopyRequest courseCopyRequest = ; // CourseCopyRequest | 

try {
    final response = api.copyCourseApiV1AgentCoursesCourseIdCopyPost(courseId, idempotencyKey, courseCopyRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->copyCourseApiV1AgentCoursesCourseIdCopyPost: $e\n');
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

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCourseApiV1AgentCoursesPost**
> AgentCourseDetail createCourseApiV1AgentCoursesPost(idempotencyKey, agentCourseWrite)

Create Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentCourseWrite agentCourseWrite = ; // AgentCourseWrite | 

try {
    final response = api.createCourseApiV1AgentCoursesPost(idempotencyKey, agentCourseWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->createCourseApiV1AgentCoursesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**|  | 
 **agentCourseWrite** | [**AgentCourseWrite**](AgentCourseWrite.md)|  | 

### Return type

[**AgentCourseDetail**](AgentCourseDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSetApiV1AgentSetsPost**
> AgentSetDetail createSetApiV1AgentSetsPost(idempotencyKey, agentSetWrite)

Create Set

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentSetWrite agentSetWrite = ; // AgentSetWrite | 

try {
    final response = api.createSetApiV1AgentSetsPost(idempotencyKey, agentSetWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->createSetApiV1AgentSetsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**|  | 
 **agentSetWrite** | [**AgentSetWrite**](AgentSetWrite.md)|  | 

### Return type

[**AgentSetDetail**](AgentSetDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost**
> CourseEditorDetail deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost(courseId, articleId, idempotencyKey, agentStructureDelete)

Delete Course Article

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String articleId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentStructureDelete agentStructureDelete = ; // AgentStructureDelete | 

try {
    final response = api.deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost(courseId, articleId, idempotencyKey, agentStructureDelete);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->deleteCourseArticleApiV1AgentCoursesCourseIdArticlesArticleIdDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **articleId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **agentStructureDelete** | [**AgentStructureDelete**](AgentStructureDelete.md)|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost**
> CourseEditorDetail deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost(courseId, sectionId, idempotencyKey, agentStructureDelete)

Delete Course Section

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String sectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentStructureDelete agentStructureDelete = ; // AgentStructureDelete | 

try {
    final response = api.deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost(courseId, sectionId, idempotencyKey, agentStructureDelete);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->deleteCourseSectionApiV1AgentCoursesCourseIdSectionsSectionIdDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **sectionId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **agentStructureDelete** | [**AgentStructureDelete**](AgentStructureDelete.md)|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCourseApiV1AgentCoursesCourseIdGet**
> AgentCourseDetail getCourseApiV1AgentCoursesCourseIdGet(courseId)

Get Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getCourseApiV1AgentCoursesCourseIdGet(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->getCourseApiV1AgentCoursesCourseIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**AgentCourseDetail**](AgentCourseDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCourseStructureApiV1AgentCoursesCourseIdStructureGet**
> CourseEditorDetail getCourseStructureApiV1AgentCoursesCourseIdStructureGet(courseId)

Get Course Structure

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getCourseStructureApiV1AgentCoursesCourseIdStructureGet(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->getCourseStructureApiV1AgentCoursesCourseIdStructureGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 

### Return type

[**CourseEditorDetail**](CourseEditorDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSetApiV1AgentSetsSetIdGet**
> AgentSetDetail getSetApiV1AgentSetsSetIdGet(setId)

Get Set

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getSetApiV1AgentSetsSetIdGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->getSetApiV1AgentSetsSetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**AgentSetDetail**](AgentSetDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCoursesApiV1AgentCoursesGet**
> BuiltList<CourseSummary> listCoursesApiV1AgentCoursesGet(offset, limit)

List Courses

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final int offset = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.listCoursesApiV1AgentCoursesGet(offset, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->listCoursesApiV1AgentCoursesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**BuiltList&lt;CourseSummary&gt;**](CourseSummary.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSetsApiV1AgentSetsGet**
> BuiltList<SetSummary> listSetsApiV1AgentSetsGet(offset, limit)

List Sets

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final int offset = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.listSetsApiV1AgentSetsGet(offset, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->listSetsApiV1AgentSetsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 20]

### Return type

[**BuiltList&lt;SetSummary&gt;**](SetSummary.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publishCourseApiV1AgentCoursesCourseIdPublishPost**
> CourseDetail publishCourseApiV1AgentCoursesCourseIdPublishPost(courseId, idempotencyKey, coursePublication)

Publish Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final CoursePublication coursePublication = ; // CoursePublication | 

try {
    final response = api.publishCourseApiV1AgentCoursesCourseIdPublishPost(courseId, idempotencyKey, coursePublication);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->publishCourseApiV1AgentCoursesCourseIdPublishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **coursePublication** | [**CoursePublication**](CoursePublication.md)|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost**
> CourseDetail unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost(courseId, idempotencyKey)

Unpublish Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 

try {
    final response = api.unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost(courseId, idempotencyKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->unpublishCourseApiV1AgentCoursesCourseIdUnpublishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **idempotencyKey** | **String**|  | 

### Return type

[**CourseDetail**](CourseDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCourseApiV1AgentCoursesCourseIdPut**
> AgentCourseDetail updateCourseApiV1AgentCoursesCourseIdPut(courseId, idempotencyKey, agentCourseUpdate)

Update Course

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentCourseUpdate agentCourseUpdate = ; // AgentCourseUpdate | 

try {
    final response = api.updateCourseApiV1AgentCoursesCourseIdPut(courseId, idempotencyKey, agentCourseUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->updateCourseApiV1AgentCoursesCourseIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **agentCourseUpdate** | [**AgentCourseUpdate**](AgentCourseUpdate.md)|  | 

### Return type

[**AgentCourseDetail**](AgentCourseDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCourseStructureApiV1AgentCoursesCourseIdStructurePut**
> CourseEditorDetail updateCourseStructureApiV1AgentCoursesCourseIdStructurePut(courseId, idempotencyKey, courseStructureWrite)

Update Course Structure

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final CourseStructureWrite courseStructureWrite = ; // CourseStructureWrite | 

try {
    final response = api.updateCourseStructureApiV1AgentCoursesCourseIdStructurePut(courseId, idempotencyKey, courseStructureWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->updateCourseStructureApiV1AgentCoursesCourseIdStructurePut: $e\n');
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

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSetApiV1AgentSetsSetIdPut**
> AgentSetDetail updateSetApiV1AgentSetsSetIdPut(setId, idempotencyKey, agentSetUpdate)

Update Set

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAgentApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String idempotencyKey = idempotencyKey_example; // String | 
final AgentSetUpdate agentSetUpdate = ; // AgentSetUpdate | 

try {
    final response = api.updateSetApiV1AgentSetsSetIdPut(setId, idempotencyKey, agentSetUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentApi->updateSetApiV1AgentSetsSetIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **idempotencyKey** | **String**|  | 
 **agentSetUpdate** | [**AgentSetUpdate**](AgentSetUpdate.md)|  | 

### Return type

[**AgentSetDetail**](AgentSetDetail.md)

### Authorization

[PersonalApiToken](../README.md#PersonalApiToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

