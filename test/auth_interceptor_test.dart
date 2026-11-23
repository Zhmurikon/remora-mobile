import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/auth/auth_interceptor.dart';

void main() {
  test('отказ в правах после обновления токена не завершает сеанс', () async {
    FlutterSecureStorage.setMockInitialValues({
      'remora_refresh_token': 'refresh',
    });
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    var refreshes = 0;
    server.listen((request) async {
      await request.drain<void>();
      request.response.headers.contentType = ContentType.json;
      if (request.uri.path == '/api/v1/auth/refresh') {
        refreshes++;
        request.response.write(
          jsonEncode({'access_token': 'new', 'refresh_token': 'rotated'}),
        );
      } else if (request.headers.value(HttpHeaders.authorizationHeader) ==
          'Bearer new') {
        request.response.statusCode = 403;
        request.response.write('{}');
      } else {
        request.response.statusCode = 401;
        request.response.write('{}');
      }
      await request.response.close();
    });
    final dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:${server.port}'));
    addTearDown(dio.close);
    var token = 'old';
    var logouts = 0;
    dio.interceptors.add(
      AuthInterceptor(
        accessToken: () => token,
        onAccessToken: (value) async => token = value,
        onLogout: () async => logouts++,
      ),
    );
    final denied = throwsA(
      isA<DioException>().having((e) => e.response?.statusCode, 'status', 403),
    );
    await Future.wait([
      expectLater(dio.get('/api/v1/classes/first/reports'), denied),
      expectLater(dio.get('/api/v1/classes/second/reports'), denied),
    ]);
    expect(logouts, 0);
    expect(refreshes, 1);
    expect(token, 'new');
  });
}
