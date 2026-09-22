// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_stats.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetStats extends SetStats {
  @override
  final int cardsTotal;
  @override
  final StateDistribution distribution;
  @override
  final int dueNow;
  @override
  final BuiltList<ForecastDay> forecast;
  @override
  final DateTime? lastStudiedAt;
  @override
  final int learningCount;
  @override
  final int masteredCount;
  @override
  final num masteryPercent;
  @override
  final int notStartedCount;
  @override
  final BuiltList<ProblemCard> problemCards;
  @override
  final String setId;

  factory _$SetStats([void Function(SetStatsBuilder)? updates]) =>
      (SetStatsBuilder()..update(updates))._build();

  _$SetStats._(
      {required this.cardsTotal,
      required this.distribution,
      required this.dueNow,
      required this.forecast,
      this.lastStudiedAt,
      required this.learningCount,
      required this.masteredCount,
      required this.masteryPercent,
      required this.notStartedCount,
      required this.problemCards,
      required this.setId})
      : super._();
  @override
  SetStats rebuild(void Function(SetStatsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetStatsBuilder toBuilder() => SetStatsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetStats &&
        cardsTotal == other.cardsTotal &&
        distribution == other.distribution &&
        dueNow == other.dueNow &&
        forecast == other.forecast &&
        lastStudiedAt == other.lastStudiedAt &&
        learningCount == other.learningCount &&
        masteredCount == other.masteredCount &&
        masteryPercent == other.masteryPercent &&
        notStartedCount == other.notStartedCount &&
        problemCards == other.problemCards &&
        setId == other.setId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardsTotal.hashCode);
    _$hash = $jc(_$hash, distribution.hashCode);
    _$hash = $jc(_$hash, dueNow.hashCode);
    _$hash = $jc(_$hash, forecast.hashCode);
    _$hash = $jc(_$hash, lastStudiedAt.hashCode);
    _$hash = $jc(_$hash, learningCount.hashCode);
    _$hash = $jc(_$hash, masteredCount.hashCode);
    _$hash = $jc(_$hash, masteryPercent.hashCode);
    _$hash = $jc(_$hash, notStartedCount.hashCode);
    _$hash = $jc(_$hash, problemCards.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetStats')
          ..add('cardsTotal', cardsTotal)
          ..add('distribution', distribution)
          ..add('dueNow', dueNow)
          ..add('forecast', forecast)
          ..add('lastStudiedAt', lastStudiedAt)
          ..add('learningCount', learningCount)
          ..add('masteredCount', masteredCount)
          ..add('masteryPercent', masteryPercent)
          ..add('notStartedCount', notStartedCount)
          ..add('problemCards', problemCards)
          ..add('setId', setId))
        .toString();
  }
}

class SetStatsBuilder implements Builder<SetStats, SetStatsBuilder> {
  _$SetStats? _$v;

  int? _cardsTotal;
  int? get cardsTotal => _$this._cardsTotal;
  set cardsTotal(int? cardsTotal) => _$this._cardsTotal = cardsTotal;

  StateDistributionBuilder? _distribution;
  StateDistributionBuilder get distribution =>
      _$this._distribution ??= StateDistributionBuilder();
  set distribution(StateDistributionBuilder? distribution) =>
      _$this._distribution = distribution;

  int? _dueNow;
  int? get dueNow => _$this._dueNow;
  set dueNow(int? dueNow) => _$this._dueNow = dueNow;

  ListBuilder<ForecastDay>? _forecast;
  ListBuilder<ForecastDay> get forecast =>
      _$this._forecast ??= ListBuilder<ForecastDay>();
  set forecast(ListBuilder<ForecastDay>? forecast) =>
      _$this._forecast = forecast;

  DateTime? _lastStudiedAt;
  DateTime? get lastStudiedAt => _$this._lastStudiedAt;
  set lastStudiedAt(DateTime? lastStudiedAt) =>
      _$this._lastStudiedAt = lastStudiedAt;

  int? _learningCount;
  int? get learningCount => _$this._learningCount;
  set learningCount(int? learningCount) =>
      _$this._learningCount = learningCount;

  int? _masteredCount;
  int? get masteredCount => _$this._masteredCount;
  set masteredCount(int? masteredCount) =>
      _$this._masteredCount = masteredCount;

  num? _masteryPercent;
  num? get masteryPercent => _$this._masteryPercent;
  set masteryPercent(num? masteryPercent) =>
      _$this._masteryPercent = masteryPercent;

  int? _notStartedCount;
  int? get notStartedCount => _$this._notStartedCount;
  set notStartedCount(int? notStartedCount) =>
      _$this._notStartedCount = notStartedCount;

  ListBuilder<ProblemCard>? _problemCards;
  ListBuilder<ProblemCard> get problemCards =>
      _$this._problemCards ??= ListBuilder<ProblemCard>();
  set problemCards(ListBuilder<ProblemCard>? problemCards) =>
      _$this._problemCards = problemCards;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  SetStatsBuilder() {
    SetStats._defaults(this);
  }

  SetStatsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardsTotal = $v.cardsTotal;
      _distribution = $v.distribution.toBuilder();
      _dueNow = $v.dueNow;
      _forecast = $v.forecast.toBuilder();
      _lastStudiedAt = $v.lastStudiedAt;
      _learningCount = $v.learningCount;
      _masteredCount = $v.masteredCount;
      _masteryPercent = $v.masteryPercent;
      _notStartedCount = $v.notStartedCount;
      _problemCards = $v.problemCards.toBuilder();
      _setId = $v.setId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetStats other) {
    _$v = other as _$SetStats;
  }

  @override
  void update(void Function(SetStatsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetStats build() => _build();

  _$SetStats _build() {
    _$SetStats _$result;
    try {
      _$result = _$v ??
          _$SetStats._(
            cardsTotal: BuiltValueNullFieldError.checkNotNull(
                cardsTotal, r'SetStats', 'cardsTotal'),
            distribution: distribution.build(),
            dueNow: BuiltValueNullFieldError.checkNotNull(
                dueNow, r'SetStats', 'dueNow'),
            forecast: forecast.build(),
            lastStudiedAt: lastStudiedAt,
            learningCount: BuiltValueNullFieldError.checkNotNull(
                learningCount, r'SetStats', 'learningCount'),
            masteredCount: BuiltValueNullFieldError.checkNotNull(
                masteredCount, r'SetStats', 'masteredCount'),
            masteryPercent: BuiltValueNullFieldError.checkNotNull(
                masteryPercent, r'SetStats', 'masteryPercent'),
            notStartedCount: BuiltValueNullFieldError.checkNotNull(
                notStartedCount, r'SetStats', 'notStartedCount'),
            problemCards: problemCards.build(),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'SetStats', 'setId'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'distribution';
        distribution.build();

        _$failedField = 'forecast';
        forecast.build();

        _$failedField = 'problemCards';
        problemCards.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SetStats', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
