import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/log.dart';
import 'api_client.dart' show baseUrl;

/// Режим сети (предохранитель / circuit breaker).
/// - [online]  — «closed»: запросы идут на сервер.
/// - [offline] — «open»: чтения замыкаются в офлайн, идёт бэкофф-проба.
/// - [manualOffline] — пользователь принудительно офлайн, проб нет.
enum NetMode { online, offline, manualOffline }

/// Состояние предохранителя.
class NetState {
  const NetState({
    required this.mode,
    this.probing = false,
    this.failureStreak = 0,
    this.backoffStep = 0,
  });

  const NetState.online()
      : mode = NetMode.online,
        probing = false,
        failureStreak = 0,
        backoffStep = 0;

  final NetMode mode;

  /// Проба в полёте (half-open).
  final bool probing;

  /// Сколько сетевых сбоев подряд насчитали в онлайне (порог открытия).
  final int failureStreak;

  /// Индекс шага бэкоффа для следующей пробы.
  final int backoffStep;

  bool get isOffline => mode != NetMode.online;
  bool get isManual => mode == NetMode.manualOffline;

  NetState copyWith({
    NetMode? mode,
    bool? probing,
    int? failureStreak,
    int? backoffStep,
  }) {
    return NetState(
      mode: mode ?? this.mode,
      probing: probing ?? this.probing,
      failureStreak: failureStreak ?? this.failureStreak,
      backoffStep: backoffStep ?? this.backoffStep,
    );
  }
}

/// Предохранитель связи: держит один источник правды об онлайне/офлайне.
///
/// В зоне с дропами пакетов запросы висят на таймауте. Вместо того чтобы
/// висеть на КАЖДОМ запросе, после двух сетевых сбоев подряд размыкаемся в
/// офлайн — дальше чтения замыкаются мгновенно. Восстановление ловим пробой
/// с бэкоффом, сменой сети от ОС и кнопкой «Повторить».
class ConnectivityController extends StateNotifier<NetState> {
  ConnectivityController({
    required Future<bool> Function() probe,
    Stream<List<ConnectivityResult>>? connectivityStream,
    List<Duration> backoff = _defaultBackoff,
  })  : _probe = probe,
        _backoff = backoff,
        super(const NetState.online()) {
    final stream = connectivityStream ?? Connectivity().onConnectivityChanged;
    _connSub = stream.listen(_onConnectivityChanged);
  }

  final Future<bool> Function() _probe;
  final List<Duration> _backoff;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  Timer? _timer;

  /// Открываем предохранитель после двух сетевых сбоев подряд.
  static const _failThreshold = 2;

  static const _defaultBackoff = <Duration>[
    Duration(seconds: 30),
    Duration(minutes: 1),
    Duration(minutes: 2),
  ];

  // ── Сигналы от интерцептора (реальные, не пробные, запросы) ──

  /// Успешный ответ сервера — связь есть, возвращаемся в онлайн.
  void reportSuccess() {
    if (state.isManual) return;
    if (state.mode != NetMode.online ||
        state.failureStreak != 0 ||
        state.backoffStep != 0) {
      _cancelTimer();
      state = const NetState.online();
      logRemora('net', 'связь есть — онлайн');
    }
  }

  /// Сетевой сбой (таймаут/обрыв). Считаем только в онлайне.
  void reportFailure() {
    if (state.mode != NetMode.online) return;
    final streak = state.failureStreak + 1;
    if (streak >= _failThreshold) {
      _open();
    } else {
      state = state.copyWith(failureStreak: streak);
    }
  }

  // ── Управление ──

  /// Кнопка «Повторить»: пробуем связь прямо сейчас.
  void retry() {
    if (state.isManual) return;
    _probeNow();
  }

  /// Ручной тумблер «Работать офлайн».
  void setManualOffline(bool enabled) {
    _cancelTimer();
    if (enabled) {
      state = const NetState(mode: NetMode.manualOffline);
      logRemora('net', 'ручной офлайн включён');
    } else {
      state = const NetState(mode: NetMode.offline);
      logRemora('net', 'ручной офлайн выключен — пробуем связь');
      _probeNow();
    }
  }

  // ── Внутреннее ──

  void _open() {
    logRemora('net', 'два сбоя подряд — уходим в офлайн');
    state = state.copyWith(mode: NetMode.offline, failureStreak: 0);
    _scheduleProbe();
  }

  void _scheduleProbe() {
    _cancelTimer();
    final index = state.backoffStep.clamp(0, _backoff.length - 1);
    _timer = Timer(_backoff[index], _probeNow);
  }

  Future<void> _probeNow() async {
    if (state.isManual || state.probing) return;
    state = state.copyWith(probing: true);

    bool ok;
    try {
      ok = await _probe();
    } catch (_) {
      ok = false;
    }
    if (!mounted || state.isManual) return;

    if (ok) {
      _cancelTimer();
      state = const NetState.online();
      logRemora('net', 'проба прошла — онлайн');
    } else {
      state = state.copyWith(
        probing: false,
        mode: NetMode.offline,
        backoffStep: (state.backoffStep + 1).clamp(0, _backoff.length - 1),
      );
      _scheduleProbe();
    }
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final hasRadio = results.any((r) => r != ConnectivityResult.none);
    // Радио вернулось, а мы в авто-офлайне — пробуем сразу, не ждём таймер.
    if (hasRadio && state.mode == NetMode.offline && !state.probing) {
      logRemora('net', 'сеть сменилась — пробуем связь');
      _probeNow();
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _cancelTimer();
    _connSub?.cancel();
    super.dispose();
  }
}

/// Провайдер предохранителя. Проба идёт через ОТДЕЛЬНЫЙ Dio — без интерцепторов
/// и с коротким таймаутом, чтобы не зациклиться на [dioProvider] и быстро
/// понимать доступность сервера.
final connectivityControllerProvider =
    StateNotifierProvider<ConnectivityController, NetState>((ref) {
  final probeDio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 4),
      receiveTimeout: const Duration(seconds: 4),
    ),
  );
  ref.onDispose(probeDio.close);

  return ConnectivityController(
    probe: () async {
      final response = await probeDio.get<dynamic>('/api/v1/health');
      return response.statusCode == 200;
    },
  );
});
