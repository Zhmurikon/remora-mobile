// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_in.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewIn extends ReviewIn {
  @override
  final bool? answerCorrect;
  @override
  final String cardId;
  @override
  final String clientReviewId;
  @override
  final StudyDirection direction;
  @override
  final int? durationMs;
  @override
  final StudyMode mode;
  @override
  final int rating;
  @override
  final DateTime reviewedAt;

  factory _$ReviewIn([void Function(ReviewInBuilder)? updates]) =>
      (ReviewInBuilder()..update(updates))._build();

  _$ReviewIn._(
      {this.answerCorrect,
      required this.cardId,
      required this.clientReviewId,
      required this.direction,
      this.durationMs,
      required this.mode,
      required this.rating,
      required this.reviewedAt})
      : super._();
  @override
  ReviewIn rebuild(void Function(ReviewInBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewInBuilder toBuilder() => ReviewInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewIn &&
        answerCorrect == other.answerCorrect &&
        cardId == other.cardId &&
        clientReviewId == other.clientReviewId &&
        direction == other.direction &&
        durationMs == other.durationMs &&
        mode == other.mode &&
        rating == other.rating &&
        reviewedAt == other.reviewedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, answerCorrect.hashCode);
    _$hash = $jc(_$hash, cardId.hashCode);
    _$hash = $jc(_$hash, clientReviewId.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, durationMs.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, reviewedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewIn')
          ..add('answerCorrect', answerCorrect)
          ..add('cardId', cardId)
          ..add('clientReviewId', clientReviewId)
          ..add('direction', direction)
          ..add('durationMs', durationMs)
          ..add('mode', mode)
          ..add('rating', rating)
          ..add('reviewedAt', reviewedAt))
        .toString();
  }
}

class ReviewInBuilder implements Builder<ReviewIn, ReviewInBuilder> {
  _$ReviewIn? _$v;

  bool? _answerCorrect;
  bool? get answerCorrect => _$this._answerCorrect;
  set answerCorrect(bool? answerCorrect) =>
      _$this._answerCorrect = answerCorrect;

  String? _cardId;
  String? get cardId => _$this._cardId;
  set cardId(String? cardId) => _$this._cardId = cardId;

  String? _clientReviewId;
  String? get clientReviewId => _$this._clientReviewId;
  set clientReviewId(String? clientReviewId) =>
      _$this._clientReviewId = clientReviewId;

  StudyDirection? _direction;
  StudyDirection? get direction => _$this._direction;
  set direction(StudyDirection? direction) => _$this._direction = direction;

  int? _durationMs;
  int? get durationMs => _$this._durationMs;
  set durationMs(int? durationMs) => _$this._durationMs = durationMs;

  StudyMode? _mode;
  StudyMode? get mode => _$this._mode;
  set mode(StudyMode? mode) => _$this._mode = mode;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  DateTime? _reviewedAt;
  DateTime? get reviewedAt => _$this._reviewedAt;
  set reviewedAt(DateTime? reviewedAt) => _$this._reviewedAt = reviewedAt;

  ReviewInBuilder() {
    ReviewIn._defaults(this);
  }

  ReviewInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _answerCorrect = $v.answerCorrect;
      _cardId = $v.cardId;
      _clientReviewId = $v.clientReviewId;
      _direction = $v.direction;
      _durationMs = $v.durationMs;
      _mode = $v.mode;
      _rating = $v.rating;
      _reviewedAt = $v.reviewedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewIn other) {
    _$v = other as _$ReviewIn;
  }

  @override
  void update(void Function(ReviewInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewIn build() => _build();

  _$ReviewIn _build() {
    final _$result = _$v ??
        _$ReviewIn._(
          answerCorrect: answerCorrect,
          cardId: BuiltValueNullFieldError.checkNotNull(
              cardId, r'ReviewIn', 'cardId'),
          clientReviewId: BuiltValueNullFieldError.checkNotNull(
              clientReviewId, r'ReviewIn', 'clientReviewId'),
          direction: BuiltValueNullFieldError.checkNotNull(
              direction, r'ReviewIn', 'direction'),
          durationMs: durationMs,
          mode:
              BuiltValueNullFieldError.checkNotNull(mode, r'ReviewIn', 'mode'),
          rating: BuiltValueNullFieldError.checkNotNull(
              rating, r'ReviewIn', 'rating'),
          reviewedAt: BuiltValueNullFieldError.checkNotNull(
              reviewedAt, r'ReviewIn', 'reviewedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
