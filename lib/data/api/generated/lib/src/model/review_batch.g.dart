// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_batch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewBatch extends ReviewBatch {
  @override
  final BuiltList<ReviewIn> reviews;
  @override
  final String? sessionId;

  factory _$ReviewBatch([void Function(ReviewBatchBuilder)? updates]) =>
      (ReviewBatchBuilder()..update(updates))._build();

  _$ReviewBatch._({required this.reviews, this.sessionId}) : super._();
  @override
  ReviewBatch rebuild(void Function(ReviewBatchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBatchBuilder toBuilder() => ReviewBatchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewBatch &&
        reviews == other.reviews &&
        sessionId == other.sessionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reviews.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewBatch')
          ..add('reviews', reviews)
          ..add('sessionId', sessionId))
        .toString();
  }
}

class ReviewBatchBuilder implements Builder<ReviewBatch, ReviewBatchBuilder> {
  _$ReviewBatch? _$v;

  ListBuilder<ReviewIn>? _reviews;
  ListBuilder<ReviewIn> get reviews =>
      _$this._reviews ??= ListBuilder<ReviewIn>();
  set reviews(ListBuilder<ReviewIn>? reviews) => _$this._reviews = reviews;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  ReviewBatchBuilder() {
    ReviewBatch._defaults(this);
  }

  ReviewBatchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reviews = $v.reviews.toBuilder();
      _sessionId = $v.sessionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewBatch other) {
    _$v = other as _$ReviewBatch;
  }

  @override
  void update(void Function(ReviewBatchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewBatch build() => _build();

  _$ReviewBatch _build() {
    _$ReviewBatch _$result;
    try {
      _$result = _$v ??
          _$ReviewBatch._(
            reviews: reviews.build(),
            sessionId: sessionId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reviews';
        reviews.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReviewBatch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
