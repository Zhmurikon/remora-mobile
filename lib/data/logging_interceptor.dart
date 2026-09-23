import 'package:dio/dio.dart';

import '../core/log.dart';

/// Диагностический лог сетевых запросов: метод, путь, статус и длительность.
/// Виден в `flutter logs` / `adb logcat` по префиксу `remora.net`.
///
/// Пишем только строку запроса и код ответа — без тел, заголовков и токенов,
/// чтобы не светить персональные данные. Длительность помогает увидеть, какой
/// запрос сколько висел на медленной сети (таймауты видны как большие числа).
class LoggingInterceptor extends Interceptor {
  static const _startKey = 'remora_start_ms';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startKey] = DateTime.now().millisecondsSinceEpoch;
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logRemora(
      'net',
      '${_line(response.requestOptions)} → ${response.statusCode} (${_elapsedMs(response.requestOptions)} мс)',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Есть ответ — показываем код; нет — тип сбоя (connectionTimeout и т.п.).
    final outcome = err.response?.statusCode?.toString() ?? err.type.name;
    logRemora(
      'net',
      '${_line(err.requestOptions)} → ✗ $outcome (${_elapsedMs(err.requestOptions)} мс)',
    );
    handler.next(err);
  }

  String _line(RequestOptions options) => '${options.method} ${options.path}';

  int _elapsedMs(RequestOptions options) {
    final start = options.extra[_startKey];
    if (start is! int) return 0;
    return DateTime.now().millisecondsSinceEpoch - start;
  }
}
