import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/features/auth/auth_errors.dart';

/// Ключ офлайна: обрыв сети не должен выкидывать из аккаунта, а истёкший
/// refresh-токен (401) — должен. Разделение проверяется здесь.
void main() {
  final req = RequestOptions(path: '/api/v1/auth/refresh');

  DioException withStatus(int code) => DioException(
        requestOptions: req,
        response: Response(requestOptions: req, statusCode: code),
        type: DioExceptionType.badResponse,
      );

  test('401 — сервер отверг сессию, разлогиниваем', () {
    expect(isSessionRejection(withStatus(401)), isTrue);
  });

  test('403 — доступ запрещён, разлогиниваем', () {
    expect(isSessionRejection(withStatus(403)), isTrue);
  });

  test('нет ответа (обрыв связи) — НЕ разлогиниваем', () {
    expect(
      isSessionRejection(DioException(
        requestOptions: req,
        type: DioExceptionType.connectionError,
      )),
      isFalse,
    );
  });

  test('таймаут соединения — НЕ разлогиниваем', () {
    expect(
      isSessionRejection(DioException(
        requestOptions: req,
        type: DioExceptionType.connectionTimeout,
      )),
      isFalse,
    );
  });

  test('5xx сервера — НЕ разлогиниваем (это не отказ в правах)', () {
    expect(isSessionRejection(withStatus(500)), isFalse);
  });

  test('произвольная не-Dio ошибка — НЕ разлогиниваем', () {
    expect(isSessionRejection(Exception('boom')), isFalse);
  });
}
