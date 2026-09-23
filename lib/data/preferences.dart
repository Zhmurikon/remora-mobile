import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _autoDownloadKey = 'auto_download_enabled';

/// Настройки приложения, переживающие перезапуск (`SharedPreferences`).
///
/// Отдельно от `SyncMeta` в Drift: там — служебные курсоры синхронизации,
/// здесь — то, что выбрал пользователь.
class AppPreferences {
  AppPreferences(this._prefs);

  final SharedPreferences _prefs;

  /// Автоматически скачивать курсы и наборы для офлайна в фоне.
  /// По умолчанию включено — обучение не должно зависеть от того, вспомнил
  /// ли пользователь нажать «Скачать» на каждый набор.
  bool get autoDownloadEnabled => _prefs.getBool(_autoDownloadKey) ?? true;

  Future<void> setAutoDownloadEnabled(bool value) =>
      _prefs.setBool(_autoDownloadKey, value);
}

/// Инициализируется в `main()` до `runApp` — `SharedPreferences.getInstance()`
/// асинхронный, а провайдеру нужно синхронное значение.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider переопределяется в main()');
});

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences(ref.watch(sharedPreferencesProvider));
});

/// Текущее значение тумблера автоскачивания + запись изменения в хранилище.
class AutoDownloadSettingNotifier extends StateNotifier<bool> {
  AutoDownloadSettingNotifier(this._prefs) : super(_prefs.autoDownloadEnabled);

  final AppPreferences _prefs;

  Future<void> set(bool value) async {
    state = value;
    await _prefs.setAutoDownloadEnabled(value);
  }
}

final autoDownloadEnabledProvider =
    StateNotifierProvider<AutoDownloadSettingNotifier, bool>((ref) {
  return AutoDownloadSettingNotifier(ref.watch(appPreferencesProvider));
});
