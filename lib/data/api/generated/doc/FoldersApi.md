# remora_api.api.FoldersApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolderApiV1FoldersPost**](FoldersApi.md#createfolderapiv1folderspost) | **POST** /api/v1/folders | Создать папку
[**deleteFolderApiV1FoldersFolderIdDelete**](FoldersApi.md#deletefolderapiv1foldersfolderiddelete) | **DELETE** /api/v1/folders/{folder_id} | Удалить папку
[**listFoldersApiV1FoldersGet**](FoldersApi.md#listfoldersapiv1foldersget) | **GET** /api/v1/folders | Мои папки
[**updateFolderApiV1FoldersFolderIdPatch**](FoldersApi.md#updatefolderapiv1foldersfolderidpatch) | **PATCH** /api/v1/folders/{folder_id} | Изменить папку


# **createFolderApiV1FoldersPost**
> FolderPublic createFolderApiV1FoldersPost(folderCreate)

Создать папку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getFoldersApi();
final FolderCreate folderCreate = ; // FolderCreate | 

try {
    final response = api.createFolderApiV1FoldersPost(folderCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FoldersApi->createFolderApiV1FoldersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderCreate** | [**FolderCreate**](FolderCreate.md)|  | 

### Return type

[**FolderPublic**](FolderPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFolderApiV1FoldersFolderIdDelete**
> deleteFolderApiV1FoldersFolderIdDelete(folderId)

Удалить папку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getFoldersApi();
final String folderId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteFolderApiV1FoldersFolderIdDelete(folderId);
} on DioException catch (e) {
    print('Exception when calling FoldersApi->deleteFolderApiV1FoldersFolderIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFoldersApiV1FoldersGet**
> BuiltList<FolderPublic> listFoldersApiV1FoldersGet()

Мои папки

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getFoldersApi();

try {
    final response = api.listFoldersApiV1FoldersGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling FoldersApi->listFoldersApiV1FoldersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;FolderPublic&gt;**](FolderPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateFolderApiV1FoldersFolderIdPatch**
> FolderPublic updateFolderApiV1FoldersFolderIdPatch(folderId, folderUpdate)

Изменить папку

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getFoldersApi();
final String folderId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final FolderUpdate folderUpdate = ; // FolderUpdate | 

try {
    final response = api.updateFolderApiV1FoldersFolderIdPatch(folderId, folderUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FoldersApi->updateFolderApiV1FoldersFolderIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | **String**|  | 
 **folderUpdate** | [**FolderUpdate**](FolderUpdate.md)|  | 

### Return type

[**FolderPublic**](FolderPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

