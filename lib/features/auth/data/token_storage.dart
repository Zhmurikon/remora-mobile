import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Хранение refresh-токена в защищённом хранилище (Keystore/Keychain).
/// Access-токен живёт только в памяти (через [AuthProvider]).
/// Профиль кэшируется рядом, чтобы офлайн восстановить сессию без запроса к API.
class TokenStorage {
  static const _refreshKey = 'remora_refresh_token';
  static const _userKey = 'remora_user';

  const TokenStorage._();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<String?> readRefreshToken() => _storage.read(key: _refreshKey);

  static Future<void> writeRefreshToken(String token) =>
      _storage.write(key: _refreshKey, value: token);

  static Future<void> deleteRefreshToken() => _storage.delete(key: _refreshKey);

  static Future<String?> readUser() => _storage.read(key: _userKey);

  static Future<void> writeUser(String json) =>
      _storage.write(key: _userKey, value: json);

  static Future<void> deleteUser() => _storage.delete(key: _userKey);
}
