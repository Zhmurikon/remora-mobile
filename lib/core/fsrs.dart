/// Порт FSRS-6 на Dart — только для предпросмотра интервалов на кнопках.
///
/// Расписание считает сервер, здесь не источник истины. Порт нужен, чтобы
/// подписать кнопки самооценки («через 10 минут» / «через 3 дня») без запроса
/// к API на каждый ответ, и чтобы после ответа офлайн интерфейс мог показать
/// ожидаемый срок до синхронизации.
///
/// Совпадение с сервером проверяется тестом по золотым фикстурам
/// (`fsrs-cases.json`), которые генерирует серверный SchedulerService.
/// Параметры и шаги обязаны совпадать с `app/services/scheduler.py`.
library;

import 'dart:math' as math;

import 'domain.dart';

const schedulerVersion = 'fsrs6-v1';

const _parameters = <double>[
  0.212, 1.2931, 2.3065, 8.2956, 6.4133, 0.8334, 3.0194, 0.001, 1.8722, 0.1666, 0.796, 1.4835,
  0.0614, 0.2629, 1.6483, 0.6014, 1.8729, 0.5425, 0.0912, 0.0658, 0.1542,
];

const _minute = 60000;
const _day = 86400000;

const _learningSteps = <int>[1 * _minute, 10 * _minute];
const _relearningSteps = <int>[10 * _minute];

final _initialStability = <int, double>{
  1: _parameters[0],
  2: _parameters[1],
  3: _parameters[2],
  4: _parameters[3],
};

const _stabilityMin = 0.001;
const _minDifficulty = 1.0;
const _maxDifficulty = 10.0;

const minDesiredRetention = 0.7;
const maxDesiredRetention = 0.98;
const maxIntervalDaysLimit = 36500;

final _decay = -_parameters[20];
final _factor = math.pow(0.9, 1 / _decay) - 1;

class SchedulerOptions {
  final double desiredRetention;
  final int maximumIntervalDays;

  const SchedulerOptions({
    this.desiredRetention = 0.9,
    this.maximumIntervalDays = 365,
  });
}

class FsrsState {
  final CardState state;
  final double? stability;
  final double? difficulty;
  final int? step;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;

  const FsrsState({
    required this.state,
    this.stability,
    this.difficulty,
    this.step,
    required this.dueAt,
    this.lastReviewedAt,
  });

  FsrsState copyWith({
    CardState? state,
    double? stability,
    double? difficulty,
    Object? step = _sentinel,
    DateTime? dueAt,
    DateTime? lastReviewedAt,
  }) {
    return FsrsState(
      state: state ?? this.state,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      step: step == _sentinel ? this.step : step as int?,
      dueAt: dueAt ?? this.dueAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
    );
  }
}

const _sentinel = Object();

class IntervalPreview {
  final Rating rating;
  final DateTime dueAt;
  final int intervalSeconds;

  const IntervalPreview({
    required this.rating,
    required this.dueAt,
    required this.intervalSeconds,
  });
}

/// Карточка, которую ещё ни разу не показывали.
FsrsState initialState(DateTime dueAt) {
  return FsrsState(
    state: cardStateNew,
    stability: null,
    difficulty: null,
    step: 0,
    dueAt: dueAt,
    lastReviewedAt: null,
  );
}

/// Применяет ответ и возвращает новое состояние.
FsrsState review(
  FsrsState state,
  Rating rating,
  DateTime reviewedAt, [
  SchedulerOptions options = const SchedulerOptions(),
]) {
  final desiredRetention = _clamp(
    options.desiredRetention,
    minDesiredRetention,
    maxDesiredRetention,
  );
  final maximumIntervalDays = _clamp(
    options.maximumIntervalDays.toDouble(),
    1,
    maxIntervalDaysLimit.toDouble(),
  ).truncate();
  final moment = reviewedAt.millisecondsSinceEpoch;

  final current = state.state == cardStateNew
      ? FsrsState(
          state: cardStateLearning,
          step: 0,
          stability: null,
          difficulty: null,
          dueAt: state.dueAt,
          lastReviewedAt: null,
        )
      : state;

  final daysSinceLastReview = current.lastReviewedAt == null
      ? null
      : ((moment - current.lastReviewedAt!.millisecondsSinceEpoch) / _day).floor();

  var stability = current.stability;
  var difficulty = current.difficulty;
  var nextState = current.state;
  var step = current.step;
  int intervalMs;

  int toReview() {
    nextState = cardStateReview;
    step = null;
    return _nextIntervalDays(stability!, desiredRetention, maximumIntervalDays) * _day;
  }

  if (current.state == cardStateLearning || current.state == cardStateRelearning) {
    final steps = current.state == cardStateLearning ? _learningSteps : _relearningSteps;
    int stepAt(int index) => index < steps.length ? steps[index] : (steps.isNotEmpty ? steps.last : _day);

    if (stability == null || difficulty == null) {
      stability = _clampStability(_initialStability[rating]!);
      difficulty = _clampDifficulty(_initialDifficulty(rating));
    } else if (daysSinceLastReview != null && daysSinceLastReview < 1) {
      stability = _shortTermStability(stability, rating);
      difficulty = _nextDifficulty(difficulty, rating);
    } else {
      stability = _nextStabilityFn(
        difficulty,
        stability,
        _retrievability(stability, current.lastReviewedAt, moment),
        rating,
      );
      difficulty = _nextDifficulty(difficulty, rating);
    }

    final currentStep = step ?? 0;
    if (steps.isEmpty || (currentStep >= steps.length && rating > 1)) {
      intervalMs = toReview();
    } else if (rating == 1) {
      step = 0;
      intervalMs = stepAt(0);
    } else if (rating == 2) {
      if (currentStep == 0 && steps.length == 1) {
        intervalMs = (stepAt(0) * 1.5).round();
      } else if (currentStep == 0) {
        intervalMs = ((stepAt(0) + stepAt(1)) / 2).round();
      } else {
        intervalMs = stepAt(currentStep);
      }
    } else if (rating == 3) {
      if (currentStep + 1 == steps.length) {
        intervalMs = toReview();
      } else {
        step = currentStep + 1;
        intervalMs = stepAt(step!);
      }
    } else {
      intervalMs = toReview();
    }
  } else {
    if (daysSinceLastReview != null && daysSinceLastReview < 1) {
      stability = _shortTermStability(stability!, rating);
    } else {
      stability = _nextStabilityFn(
        difficulty!,
        stability!,
        _retrievability(stability, current.lastReviewedAt, moment),
        rating,
      );
    }
    difficulty = _nextDifficulty(difficulty!, rating);

    if (rating == 1) {
      nextState = cardStateRelearning;
      step = 0;
      intervalMs = _relearningSteps.isNotEmpty ? _relearningSteps[0] : _day;
    } else {
      intervalMs = _nextIntervalDays(stability, desiredRetention, maximumIntervalDays) * _day;
    }
  }

  return FsrsState(
    state: nextState,
    stability: stability,
    difficulty: difficulty,
    step: step,
    dueAt: DateTime.fromMillisecondsSinceEpoch(moment + intervalMs, isUtc: true),
    lastReviewedAt: DateTime.fromMillisecondsSinceEpoch(moment, isUtc: true),
  );
}

