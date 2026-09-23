import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/log.dart';
import '../../data/api_client.dart';
import 'auth_errors.dart';
import 'data/token_storage.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.accessToken,
    this.user,
    this.error,
    this.isLoading = false,
  });

  final AuthStatus status;
  final String? accessToken;
  final UserProfile? user;
  final String? error;
  final bool isLoading;

  AuthState copyWith({
    AuthStatus? status,
    String? accessToken,
    UserProfile? user,
    String? error,
    bool? isLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
      error: error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._ref) : super(const AuthState()) {
    _init();
  }

  final Ref _ref;

  RemoraApiClient get _api => _ref.read(apiClientProvider);

  Future<void> _init() async {
    final refreshToken = await TokenStorage.readRefreshToken();
    if (refreshToken == null) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return;
    }
    // Кэшированный профиль — единственный источник данных о пользователе офлайн.
    final cachedUser = await _readCachedUser();
    await _tryRefresh(refreshToken, cachedUser: cachedUser);
  }

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _api.login(email: email, password: password);
      await _onLoginSuccess(data);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _extractError(e));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _api.register(
        email: email,
        password: password,
        username: username,
      );
      state = state.copyWith(
        isLoading: false,
        error: 'Проверьте почту и подтвердите email, затем войдите.',
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _extractError(e));
    }
  }

  Future<void> logout() async {
    final refreshToken = await TokenStorage.readRefreshToken();
    await TokenStorage.deleteRefreshToken();
    await TokenStorage.deleteUser();
    try {
      await _api.logout(refreshToken: refreshToken);
    } catch (_) {
      // Локально уже вышли, серверный logout — best-effort
    }
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  void setAccessToken(String token) {
    state = state.copyWith(accessToken: token);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  Future<void> _onLoginSuccess(AuthResponse data) async {
    final refreshToken = data.refreshToken;
    if (refreshToken != null) {
      await TokenStorage.writeRefreshToken(refreshToken);
    }
    await TokenStorage.writeUser(jsonEncode(data.user.toJson()));
    state = state.copyWith(
      status: AuthStatus.authenticated,
      accessToken: data.accessToken,
      user: data.user,
      isLoading: false,
      error: null,
    );
  }

  Future<void> _tryRefresh(String refreshToken, {UserProfile? cachedUser}) async {
    try {
      final result = await _api.refresh(refreshToken: refreshToken);
      if (result.refreshToken != null) {
        await TokenStorage.writeRefreshToken(result.refreshToken!);
      }
      // refresh прошёл — тянем профиль, но его отсутствие сессию не рушит.
      UserProfile? user = cachedUser;
      try {
        user = await _api.getMe();
        await TokenStorage.writeUser(jsonEncode(user.toJson()));
      } catch (_) {
        // Профиль не пришёл (сеть моргнула) — оставляем кэшированный.
      }
      state = state.copyWith(
        status: AuthStatus.authenticated,
        accessToken: result.accessToken,
        user: user,
        isLoading: false,
      );
      logRemora('auth', 'сессия восстановлена онлайн');
    } on DioException catch (e) {
      if (isSessionRejection(e)) {
        // Сервер отверг refresh-токен (401): сессия действительно недействительна.
        await TokenStorage.deleteRefreshToken();
        await TokenStorage.deleteUser();
        state = state.copyWith(status: AuthStatus.unauthenticated);
        logRemora('auth', 'сервер отверг refresh (401/403) — выходим');
      } else {
        // Сеть недоступна — НЕ выходим и НЕ удаляем токен: иначе офлайн-запуск
        // выкидывает из аккаунта, а войти без сети нельзя. Остаёмся в сессии;
        // access-токен добудет интерсептор при первом онлайн-запросе.
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: cachedUser,
          isLoading: false,
        );
        logRemora('auth', 'офлайн: остаёмся в сессии по кэшу, токен сохранён');
      }
    } catch (_) {
      // Непредвиденная не-Dio ошибка — тоже не выкидываем из аккаунта офлайн.
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: cachedUser,
        isLoading: false,
      );
      logRemora('auth', 'непредвиденная ошибка refresh — остаёмся в сессии');
    }
  }

  Future<UserProfile?> _readCachedUser() async {
    final raw = await TokenStorage.readUser();
    if (raw == null) return null;
    try {
      return UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  String _extractError(Object e) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        return (data['message'] as String?) ??
            (data['detail'] as String?) ??
            'Ошибка сети';
      }
      return 'Ошибка сети';
    }
    return e.toString();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});
