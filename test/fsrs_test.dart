import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/core/format.dart';
import 'package:remora_mobile/core/fsrs.dart';

FsrsState _toState(Map<String, dynamic> raw) {
  return FsrsState(
    state: raw['state'] as String,
    stability: (raw['stability'] as num?)?.toDouble(),
    difficulty: (raw['difficulty'] as num?)?.toDouble(),
    step: raw['step'] as int?,
    dueAt: DateTime.parse(raw['dueAt'] as String),
    lastReviewedAt:
        raw['lastReviewedAt'] == null ? null : DateTime.parse(raw['lastReviewedAt'] as String),
  );
}

SchedulerOptions _toOptions(Map<String, dynamic>? raw) {
  if (raw == null) return const SchedulerOptions();
  return SchedulerOptions(
    desiredRetention: (raw['desiredRetention'] as num?)?.toDouble() ?? 0.9,
    maximumIntervalDays: (raw['maximumIntervalDays'] as int?) ?? 365,
  );
}

void main() {
  final casesFile = File('../../packages/core/src/fsrs-cases.json');
  final casesJson = jsonDecode(casesFile.readAsStringSync()) as Map<String, dynamic>;
  final cases = (casesJson['cases'] as List).cast<Map<String, dynamic>>();

  test('использует ту же версию планировщика', () {
    expect(casesJson['schedulerVersion'], schedulerVersion);
  });

  group('сверка Dart-порта FSRS с серверным планировщиком', () {
    for (final fixture in cases) {
      test(fixture['name'] as String, () {
        final state = _toState(fixture['state'] as Map<String, dynamic>);
        final now = DateTime.parse(fixture['now'] as String);
        final options = _toOptions(fixture['options'] as Map<String, dynamic>?);

        // Предпросмотры
        final previews = previewIntervals(state, now, options);
        final expectedPreviews = (fixture['previews'] as List).cast<Map<String, dynamic>>();

        expect(previews.length, expectedPreviews.length);
        for (var i = 0; i < previews.length; i++) {
          expect(
            previews[i].dueAt.toIso8601String(),
            DateTime.parse(expectedPreviews[i]['dueAt'] as String).toIso8601String(),
            reason: 'preview[$i].dueAt',
          );
          expect(
            previews[i].intervalSeconds,
            expectedPreviews[i]['intervalSeconds'],
            reason: 'preview[$i].intervalSeconds',
          );
        }

        // Состояния после каждого rating
        final afterList = (fixture['after'] as List).cast<Map<String, dynamic>>();
        for (final expected in afterList) {
          final rating = expected['rating'] as int;
          final expectedState = expected['state'] as Map<String, dynamic>;
          final actual = review(state, rating, now, options);

          expect(actual.state, expectedState['state'], reason: 'r$rating.state');
          expect(
            actual.dueAt.toIso8601String(),
            DateTime.parse(expectedState['dueAt'] as String).toIso8601String(),
            reason: 'r$rating.dueAt',
          );
          expect(actual.step, expectedState['step'], reason: 'r$rating.step');
          expect(
            actual.stability,
            closeTo((expectedState['stability'] as num).toDouble(), 1e-6),
            reason: 'r$rating.stability',
          );
          expect(
            actual.difficulty,
            closeTo((expectedState['difficulty'] as num).toDouble(), 1e-6),
            reason: 'r$rating.difficulty',
          );
        }
      });
    }
  });

  group('предпросмотр интервалов', () {
    final now = DateTime.parse('2026-03-01T09:00:00Z');

    test('растёт от «не помню» к «легко»', () {
      final intervals = previewIntervals(initialState(now), now)
          .map((p) => p.intervalSeconds)
          .toList();
      final sorted = [...intervals]..sort();
      expect(intervals, sorted);
      expect(intervals[0], lessThan(intervals[3]));
    });

    test('учитывает целевое удержание', () {
      final state = initialState(now);
      final relaxed = review(state, 4, now, const SchedulerOptions(desiredRetention: 0.8));
      final strict = review(state, 4, now, const SchedulerOptions(desiredRetention: 0.95));
      expect(strict.dueAt.millisecondsSinceEpoch, lessThan(relaxed.dueAt.millisecondsSinceEpoch));
    });

    test('не выходит за максимальный интервал', () {
      var state = initialState(now);
      var moment = now;
      for (var i = 0; i < 12; i++) {
        state = review(state, 4, moment, const SchedulerOptions(maximumIntervalDays: 30));
        expect(
          state.dueAt.millisecondsSinceEpoch - moment.millisecondsSinceEpoch,
          lessThanOrEqualTo(30 * 86400000),
        );
        moment = state.dueAt;
      }
    });
  });

  group('подписи интервалов на кнопках самооценки', () {
    const pairs = <(int, String)>[
      (30, '1 минута'),
      (60, '1 минута'),
      (600, '10 минут'),
      (7200, '2 часа'),
      (86400, '1 день'),
      (86400 * 3, '3 дня'),
      (86400 * 11, '11 дней'),
      (86400 * 365, '1 год'),
    ];

    for (final (seconds, expected) in pairs) {
      test('$seconds секунд → $expected', () {
        expect(formatIntervalSeconds(seconds), expected);
      });
    }
  });
}
