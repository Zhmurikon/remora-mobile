import 'package:flutter/foundation.dart';

/// Лёгкое диагностическое логирование для проверки на устройстве через
/// `flutter logs` или `adb logcat` (фильтр по строке `remora.`).
///
/// Пишем только высокоуровневый ход событий и счётчики — без токенов,
/// email и прочих персональных данных.
void logRemora(String area, String message) {
  debugPrint('[remora.$area] $message');
}
