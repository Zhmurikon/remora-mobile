// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_batch_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewBatchResult extends ReviewBatchResult {
  @override
  final BuiltList<String> accepted;
  @override
  final BuiltList<String> duplicates;
  @override
  final BuiltList<String> rejected;
  @override
  final BuiltList<CardStateOut> states;

  factory _$ReviewBatchResult(
          [void Function(ReviewBatchResultBuilder)? updates]) =>
      (ReviewBatchResultBuilder()..update(updates))._build();

  _$ReviewBatchResult._(
      {required this.accepted,
      required this.duplicates,
      required this.rejected,
      required this.states})
      : super._();
  @override
  ReviewBatchResult rebuild(void Function(ReviewBatchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBatchResultBuilder toBuilder() =>
      ReviewBatchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewBatchResult &&
        accepted == other.accepted &&
        duplicates == other.duplicates &&
        rejected == other.rejected &&
        states == other.states;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accepted.hashCode);
    _$hash = $jc(_$hash, duplicates.hashCode);
    _$hash = $jc(_$hash, rejected.hashCode);
    _$hash = $jc(_$hash, states.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewBatchResult')
          ..add('accepted', accepted)
          ..add('duplicates', duplicates)
          ..add('rejected', rejected)
          ..add('states', states))
        .toString();
  }
}

class ReviewBatchResultBuilder
    implements Builder<ReviewBatchResult, ReviewBatchResultBuilder> {
  _$ReviewBatchResult? _$v;

  ListBuilder<String>? _accepted;
  ListBuilder<String> get accepted =>
      _$this._accepted ??= ListBuilder<String>();
  set accepted(ListBuilder<String>? accepted) => _$this._accepted = accepted;

  ListBuilder<String>? _duplicates;
  ListBuilder<String> get duplicates =>
      _$this._duplicates ??= ListBuilder<String>();
  set duplicates(ListBuilder<String>? duplicates) =>
      _$this._duplicates = duplicates;

  ListBuilder<String>? _rejected;
  ListBuilder<String> get rejected =>
      _$this._rejected ??= ListBuilder<String>();
  set rejected(ListBuilder<String>? rejected) => _$this._rejected = rejected;

  ListBuilder<CardStateOut>? _states;
  ListBuilder<CardStateOut> get states =>
      _$this._states ??= ListBuilder<CardStateOut>();
  set states(ListBuilder<CardStateOut>? states) => _$this._states = states;

  ReviewBatchResultBuilder() {
    ReviewBatchResult._defaults(this);
  }

  ReviewBatchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accepted = $v.accepted.toBuilder();
      _duplicates = $v.duplicates.toBuilder();
      _rejected = $v.rejected.toBuilder();
      _states = $v.states.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewBatchResult other) {
    _$v = other as _$ReviewBatchResult;
  }

  @override
  void update(void Function(ReviewBatchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewBatchResult build() => _build();

  _$ReviewBatchResult _build() {
    _$ReviewBatchResult _$result;
    try {
      _$result = _$v ??
          _$ReviewBatchResult._(
            accepted: accepted.build(),
            duplicates: duplicates.build(),
            rejected: rejected.build(),
            states: states.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accepted';
        accepted.build();
        _$failedField = 'duplicates';
        duplicates.build();
        _$failedField = 'rejected';
        rejected.build();
        _$failedField = 'states';
        states.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReviewBatchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
