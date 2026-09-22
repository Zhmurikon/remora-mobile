import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Хранение refresh-токена в защищённом хранилище (Keystore/Keychain).
/// Access-токен живёт только в памяти (через [AuthProvider]).
class TokenStorage {
  static const _refreshKey = 'remora_refresh_token';

  const TokenStorage._();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<String?> readRefreshToken() => _storage.read(key: _refreshKey);

  static Future<void> writeRefreshToken(String token) =>
      _storage.write(key: _refreshKey, value: token);

  static Future<void> deleteRefreshToken() => _storage.delete(key: _refreshKey);
}
