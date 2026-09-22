import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/auth_interceptor.dart';
import '../features/auth/auth_provider.dart';

const _baseUrl = 'http://10.0.2.2:8000';

/// Настроенный Dio с auth-интерсептором.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
  ));

  dio.interceptors.add(AuthInterceptor(
    accessToken: () => ref.read(authProvider).accessToken,
    onAccessToken: (token) async {
      ref.read(authProvider.notifier).setAccessToken(token);
    },
    onLogout: () async {
      ref.read(authProvider.notifier).logout();
    },
  ));

  return dio;
});

/// API-клиент, использующий настроенный Dio.
final apiClientProvider = Provider<RemoraApiClient>((ref) {
  return RemoraApiClient(ref.read(dioProvider));
});

/// Минимальный API-клиент для auth. Полноценный сгенерированный клиент
/// из OpenAPI будет подключён на M3, когда понадобится работа с библиотекой.
class RemoraApiClient {
  RemoraApiClient(this._dio);

  final Dio _dio;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/api/v1/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    await _dio.post(
      '/api/v1/auth/register',
      data: {
        'email': email,
        'password': password,
        'username': username,
      },
    );
  }

  Future<RefreshResponse> refresh({required String refreshToken}) async {
    final response = await _dio.post(
      '/api/v1/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return RefreshResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserProfile> getMe() async {
    final response = await _dio.get('/api/v1/auth/me');
    return UserProfile.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> logout({String? refreshToken}) async {
    await _dio.post(
      '/api/v1/auth/logout',
      data: refreshToken != null ? {'refresh_token': refreshToken} : null,
    );
  }
}

class AuthResponse {
  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String accessToken;
  final String? refreshToken;
  final UserProfile user;
}

class RefreshResponse {
  RefreshResponse({required this.accessToken, required this.refreshToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return RefreshResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
    );
  }

  final String accessToken;
  final String? refreshToken;
}

class UserProfile {
  UserProfile({
    required this.id,
    required this.email,
    required this.username,
    this.displayName,
    this.avatarUrl,
    required this.role,
    required this.emailVerified,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String,
      emailVerified: json['email_verified'] as bool,
    );
  }

  final String id;
  final String? email;
  final String username;
  final String? displayName;
  final String? avatarUrl;
  final String role;
  final bool emailVerified;
}
