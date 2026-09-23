import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connectivity_controller.dart';

/// Метка синтетической ошибки короткого замыкания — чтобы не считать её
/// сетевым сбоем и отличать в логах.
const circuitOpenMarker = 'circuit-open';

/// Замыкает сеть на предохранителе [ConnectivityController].
///
/// Пока предохранитель открыт (офлайн), запросы отклоняются мгновенно — не ждём
/// таймаут. На реальных ответах и сетевых ошибках докладываем контроллеру, чтобы
/// он открывался после двух сбоев и закрывался при первом успехе.
class CircuitBreakerInterceptor extends Interceptor {
  CircuitBreakerInterceptor(this._ref);

  final Ref _ref;

  ConnectivityController get _controller =>
      _ref.read(connectivityControllerProvider.notifier);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_ref.read(connectivityControllerProvider).isOffline) {
      // Короткое замыкание: мгновенная офлайн-ошибка вместо ожидания таймаута.
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: circuitOpenMarker,
        ),
      );
      return;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    _controller.reportSuccess();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Сетевой сбой = нет ответа сервера, не отмена и не наше короткое замыкание.
    final isNetworkFailure = err.response == null &&
        err.type != DioExceptionType.cancel &&
        err.error != circuitOpenMarker;
    if (isNetworkFailure) {
      _controller.reportFailure();
    }
    handler.next(err);
  }
}
