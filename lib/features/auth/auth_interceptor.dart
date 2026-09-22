import 'dart:async';

import 'package:dio/dio.dart';

import 'data/token_storage.dart';

/// Dio-интерсептор: добавляет Bearer-токен, при 401 делает single-flight
/// refresh и повторяет запрос. Тело POST/PUT сохраняется для повтора.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required String? Function() accessToken,
    required Future<void> Function(String token) onAccessToken,
    required Future<void> Function() onLogout,
  })  : _accessToken = accessToken,
        _onAccessToken = onAccessToken,
        _onLogout = onLogout;

  final String? Function() _accessToken;
  final Future<void> Function(String) _onAccessToken;
  final Future<void> Function() _onLogout;

  /// Single-flight: один refresh на множество параллельных 401.
  Completer<String?>? _refreshCompleter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _accessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-Client'] = 'mobile';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final completer = _refreshCompleter;
    if (completer != null) {
      // Уже идёт refresh — ждём результат
      final newToken = await completer.future;
      if (newToken != null) {
        handler.resolve(await _retryRequest(err.requestOptions, newToken));
      } else {
        handler.next(err);
      }
      return;
    }

    _refreshCompleter = Completer<String?>();
    try {
      final refreshToken = await TokenStorage.readRefreshToken();
      if (refreshToken == null) {
        _refreshCompleter!.complete(null);
        _refreshCompleter = null;
        await _onLogout();
        handler.next(err);
        return;
      }

      final refreshDio = Dio(BaseOptions(baseUrl: err.requestOptions.baseUrl));
      refreshDio.options.headers['X-Client'] = 'mobile';

      final response = await refreshDio.post(
        '/api/v1/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newAccess = response.data['access_token'] as String;
      final newRefresh = response.data['refresh_token'] as String?;

      await _onAccessToken(newAccess);
      if (newRefresh != null) {
        await TokenStorage.writeRefreshToken(newRefresh);
      }

      _refreshCompleter!.complete(newAccess);
      _refreshCompleter = null;
      handler.resolve(await _retryRequest(err.requestOptions, newAccess));
    } catch (e) {
      _refreshCompleter?.complete(null);
      _refreshCompleter = null;
      await _onLogout();
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions options,
    String newToken,
  ) {
    options.headers['Authorization'] = 'Bearer $newToken';
    final dio = Dio(BaseOptions(baseUrl: options.baseUrl));
    return dio.fetch(options);
  }
}
