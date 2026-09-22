// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_preview_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RatingPreviewOut extends RatingPreviewOut {
  @override
  final DateTime dueAt;
  @override
  final int intervalSeconds;
  @override
  final int rating;

  factory _$RatingPreviewOut(
          [void Function(RatingPreviewOutBuilder)? updates]) =>
      (RatingPreviewOutBuilder()..update(updates))._build();

  _$RatingPreviewOut._(
      {required this.dueAt,
      required this.intervalSeconds,
      required this.rating})
      : super._();
  @override
  RatingPreviewOut rebuild(void Function(RatingPreviewOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingPreviewOutBuilder toBuilder() =>
      RatingPreviewOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RatingPreviewOut &&
        dueAt == other.dueAt &&
        intervalSeconds == other.intervalSeconds &&
        rating == other.rating;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dueAt.hashCode);
    _$hash = $jc(_$hash, intervalSeconds.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RatingPreviewOut')
          ..add('dueAt', dueAt)
          ..add('intervalSeconds', intervalSeconds)
          ..add('rating', rating))
        .toString();
  }
}

class RatingPreviewOutBuilder
    implements Builder<RatingPreviewOut, RatingPreviewOutBuilder> {
  _$RatingPreviewOut? _$v;

  DateTime? _dueAt;
  DateTime? get dueAt => _$this._dueAt;
  set dueAt(DateTime? dueAt) => _$this._dueAt = dueAt;

  int? _intervalSeconds;
  int? get intervalSeconds => _$this._intervalSeconds;
  set intervalSeconds(int? intervalSeconds) =>
      _$this._intervalSeconds = intervalSeconds;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  RatingPreviewOutBuilder() {
    RatingPreviewOut._defaults(this);
  }

  RatingPreviewOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dueAt = $v.dueAt;
      _intervalSeconds = $v.intervalSeconds;
      _rating = $v.rating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RatingPreviewOut other) {
    _$v = other as _$RatingPreviewOut;
  }

  @override
  void update(void Function(RatingPreviewOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RatingPreviewOut build() => _build();

  _$RatingPreviewOut _build() {
    final _$result = _$v ??
        _$RatingPreviewOut._(
          dueAt: BuiltValueNullFieldError.checkNotNull(
              dueAt, r'RatingPreviewOut', 'dueAt'),
          intervalSeconds: BuiltValueNullFieldError.checkNotNull(
              intervalSeconds, r'RatingPreviewOut', 'intervalSeconds'),
          rating: BuiltValueNullFieldError.checkNotNull(
              rating, r'RatingPreviewOut', 'rating'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
