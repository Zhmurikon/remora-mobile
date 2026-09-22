// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_distribution.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StateDistribution extends StateDistribution {
  @override
  final int? learning;
  @override
  final int? new_;
  @override
  final int? relearning;
  @override
  final int? review;

  factory _$StateDistribution(
          [void Function(StateDistributionBuilder)? updates]) =>
      (StateDistributionBuilder()..update(updates))._build();

  _$StateDistribution._(
      {this.learning, this.new_, this.relearning, this.review})
      : super._();
  @override
  StateDistribution rebuild(void Function(StateDistributionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StateDistributionBuilder toBuilder() =>
      StateDistributionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StateDistribution &&
        learning == other.learning &&
        new_ == other.new_ &&
        relearning == other.relearning &&
        review == other.review;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, learning.hashCode);
    _$hash = $jc(_$hash, new_.hashCode);
    _$hash = $jc(_$hash, relearning.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StateDistribution')
          ..add('learning', learning)
          ..add('new_', new_)
          ..add('relearning', relearning)
          ..add('review', review))
        .toString();
  }
}

class StateDistributionBuilder
    implements Builder<StateDistribution, StateDistributionBuilder> {
  _$StateDistribution? _$v;

  int? _learning;
  int? get learning => _$this._learning;
  set learning(int? learning) => _$this._learning = learning;

  int? _new_;
  int? get new_ => _$this._new_;
  set new_(int? new_) => _$this._new_ = new_;

  int? _relearning;
  int? get relearning => _$this._relearning;
  set relearning(int? relearning) => _$this._relearning = relearning;

  int? _review;
  int? get review => _$this._review;
  set review(int? review) => _$this._review = review;

  StateDistributionBuilder() {
    StateDistribution._defaults(this);
  }

  StateDistributionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _learning = $v.learning;
      _new_ = $v.new_;
      _relearning = $v.relearning;
      _review = $v.review;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StateDistribution other) {
    _$v = other as _$StateDistribution;
  }

  @override
  void update(void Function(StateDistributionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StateDistribution build() => _build();

  _$StateDistribution _build() {
    final _$result = _$v ??
        _$StateDistribution._(
          learning: learning,
          new_: new_,
          relearning: relearning,
          review: review,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
