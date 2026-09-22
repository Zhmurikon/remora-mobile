// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestResult extends TestResult {
  @override
  final String attemptId;
  @override
  final int correctCount;
  @override
  final DateTime finishedAt;
  @override
  final BuiltList<TestQuestionReview> review;
  @override
  final num score;
  @override
  final String setId;
  @override
  final int total;
  @override
  final BuiltList<String> wrongCardIds;

  factory _$TestResult([void Function(TestResultBuilder)? updates]) =>
      (TestResultBuilder()..update(updates))._build();

  _$TestResult._(
      {required this.attemptId,
      required this.correctCount,
      required this.finishedAt,
      required this.review,
      required this.score,
      required this.setId,
      required this.total,
      required this.wrongCardIds})
      : super._();
  @override
  TestResult rebuild(void Function(TestResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestResultBuilder toBuilder() => TestResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestResult &&
        attemptId == other.attemptId &&
        correctCount == other.correctCount &&
        finishedAt == other.finishedAt &&
        review == other.review &&
        score == other.score &&
        setId == other.setId &&
        total == other.total &&
        wrongCardIds == other.wrongCardIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attemptId.hashCode);
    _$hash = $jc(_$hash, correctCount.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, wrongCardIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestResult')
          ..add('attemptId', attemptId)
          ..add('correctCount', correctCount)
          ..add('finishedAt', finishedAt)
          ..add('review', review)
          ..add('score', score)
          ..add('setId', setId)
          ..add('total', total)
          ..add('wrongCardIds', wrongCardIds))
        .toString();
  }
}

class TestResultBuilder implements Builder<TestResult, TestResultBuilder> {
  _$TestResult? _$v;

  String? _attemptId;
  String? get attemptId => _$this._attemptId;
  set attemptId(String? attemptId) => _$this._attemptId = attemptId;

  int? _correctCount;
  int? get correctCount => _$this._correctCount;
  set correctCount(int? correctCount) => _$this._correctCount = correctCount;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  ListBuilder<TestQuestionReview>? _review;
  ListBuilder<TestQuestionReview> get review =>
      _$this._review ??= ListBuilder<TestQuestionReview>();
  set review(ListBuilder<TestQuestionReview>? review) =>
      _$this._review = review;

  num? _score;
  num? get score => _$this._score;
  set score(num? score) => _$this._score = score;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<String>? _wrongCardIds;
  ListBuilder<String> get wrongCardIds =>
      _$this._wrongCardIds ??= ListBuilder<String>();
  set wrongCardIds(ListBuilder<String>? wrongCardIds) =>
      _$this._wrongCardIds = wrongCardIds;

  TestResultBuilder() {
    TestResult._defaults(this);
  }

  TestResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attemptId = $v.attemptId;
      _correctCount = $v.correctCount;
      _finishedAt = $v.finishedAt;
      _review = $v.review.toBuilder();
      _score = $v.score;
      _setId = $v.setId;
      _total = $v.total;
      _wrongCardIds = $v.wrongCardIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestResult other) {
    _$v = other as _$TestResult;
  }

  @override
  void update(void Function(TestResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestResult build() => _build();

  _$TestResult _build() {
    _$TestResult _$result;
    try {
      _$result = _$v ??
          _$TestResult._(
            attemptId: BuiltValueNullFieldError.checkNotNull(
                attemptId, r'TestResult', 'attemptId'),
            correctCount: BuiltValueNullFieldError.checkNotNull(
                correctCount, r'TestResult', 'correctCount'),
            finishedAt: BuiltValueNullFieldError.checkNotNull(
                finishedAt, r'TestResult', 'finishedAt'),
            review: review.build(),
            score: BuiltValueNullFieldError.checkNotNull(
                score, r'TestResult', 'score'),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'TestResult', 'setId'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'TestResult', 'total'),
            wrongCardIds: wrongCardIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'review';
        review.build();

        _$failedField = 'wrongCardIds';
        wrongCardIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
