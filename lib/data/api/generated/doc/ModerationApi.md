# remora_api.api.ModerationApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listReportsApiV1ModerationReportsGet**](ModerationApi.md#listreportsapiv1moderationreportsget) | **GET** /api/v1/moderation/reports | Очередь жалоб
[**resolveReportApiV1ModerationReportsReportIdResolvePost**](ModerationApi.md#resolvereportapiv1moderationreportsreportidresolvepost) | **POST** /api/v1/moderation/reports/{report_id}/resolve | Решение по жалобе


# **listReportsApiV1ModerationReportsGet**
> BuiltList<ReportItem> listReportsApiV1ModerationReportsGet(status, offset, limit)

Очередь жалоб

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getModerationApi();
final ReportStatus status = ; // ReportStatus | 
final int offset = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.listReportsApiV1ModerationReportsGet(status, offset, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ModerationApi->listReportsApiV1ModerationReportsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | [**ReportStatus**](.md)|  | [optional] 
 **offset** | **int**|  | [optional] [default to 0]
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**BuiltList&lt;ReportItem&gt;**](ReportItem.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resolveReportApiV1ModerationReportsReportIdResolvePost**
> ReportItem resolveReportApiV1ModerationReportsReportIdResolvePost(reportId, reportResolution)

Решение по жалобе

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getModerationApi();
final String reportId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReportResolution reportResolution = ; // ReportResolution | 

try {
    final response = api.resolveReportApiV1ModerationReportsReportIdResolvePost(reportId, reportResolution);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ModerationApi->resolveReportApiV1ModerationReportsReportIdResolvePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reportId** | **String**|  | 
 **reportResolution** | [**ReportResolution**](ReportResolution.md)|  | 

### Return type

[**ReportItem**](ReportItem.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

