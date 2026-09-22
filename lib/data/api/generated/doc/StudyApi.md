# remora_api.api.StudyApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTestApiV1StudySetsSetIdTestsPost**](StudyApi.md#createtestapiv1studysetssetidtestspost) | **POST** /api/v1/study/sets/{set_id}/tests | Собрать тест по набору
[**finishSessionApiV1StudySessionsSessionIdFinishPost**](StudyApi.md#finishsessionapiv1studysessionssessionidfinishpost) | **POST** /api/v1/study/sessions/{session_id}/finish | Завершить тренировку
[**getActiveSessionApiV1StudySessionsActiveGet**](StudyApi.md#getactivesessionapiv1studysessionsactiveget) | **GET** /api/v1/study/sessions/active | Незавершённая тренировка
[**getForecastApiV1StudyForecastGet**](StudyApi.md#getforecastapiv1studyforecastget) | **GET** /api/v1/study/forecast | Прогноз нагрузки на ближайшие дни
[**getQueueApiV1StudySetsSetIdQueueGet**](StudyApi.md#getqueueapiv1studysetssetidqueueget) | **GET** /api/v1/study/sets/{set_id}/queue | Очередь карточек на тренировку
[**getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet**](StudyApi.md#getsetlearnsettingsapiv1studysetssetidlearnsettingsget) | **GET** /api/v1/study/sets/{set_id}/learn-settings | Настройки заучивания для набора
[**getSetStatsApiV1StudySetsSetIdStatsGet**](StudyApi.md#getsetstatsapiv1studysetssetidstatsget) | **GET** /api/v1/study/sets/{set_id}/stats | Статистика по набору
[**getStudySettingsApiV1StudySettingsGet**](StudyApi.md#getstudysettingsapiv1studysettingsget) | **GET** /api/v1/study/settings | Настройки обучения
[**getTestApiV1StudyTestsAttemptIdGet**](StudyApi.md#gettestapiv1studytestsattemptidget) | **GET** /api/v1/study/tests/{attempt_id} | Попытка теста
[**getTestResultApiV1StudyTestsAttemptIdResultGet**](StudyApi.md#gettestresultapiv1studytestsattemptidresultget) | **GET** /api/v1/study/tests/{attempt_id}/result | Разбор теста
[**resetProgressApiV1StudySetsSetIdResetPost**](StudyApi.md#resetprogressapiv1studysetssetidresetpost) | **POST** /api/v1/study/sets/{set_id}/reset | Сбросить свой прогресс набора в обоих направлениях
[**resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete**](StudyApi.md#resetsetlearnsettingsapiv1studysetssetidlearnsettingsdelete) | **DELETE** /api/v1/study/sets/{set_id}/learn-settings | Вернуть общие настройки заучивания для набора
[**retakeTestApiV1StudyTestsAttemptIdRetakePost**](StudyApi.md#retaketestapiv1studytestsattemptidretakepost) | **POST** /api/v1/study/tests/{attempt_id}/retake | Пересдать ошибки
[**startSessionApiV1StudySessionsPost**](StudyApi.md#startsessionapiv1studysessionspost) | **POST** /api/v1/study/sessions | Начать тренировку
[**submitReviewsApiV1StudyReviewsPost**](StudyApi.md#submitreviewsapiv1studyreviewspost) | **POST** /api/v1/study/reviews | Отправить ответы батчем
[**submitTestApiV1StudyTestsAttemptIdSubmitPost**](StudyApi.md#submittestapiv1studytestsattemptidsubmitpost) | **POST** /api/v1/study/tests/{attempt_id}/submit | Проверить ответы теста
[**updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut**](StudyApi.md#updatesetlearnsettingsapiv1studysetssetidlearnsettingsput) | **PUT** /api/v1/study/sets/{set_id}/learn-settings | Переопределить настройки заучивания для набора
[**updateStudySettingsApiV1StudySettingsPatch**](StudyApi.md#updatestudysettingsapiv1studysettingspatch) | **PATCH** /api/v1/study/settings | Изменить настройки обучения


# **createTestApiV1StudySetsSetIdTestsPost**
> TestAttemptOut createTestApiV1StudySetsSetIdTestsPost(setId, testConfig)

Собрать тест по набору

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TestConfig testConfig = ; // TestConfig | 

try {
    final response = api.createTestApiV1StudySetsSetIdTestsPost(setId, testConfig);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->createTestApiV1StudySetsSetIdTestsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **testConfig** | [**TestConfig**](TestConfig.md)|  | 

### Return type

[**TestAttemptOut**](TestAttemptOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **finishSessionApiV1StudySessionsSessionIdFinishPost**
> SessionOut finishSessionApiV1StudySessionsSessionIdFinishPost(sessionId)

Завершить тренировку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String sessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.finishSessionApiV1StudySessionsSessionIdFinishPost(sessionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->finishSessionApiV1StudySessionsSessionIdFinishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**SessionOut**](SessionOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getActiveSessionApiV1StudySessionsActiveGet**
> SessionOut getActiveSessionApiV1StudySessionsActiveGet(setId, mode)

Незавершённая тренировка

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final StudyMode mode = ; // StudyMode | 

try {
    final response = api.getActiveSessionApiV1StudySessionsActiveGet(setId, mode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getActiveSessionApiV1StudySessionsActiveGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **mode** | [**StudyMode**](.md)|  | [optional] 

### Return type

[**SessionOut**](SessionOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getForecastApiV1StudyForecastGet**
> BuiltList<ForecastDay> getForecastApiV1StudyForecastGet(days, setId)

Прогноз нагрузки на ближайшие дни

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final int days = 56; // int | 
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getForecastApiV1StudyForecastGet(days, setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getForecastApiV1StudyForecastGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **days** | **int**|  | [optional] [default to 14]
 **setId** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;ForecastDay&gt;**](ForecastDay.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQueueApiV1StudySetsSetIdQueueGet**
> StudyQueue getQueueApiV1StudySetsSetIdQueueGet(setId, mode, scope, direction, limit, shuffle)

Очередь карточек на тренировку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final StudyMode mode = ; // StudyMode | 
final QueueScope scope = ; // QueueScope | 
final DirectionMode direction = ; // DirectionMode | 
final int limit = 56; // int | 
final bool shuffle = true; // bool | 

try {
    final response = api.getQueueApiV1StudySetsSetIdQueueGet(setId, mode, scope, direction, limit, shuffle);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getQueueApiV1StudySetsSetIdQueueGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **mode** | [**StudyMode**](.md)|  | [optional] [default to learn]
 **scope** | [**QueueScope**](.md)|  | [optional] [default to due]
 **direction** | [**DirectionMode**](.md)|  | [optional] [default to term_to_def]
 **limit** | **int**|  | [optional] [default to 60]
 **shuffle** | **bool**|  | [optional] [default to true]

### Return type

[**StudyQueue**](StudyQueue.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet**
> SetLearnSettingsOut getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet(setId)

Настройки заучивания для набора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getSetLearnSettingsApiV1StudySetsSetIdLearnSettingsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**SetLearnSettingsOut**](SetLearnSettingsOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSetStatsApiV1StudySetsSetIdStatsGet**
> SetStats getSetStatsApiV1StudySetsSetIdStatsGet(setId)

Статистика по набору

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getSetStatsApiV1StudySetsSetIdStatsGet(setId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getSetStatsApiV1StudySetsSetIdStatsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 

### Return type

[**SetStats**](SetStats.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudySettingsApiV1StudySettingsGet**
> StudySettingsOut getStudySettingsApiV1StudySettingsGet()

Настройки обучения

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();

try {
    final response = api.getStudySettingsApiV1StudySettingsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getStudySettingsApiV1StudySettingsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**StudySettingsOut**](StudySettingsOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTestApiV1StudyTestsAttemptIdGet**
> TestAttemptOut getTestApiV1StudyTestsAttemptIdGet(attemptId)

Попытка теста

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String attemptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getTestApiV1StudyTestsAttemptIdGet(attemptId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getTestApiV1StudyTestsAttemptIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attemptId** | **String**|  | 

### Return type

[**TestAttemptOut**](TestAttemptOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTestResultApiV1StudyTestsAttemptIdResultGet**
> TestResult getTestResultApiV1StudyTestsAttemptIdResultGet(attemptId)

Разбор теста

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String attemptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getTestResultApiV1StudyTestsAttemptIdResultGet(attemptId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->getTestResultApiV1StudyTestsAttemptIdResultGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attemptId** | **String**|  | 

### Return type

[**TestResult**](TestResult.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetProgressApiV1StudySetsSetIdResetPost**
> resetProgressApiV1StudySetsSetIdResetPost(setId)

Сбросить свой прогресс набора в обоих направлениях

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.resetProgressApiV1StudySetsSetIdResetPost(setId);
} on DioException catch (e) {
    print('Exception when calling StudyApi->resetProgressApiV1StudySetsSetIdResetPost: $e\n');
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

# **resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete**
> resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete(setId)

Вернуть общие настройки заучивания для набора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete(setId);
} on DioException catch (e) {
    print('Exception when calling StudyApi->resetSetLearnSettingsApiV1StudySetsSetIdLearnSettingsDelete: $e\n');
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

# **retakeTestApiV1StudyTestsAttemptIdRetakePost**
> TestAttemptOut retakeTestApiV1StudyTestsAttemptIdRetakePost(attemptId)

Пересдать ошибки

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String attemptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.retakeTestApiV1StudyTestsAttemptIdRetakePost(attemptId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->retakeTestApiV1StudyTestsAttemptIdRetakePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attemptId** | **String**|  | 

### Return type

[**TestAttemptOut**](TestAttemptOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startSessionApiV1StudySessionsPost**
> SessionOut startSessionApiV1StudySessionsPost(sessionCreate)

Начать тренировку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final SessionCreate sessionCreate = ; // SessionCreate | 

try {
    final response = api.startSessionApiV1StudySessionsPost(sessionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->startSessionApiV1StudySessionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionCreate** | [**SessionCreate**](SessionCreate.md)|  | 

### Return type

[**SessionOut**](SessionOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitReviewsApiV1StudyReviewsPost**
> ReviewBatchResult submitReviewsApiV1StudyReviewsPost(reviewBatch)

Отправить ответы батчем

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final ReviewBatch reviewBatch = ; // ReviewBatch | 

try {
    final response = api.submitReviewsApiV1StudyReviewsPost(reviewBatch);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->submitReviewsApiV1StudyReviewsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewBatch** | [**ReviewBatch**](ReviewBatch.md)|  | 

### Return type

[**ReviewBatchResult**](ReviewBatchResult.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitTestApiV1StudyTestsAttemptIdSubmitPost**
> TestResult submitTestApiV1StudyTestsAttemptIdSubmitPost(attemptId, testSubmit)

Проверить ответы теста

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String attemptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TestSubmit testSubmit = ; // TestSubmit | 

try {
    final response = api.submitTestApiV1StudyTestsAttemptIdSubmitPost(attemptId, testSubmit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->submitTestApiV1StudyTestsAttemptIdSubmitPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attemptId** | **String**|  | 
 **testSubmit** | [**TestSubmit**](TestSubmit.md)|  | 

### Return type

[**TestResult**](TestResult.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut**
> SetLearnSettingsOut updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut(setId, setLearnSettingsUpdate)

Переопределить настройки заучивания для набора

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final String setId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final SetLearnSettingsUpdate setLearnSettingsUpdate = ; // SetLearnSettingsUpdate | 

try {
    final response = api.updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut(setId, setLearnSettingsUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->updateSetLearnSettingsApiV1StudySetsSetIdLearnSettingsPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setId** | **String**|  | 
 **setLearnSettingsUpdate** | [**SetLearnSettingsUpdate**](SetLearnSettingsUpdate.md)|  | 

### Return type

[**SetLearnSettingsOut**](SetLearnSettingsOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStudySettingsApiV1StudySettingsPatch**
> StudySettingsOut updateStudySettingsApiV1StudySettingsPatch(studySettingsUpdate)

Изменить настройки обучения

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getStudyApi();
final StudySettingsUpdate studySettingsUpdate = ; // StudySettingsUpdate | 

try {
    final response = api.updateStudySettingsApiV1StudySettingsPatch(studySettingsUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StudyApi->updateStudySettingsApiV1StudySettingsPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studySettingsUpdate** | [**StudySettingsUpdate**](StudySettingsUpdate.md)|  | 

### Return type

[**StudySettingsOut**](StudySettingsOut.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