/// Интервалы для всех четырёх оценок — подписи на кнопках самооценки.
List<IntervalPreview> previewIntervals(
  FsrsState state,
  DateTime now, [
  SchedulerOptions options = const SchedulerOptions(),
]) {
  return [1, 2, 3, 4].map((rating) {
    final after = review(state, rating, now, options);
    return IntervalPreview(
      rating: rating,
      dueAt: after.dueAt,
      intervalSeconds: math.max(
        0,
        ((after.dueAt.millisecondsSinceEpoch - now.millisecondsSinceEpoch) / 1000).round(),
      ),
    );
  }).toList();
}

double _retrievability(double stability, DateTime? lastReviewedAt, int moment) {
  if (lastReviewedAt == null) return 0;
  final elapsedDays = math.max(
    0,
    ((moment - lastReviewedAt.millisecondsSinceEpoch) / _day).floor(),
  );
  return math.pow(1 + (_factor * elapsedDays) / stability, _decay).toDouble();
}

int _nextIntervalDays(double stability, double desiredRetention, int maximumIntervalDays) {
  final raw = (stability / _factor) * (math.pow(desiredRetention, 1 / _decay) - 1);
  return _roundHalfToEven(raw.toDouble()).clamp(1, maximumIntervalDays);
}

double _initialDifficulty(Rating rating) {
  return _parameters[4] - math.exp(_parameters[5] * (rating - 1)) + 1;
}

double _shortTermStability(double stability, Rating rating) {
  var increase = math.exp(_parameters[17] * (rating - 3 + _parameters[18])) *
      math.pow(stability, -_parameters[19]);
  if (rating > 1) increase = math.max(increase, 1);
  return _clampStability(stability * increase);
}

double _nextDifficulty(double difficulty, Rating rating) {
  final easyInitial = _initialDifficulty(4);
  final deltaDifficulty = -(_parameters[6] * (rating - 3));
  final damped = difficulty + ((10 - difficulty) * deltaDifficulty) / 9;
  return _clampDifficulty(_parameters[7] * easyInitial + (1 - _parameters[7]) * damped);
}

double _nextStabilityFn(double difficulty, double stability, double retention, Rating rating) {
  if (rating == 1) {
    final longTerm = _parameters[11] *
        math.pow(difficulty, -_parameters[12]) *
        (math.pow(stability + 1, _parameters[13]) - 1) *
        math.exp((1 - retention) * _parameters[14]);
    final shortTerm = stability / math.exp(_parameters[17] * _parameters[18]);
    return _clampStability(math.min(longTerm, shortTerm));
  }
  final hardPenalty = rating == 2 ? _parameters[15] : 1.0;
  final easyBonus = rating == 4 ? _parameters[16] : 1.0;
  return _clampStability(
    stability *
        (1 +
            math.exp(_parameters[8]) *
                (11 - difficulty) *
                math.pow(stability, -_parameters[9]) *
                (math.exp((1 - retention) * _parameters[10]) - 1) *
                hardPenalty *
                easyBonus),
  );
}

/// Округление «до чётного», как встроенный round() в Python.
int _roundHalfToEven(double value) {
  final floor = value.floor();
  final diff = value - floor;
  if (diff > 0.5) return floor + 1;
  if (diff < 0.5) return floor;
  return floor.isEven ? floor : floor + 1;
}

double _clampStability(double value) => math.max(value, _stabilityMin);

double _clampDifficulty(double value) => _clamp(value, _minDifficulty, _maxDifficulty);

double _clamp(double value, double low, double high) => math.min(math.max(value, low), high);
