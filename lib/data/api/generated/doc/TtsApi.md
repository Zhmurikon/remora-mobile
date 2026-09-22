# remora_api.api.TtsApi

## Load the API package
```dart
import 'package:remora_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**speakApiV1TtsSpeakPost**](TtsApi.md#speakapiv1ttsspeakpost) | **POST** /api/v1/tts/speak | Озвучить сторону карточки
[**ttsStatusApiV1TtsStatusGet**](TtsApi.md#ttsstatusapiv1ttsstatusget) | **GET** /api/v1/tts/status | Доступна ли озвучка


# **speakApiV1TtsSpeakPost**
> SpeakResponse speakApiV1TtsSpeakPost(speakRequest)

Озвучить сторону карточки

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getTtsApi();
final SpeakRequest speakRequest = ; // SpeakRequest | 

try {
    final response = api.speakApiV1TtsSpeakPost(speakRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsApi->speakApiV1TtsSpeakPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **speakRequest** | [**SpeakRequest**](SpeakRequest.md)|  | 

### Return type

[**SpeakResponse**](SpeakResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsStatusApiV1TtsStatusGet**
> TtsStatus ttsStatusApiV1TtsStatusGet()

Доступна ли озвучка

### Example
```dart
import 'package:remora_api/api.dart';

final api = RemoraApi().getTtsApi();

try {
    final response = api.ttsStatusApiV1TtsStatusGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsApi->ttsStatusApiV1TtsStatusGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TtsStatus**](TtsStatus.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

