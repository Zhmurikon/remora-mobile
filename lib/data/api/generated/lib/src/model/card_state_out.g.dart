// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_state_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardStateOut extends CardStateOut {
  @override
  final String cardId;
  @override
  final num? difficulty;
  @override
  final StudyDirection direction;
  @override
  final DateTime dueAt;
  @override
  final int lapses;
  @override
  final DateTime? lastReviewedAt;
  @override
  final int reps;
  @override
  final num? stability;
  @override
  final CardStateKind state;
  @override
  final DateTime? suspendedAt;

  factory _$CardStateOut([void Function(CardStateOutBuilder)? updates]) =>
      (CardStateOutBuilder()..update(updates))._build();

  _$CardStateOut._(
      {required this.cardId,
      this.difficulty,
      required this.direction,
      required this.dueAt,
      required this.lapses,
      this.lastReviewedAt,
      required this.reps,
      this.stability,
      required this.state,
      this.suspendedAt})
      : super._();
  @override
  CardStateOut rebuild(void Function(CardStateOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardStateOutBuilder toBuilder() => CardStateOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardStateOut &&
        cardId == other.cardId &&
        difficulty == other.difficulty &&
        direction == other.direction &&
        dueAt == other.dueAt &&
        lapses == other.lapses &&
        lastReviewedAt == other.lastReviewedAt &&
        reps == other.reps &&
        stability == other.stability &&
        state == other.state &&
        suspendedAt == other.suspendedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardId.hashCode);
    _$hash = $jc(_$hash, difficulty.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, dueAt.hashCode);
    _$hash = $jc(_$hash, lapses.hashCode);
    _$hash = $jc(_$hash, lastReviewedAt.hashCode);
    _$hash = $jc(_$hash, reps.hashCode);
    _$hash = $jc(_$hash, stability.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, suspendedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardStateOut')
          ..add('cardId', cardId)
          ..add('difficulty', difficulty)
          ..add('direction', direction)
          ..add('dueAt', dueAt)
          ..add('lapses', lapses)
          ..add('lastReviewedAt', lastReviewedAt)
          ..add('reps', reps)
          ..add('stability', stability)
          ..add('state', state)
          ..add('suspendedAt', suspendedAt))
        .toString();
  }
}

class CardStateOutBuilder
    implements Builder<CardStateOut, CardStateOutBuilder> {
  _$CardStateOut? _$v;

  String? _cardId;
  String? get cardId => _$this._cardId;
  set cardId(String? cardId) => _$this._cardId = cardId;

  num? _difficulty;
  num? get difficulty => _$this._difficulty;
  set difficulty(num? difficulty) => _$this._difficulty = difficulty;

  StudyDirection? _direction;
  StudyDirection? get direction => _$this._direction;
  set direction(StudyDirection? direction) => _$this._direction = direction;

  DateTime? _dueAt;
  DateTime? get dueAt => _$this._dueAt;
  set dueAt(DateTime? dueAt) => _$this._dueAt = dueAt;

  int? _lapses;
  int? get lapses => _$this._lapses;
  set lapses(int? lapses) => _$this._lapses = lapses;

  DateTime? _lastReviewedAt;
  DateTime? get lastReviewedAt => _$this._lastReviewedAt;
  set lastReviewedAt(DateTime? lastReviewedAt) =>
      _$this._lastReviewedAt = lastReviewedAt;

  int? _reps;
  int? get reps => _$this._reps;
  set reps(int? reps) => _$this._reps = reps;

  num? _stability;
  num? get stability => _$this._stability;
  set stability(num? stability) => _$this._stability = stability;

  CardStateKind? _state;
  CardStateKind? get state => _$this._state;
  set state(CardStateKind? state) => _$this._state = state;

  DateTime? _suspendedAt;
  DateTime? get suspendedAt => _$this._suspendedAt;
  set suspendedAt(DateTime? suspendedAt) => _$this._suspendedAt = suspendedAt;

  CardStateOutBuilder() {
    CardStateOut._defaults(this);
  }

  CardStateOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardId = $v.cardId;
      _difficulty = $v.difficulty;
      _direction = $v.direction;
      _dueAt = $v.dueAt;
      _lapses = $v.lapses;
      _lastReviewedAt = $v.lastReviewedAt;
      _reps = $v.reps;
      _stability = $v.stability;
      _state = $v.state;
      _suspendedAt = $v.suspendedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardStateOut other) {
    _$v = other as _$CardStateOut;
  }

  @override
  void update(void Function(CardStateOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardStateOut build() => _build();

  _$CardStateOut _build() {
    final _$result = _$v ??
        _$CardStateOut._(
          cardId: BuiltValueNullFieldError.checkNotNull(
              cardId, r'CardStateOut', 'cardId'),
          difficulty: difficulty,
          direction: BuiltValueNullFieldError.checkNotNull(
              direction, r'CardStateOut', 'direction'),
          dueAt: BuiltValueNullFieldError.checkNotNull(
              dueAt, r'CardStateOut', 'dueAt'),
          lapses: BuiltValueNullFieldError.checkNotNull(
              lapses, r'CardStateOut', 'lapses'),
          lastReviewedAt: lastReviewedAt,
          reps: BuiltValueNullFieldError.checkNotNull(
              reps, r'CardStateOut', 'reps'),
          stability: stability,
          state: BuiltValueNullFieldError.checkNotNull(
              state, r'CardStateOut', 'state'),
          suspendedAt: suspendedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
