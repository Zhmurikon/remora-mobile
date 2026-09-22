// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_card.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProblemCard extends ProblemCard {
  @override
  final String cardId;
  @override
  final String definition;
  @override
  final int lapses;
  @override
  final int reps;
  @override
  final num retrievability;
  @override
  final String term;

  factory _$ProblemCard([void Function(ProblemCardBuilder)? updates]) =>
      (ProblemCardBuilder()..update(updates))._build();

  _$ProblemCard._(
      {required this.cardId,
      required this.definition,
      required this.lapses,
      required this.reps,
      required this.retrievability,
      required this.term})
      : super._();
  @override
  ProblemCard rebuild(void Function(ProblemCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProblemCardBuilder toBuilder() => ProblemCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProblemCard &&
        cardId == other.cardId &&
        definition == other.definition &&
        lapses == other.lapses &&
        reps == other.reps &&
        retrievability == other.retrievability &&
        term == other.term;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardId.hashCode);
    _$hash = $jc(_$hash, definition.hashCode);
    _$hash = $jc(_$hash, lapses.hashCode);
    _$hash = $jc(_$hash, reps.hashCode);
    _$hash = $jc(_$hash, retrievability.hashCode);
    _$hash = $jc(_$hash, term.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProblemCard')
          ..add('cardId', cardId)
          ..add('definition', definition)
          ..add('lapses', lapses)
          ..add('reps', reps)
          ..add('retrievability', retrievability)
          ..add('term', term))
        .toString();
  }
}

class ProblemCardBuilder implements Builder<ProblemCard, ProblemCardBuilder> {
  _$ProblemCard? _$v;

  String? _cardId;
  String? get cardId => _$this._cardId;
  set cardId(String? cardId) => _$this._cardId = cardId;

  String? _definition;
  String? get definition => _$this._definition;
  set definition(String? definition) => _$this._definition = definition;

  int? _lapses;
  int? get lapses => _$this._lapses;
  set lapses(int? lapses) => _$this._lapses = lapses;

  int? _reps;
  int? get reps => _$this._reps;
  set reps(int? reps) => _$this._reps = reps;

  num? _retrievability;
  num? get retrievability => _$this._retrievability;
  set retrievability(num? retrievability) =>
      _$this._retrievability = retrievability;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  ProblemCardBuilder() {
    ProblemCard._defaults(this);
  }

  ProblemCardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardId = $v.cardId;
      _definition = $v.definition;
      _lapses = $v.lapses;
      _reps = $v.reps;
      _retrievability = $v.retrievability;
      _term = $v.term;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProblemCard other) {
    _$v = other as _$ProblemCard;
  }

  @override
  void update(void Function(ProblemCardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProblemCard build() => _build();

  _$ProblemCard _build() {
    final _$result = _$v ??
        _$ProblemCard._(
          cardId: BuiltValueNullFieldError.checkNotNull(
              cardId, r'ProblemCard', 'cardId'),
          definition: BuiltValueNullFieldError.checkNotNull(
              definition, r'ProblemCard', 'definition'),
          lapses: BuiltValueNullFieldError.checkNotNull(
              lapses, r'ProblemCard', 'lapses'),
          reps: BuiltValueNullFieldError.checkNotNull(
              reps, r'ProblemCard', 'reps'),
          retrievability: BuiltValueNullFieldError.checkNotNull(
              retrievability, r'ProblemCard', 'retrievability'),
          term: BuiltValueNullFieldError.checkNotNull(
              term, r'ProblemCard', 'term'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
