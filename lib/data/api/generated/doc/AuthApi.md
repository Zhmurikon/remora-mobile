# remora_api.api.AuthApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePasswordApiV1AuthChangePasswordPost**](AuthApi.md#changepasswordapiv1authchangepasswordpost) | **POST** /api/v1/auth/change-password | Смена пароля
[**confirmPasswordResetApiV1AuthPasswordResetConfirmPost**](AuthApi.md#confirmpasswordresetapiv1authpasswordresetconfirmpost) | **POST** /api/v1/auth/password-reset/confirm | Сброс пароля
[**getMeApiV1AuthMeGet**](AuthApi.md#getmeapiv1authmeget) | **GET** /api/v1/auth/me | Текущий пользователь
[**listSessionsApiV1AuthSessionsGet**](AuthApi.md#listsessionsapiv1authsessionsget) | **GET** /api/v1/auth/sessions | Активные сессии
[**loginApiV1AuthLoginPost**](AuthApi.md#loginapiv1authloginpost) | **POST** /api/v1/auth/login | Вход
[**logoutApiV1AuthLogoutPost**](AuthApi.md#logoutapiv1authlogoutpost) | **POST** /api/v1/auth/logout | Выход
[**refreshApiV1AuthRefreshPost**](AuthApi.md#refreshapiv1authrefreshpost) | **POST** /api/v1/auth/refresh | Обновление токена
[**registerApiV1AuthRegisterPost**](AuthApi.md#registerapiv1authregisterpost) | **POST** /api/v1/auth/register | Регистрация
[**requestPasswordResetApiV1AuthPasswordResetPost**](AuthApi.md#requestpasswordresetapiv1authpasswordresetpost) | **POST** /api/v1/auth/password-reset | Запрос сброса пароля
[**revokeSessionApiV1AuthSessionsSessionIdDelete**](AuthApi.md#revokesessionapiv1authsessionssessioniddelete) | **DELETE** /api/v1/auth/sessions/{session_id} | Отзыв сессии
[**updateMeApiV1AuthMePatch**](AuthApi.md#updatemeapiv1authmepatch) | **PATCH** /api/v1/auth/me | Обновление профиля
[**verifyEmailApiV1AuthVerifyEmailPost**](AuthApi.md#verifyemailapiv1authverifyemailpost) | **POST** /api/v1/auth/verify-email | Подтверждение email


# **changePasswordApiV1AuthChangePasswordPost**
> changePasswordApiV1AuthChangePasswordPost(passwordChangeRequest)

Смена пароля

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final PasswordChangeRequest passwordChangeRequest = ; // PasswordChangeRequest | 

try {
    api.changePasswordApiV1AuthChangePasswordPost(passwordChangeRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->changePasswordApiV1AuthChangePasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordChangeRequest** | [**PasswordChangeRequest**](PasswordChangeRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **confirmPasswordResetApiV1AuthPasswordResetConfirmPost**
> TokenResponse confirmPasswordResetApiV1AuthPasswordResetConfirmPost(passwordResetConfirmRequest)

Сброс пароля

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final PasswordResetConfirmRequest passwordResetConfirmRequest = ; // PasswordResetConfirmRequest | 

try {
    final response = api.confirmPasswordResetApiV1AuthPasswordResetConfirmPost(passwordResetConfirmRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->confirmPasswordResetApiV1AuthPasswordResetConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetConfirmRequest** | [**PasswordResetConfirmRequest**](PasswordResetConfirmRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMeApiV1AuthMeGet**
> UserPublic getMeApiV1AuthMeGet()

Текущий пользователь

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();

try {
    final response = api.getMeApiV1AuthMeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->getMeApiV1AuthMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSessionsApiV1AuthSessionsGet**
> BuiltList<SessionPublic> listSessionsApiV1AuthSessionsGet()

Активные сессии

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();

try {
    final response = api.listSessionsApiV1AuthSessionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->listSessionsApiV1AuthSessionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SessionPublic&gt;**](SessionPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginApiV1AuthLoginPost**
> TokenResponse loginApiV1AuthLoginPost(loginRequest)

Вход

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.loginApiV1AuthLoginPost(loginRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->loginApiV1AuthLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logoutApiV1AuthLogoutPost**
> logoutApiV1AuthLogoutPost(refreshRequest)

Выход

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final RefreshRequest refreshRequest = ; // RefreshRequest | 

try {
    api.logoutApiV1AuthLogoutPost(refreshRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->logoutApiV1AuthLogoutPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshApiV1AuthRefreshPost**
> RefreshResponse refreshApiV1AuthRefreshPost(refreshRequest)

Обновление токена

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final RefreshRequest refreshRequest = ; // RefreshRequest | 

try {
    final response = api.refreshApiV1AuthRefreshPost(refreshRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->refreshApiV1AuthRefreshPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | [optional] 

### Return type

[**RefreshResponse**](RefreshResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerApiV1AuthRegisterPost**
> TokenResponse registerApiV1AuthRegisterPost(registerRequest)

Регистрация

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final RegisterRequest registerRequest = ; // RegisterRequest | 

try {
    final response = api.registerApiV1AuthRegisterPost(registerRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->registerApiV1AuthRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerRequest** | [**RegisterRequest**](RegisterRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPasswordResetApiV1AuthPasswordResetPost**
> requestPasswordResetApiV1AuthPasswordResetPost(passwordResetRequest)

Запрос сброса пароля

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final PasswordResetRequest passwordResetRequest = ; // PasswordResetRequest | 

try {
    api.requestPasswordResetApiV1AuthPasswordResetPost(passwordResetRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->requestPasswordResetApiV1AuthPasswordResetPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetRequest** | [**PasswordResetRequest**](PasswordResetRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeSessionApiV1AuthSessionsSessionIdDelete**
> revokeSessionApiV1AuthSessionsSessionIdDelete(sessionId)

Отзыв сессии

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final String sessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.revokeSessionApiV1AuthSessionsSessionIdDelete(sessionId);
} on DioException catch (e) {
    print('Exception when calling AuthApi->revokeSessionApiV1AuthSessionsSessionIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMeApiV1AuthMePatch**
> UserPublic updateMeApiV1AuthMePatch(profileUpdateRequest)

Обновление профиля

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final ProfileUpdateRequest profileUpdateRequest = ; // ProfileUpdateRequest | 

try {
    final response = api.updateMeApiV1AuthMePatch(profileUpdateRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->updateMeApiV1AuthMePatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profileUpdateRequest** | [**ProfileUpdateRequest**](ProfileUpdateRequest.md)|  | 

### Return type

[**UserPublic**](UserPublic.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyEmailApiV1AuthVerifyEmailPost**
> TokenResponse verifyEmailApiV1AuthVerifyEmailPost(verifyEmailRequest)

Подтверждение email

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getAuthApi();
final VerifyEmailRequest verifyEmailRequest = ; // VerifyEmailRequest | 

try {
    final response = api.verifyEmailApiV1AuthVerifyEmailPost(verifyEmailRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->verifyEmailApiV1AuthVerifyEmailPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyEmailRequest** | [**VerifyEmailRequest**](VerifyEmailRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

