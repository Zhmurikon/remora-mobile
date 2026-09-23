import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/data/connectivity_controller.dart';

/// Машина состояний предохранителя связи. Пробу и поток connectivity внедряем,
/// таймер бэкоффа уводим далеко (100 с), чтобы пробами управлять вручную —
/// так тесты детерминированы и не зависят от реального времени.
void main() {
  late StreamController<List<ConnectivityResult>> conn;
  late bool probeResult;
  late int probeCalls;

  setUp(() {
    conn = StreamController<List<ConnectivityResult>>.broadcast();
    probeResult = false;
    probeCalls = 0;
  });

  tearDown(() async {
    await conn.close();
  });

  ConnectivityController make({
    List<Duration> backoff = const [Duration(seconds: 100)],
  }) {
    return ConnectivityController(
      probe: () async {
        probeCalls++;
        return probeResult;
      },
      connectivityStream: conn.stream,
      backoff: backoff,
    );
  }

  test('два сбоя подряд открывают предохранитель, один — нет', () {
    final c = make();
    c.reportFailure();
    expect(c.state.mode, NetMode.online);
    expect(c.state.failureStreak, 1);

    c.reportFailure();
    expect(c.state.mode, NetMode.offline);
    c.dispose();
  });

  test('успех обнуляет счётчик сбоев', () {
    final c = make();
    c.reportFailure();
    c.reportSuccess();
    expect(c.state.mode, NetMode.online);
    expect(c.state.failureStreak, 0);
    c.dispose();
  });

  test('успешная проба закрывает предохранитель', () async {
    final c = make();
    c.reportFailure();
    c.reportFailure();
    expect(c.state.mode, NetMode.offline);

    probeResult = true;
    c.retry();
    await pumpEventQueue();

    expect(c.state.mode, NetMode.online);
    expect(probeCalls, 1);
    c.dispose();
  });

  test('провал пробы оставляет офлайн и увеличивает шаг бэкоффа', () async {
    final c = make(backoff: const [Duration(seconds: 100), Duration(seconds: 200)]);
    c.reportFailure();
    c.reportFailure();
    expect(c.state.backoffStep, 0);

    probeResult = false;
    c.retry();
    await pumpEventQueue();

    expect(c.state.mode, NetMode.offline);
    expect(c.state.backoffStep, 1);
    c.dispose();
  });

  test('ручной офлайн игнорирует сбои, успехи и пробы', () async {
    final c = make();
    c.setManualOffline(true);
    expect(c.state.mode, NetMode.manualOffline);

    c.reportFailure();
    c.reportFailure();
    c.reportSuccess();
    expect(c.state.mode, NetMode.manualOffline);

    probeResult = true;
    c.retry();
    await pumpEventQueue();
    expect(c.state.mode, NetMode.manualOffline);
    expect(probeCalls, 0);
    c.dispose();
  });

  test('выключение ручного офлайна пробует связь', () async {
    final c = make();
    c.setManualOffline(true);
    probeResult = true;

    c.setManualOffline(false);
    await pumpEventQueue();

    expect(c.state.mode, NetMode.online);
    c.dispose();
  });

  test('возврат радио пробует связь, когда мы офлайн', () async {
    final c = make();
    c.reportFailure();
    c.reportFailure();
    expect(c.state.mode, NetMode.offline);

    probeResult = true;
    conn.add([ConnectivityResult.wifi]);
    await pumpEventQueue();

    expect(c.state.mode, NetMode.online);
    c.dispose();
  });

  test('пропажа радио (none) пробу не запускает', () async {
    final c = make();
    c.reportFailure();
    c.reportFailure();

    probeResult = true;
    conn.add([ConnectivityResult.none]);
    await pumpEventQueue();

    expect(c.state.mode, NetMode.offline);
    expect(probeCalls, 0);
    c.dispose();
  });
}
