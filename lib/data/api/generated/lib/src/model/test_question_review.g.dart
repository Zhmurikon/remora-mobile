// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_question_review.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestQuestionReview extends TestQuestionReview {
  @override
  final bool correct;
  @override
  final String expected;
  @override
  final BuiltList<String>? expectedValues;
  @override
  final String? given;
  @override
  final BuiltList<String>? givenValues;
  @override
  final TestQuestionOut question;
  @override
  final AnswerVerdict verdict;

  factory _$TestQuestionReview(
          [void Function(TestQuestionReviewBuilder)? updates]) =>
      (TestQuestionReviewBuilder()..update(updates))._build();

  _$TestQuestionReview._(
      {required this.correct,
      required this.expected,
      this.expectedValues,
      this.given,
      this.givenValues,
      required this.question,
      required this.verdict})
      : super._();
  @override
  TestQuestionReview rebuild(
          void Function(TestQuestionReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestQuestionReviewBuilder toBuilder() =>
      TestQuestionReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestQuestionReview &&
        correct == other.correct &&
        expected == other.expected &&
        expectedValues == other.expectedValues &&
        given == other.given &&
        givenValues == other.givenValues &&
        question == other.question &&
        verdict == other.verdict;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, correct.hashCode);
    _$hash = $jc(_$hash, expected.hashCode);
    _$hash = $jc(_$hash, expectedValues.hashCode);
    _$hash = $jc(_$hash, given.hashCode);
    _$hash = $jc(_$hash, givenValues.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, verdict.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestQuestionReview')
          ..add('correct', correct)
          ..add('expected', expected)
          ..add('expectedValues', expectedValues)
          ..add('given', given)
          ..add('givenValues', givenValues)
          ..add('question', question)
          ..add('verdict', verdict))
        .toString();
  }
}

class TestQuestionReviewBuilder
    implements Builder<TestQuestionReview, TestQuestionReviewBuilder> {
  _$TestQuestionReview? _$v;

  bool? _correct;
  bool? get correct => _$this._correct;
  set correct(bool? correct) => _$this._correct = correct;

  String? _expected;
  String? get expected => _$this._expected;
  set expected(String? expected) => _$this._expected = expected;

  ListBuilder<String>? _expectedValues;
  ListBuilder<String> get expectedValues =>
      _$this._expectedValues ??= ListBuilder<String>();
  set expectedValues(ListBuilder<String>? expectedValues) =>
      _$this._expectedValues = expectedValues;

  String? _given;
  String? get given => _$this._given;
  set given(String? given) => _$this._given = given;

  ListBuilder<String>? _givenValues;
  ListBuilder<String> get givenValues =>
      _$this._givenValues ??= ListBuilder<String>();
  set givenValues(ListBuilder<String>? givenValues) =>
      _$this._givenValues = givenValues;

  TestQuestionOutBuilder? _question;
  TestQuestionOutBuilder get question =>
      _$this._question ??= TestQuestionOutBuilder();
  set question(TestQuestionOutBuilder? question) => _$this._question = question;

  AnswerVerdict? _verdict;
  AnswerVerdict? get verdict => _$this._verdict;
  set verdict(AnswerVerdict? verdict) => _$this._verdict = verdict;

  TestQuestionReviewBuilder() {
    TestQuestionReview._defaults(this);
  }

  TestQuestionReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _correct = $v.correct;
      _expected = $v.expected;
      _expectedValues = $v.expectedValues?.toBuilder();
      _given = $v.given;
      _givenValues = $v.givenValues?.toBuilder();
      _question = $v.question.toBuilder();
      _verdict = $v.verdict;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestQuestionReview other) {
    _$v = other as _$TestQuestionReview;
  }

  @override
  void update(void Function(TestQuestionReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestQuestionReview build() => _build();

  _$TestQuestionReview _build() {
    _$TestQuestionReview _$result;
    try {
      _$result = _$v ??
          _$TestQuestionReview._(
            correct: BuiltValueNullFieldError.checkNotNull(
                correct, r'TestQuestionReview', 'correct'),
            expected: BuiltValueNullFieldError.checkNotNull(
                expected, r'TestQuestionReview', 'expected'),
            expectedValues: _expectedValues?.build(),
            given: given,
            givenValues: _givenValues?.build(),
            question: question.build(),
            verdict: BuiltValueNullFieldError.checkNotNull(
                verdict, r'TestQuestionReview', 'verdict'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expectedValues';
        _expectedValues?.build();

        _$failedField = 'givenValues';
        _givenValues?.build();
        _$failedField = 'question';
        question.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestQuestionReview', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
