// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_attempt_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestAttemptOut extends TestAttemptOut {
  @override
  final TestConfig config;
  @override
  final int correctCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime? finishedAt;
  @override
  final String id;
  @override
  final BuiltList<TestQuestionOut> questions;
  @override
  final String? retakeOfId;
  @override
  final num? score;
  @override
  final String setId;
  @override
  final String setTitle;

  factory _$TestAttemptOut([void Function(TestAttemptOutBuilder)? updates]) =>
      (TestAttemptOutBuilder()..update(updates))._build();

  _$TestAttemptOut._(
      {required this.config,
      required this.correctCount,
      required this.createdAt,
      this.finishedAt,
      required this.id,
      required this.questions,
      this.retakeOfId,
      this.score,
      required this.setId,
      required this.setTitle})
      : super._();
  @override
  TestAttemptOut rebuild(void Function(TestAttemptOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestAttemptOutBuilder toBuilder() => TestAttemptOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestAttemptOut &&
        config == other.config &&
        correctCount == other.correctCount &&
        createdAt == other.createdAt &&
        finishedAt == other.finishedAt &&
        id == other.id &&
        questions == other.questions &&
        retakeOfId == other.retakeOfId &&
        score == other.score &&
        setId == other.setId &&
        setTitle == other.setTitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, correctCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, questions.hashCode);
    _$hash = $jc(_$hash, retakeOfId.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, setTitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestAttemptOut')
          ..add('config', config)
          ..add('correctCount', correctCount)
          ..add('createdAt', createdAt)
          ..add('finishedAt', finishedAt)
          ..add('id', id)
          ..add('questions', questions)
          ..add('retakeOfId', retakeOfId)
          ..add('score', score)
          ..add('setId', setId)
          ..add('setTitle', setTitle))
        .toString();
  }
}

class TestAttemptOutBuilder
    implements Builder<TestAttemptOut, TestAttemptOutBuilder> {
  _$TestAttemptOut? _$v;

  TestConfigBuilder? _config;
  TestConfigBuilder get config => _$this._config ??= TestConfigBuilder();
  set config(TestConfigBuilder? config) => _$this._config = config;

  int? _correctCount;
  int? get correctCount => _$this._correctCount;
  set correctCount(int? correctCount) => _$this._correctCount = correctCount;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<TestQuestionOut>? _questions;
  ListBuilder<TestQuestionOut> get questions =>
      _$this._questions ??= ListBuilder<TestQuestionOut>();
  set questions(ListBuilder<TestQuestionOut>? questions) =>
      _$this._questions = questions;

  String? _retakeOfId;
  String? get retakeOfId => _$this._retakeOfId;
  set retakeOfId(String? retakeOfId) => _$this._retakeOfId = retakeOfId;

  num? _score;
  num? get score => _$this._score;
  set score(num? score) => _$this._score = score;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _setTitle;
  String? get setTitle => _$this._setTitle;
  set setTitle(String? setTitle) => _$this._setTitle = setTitle;

  TestAttemptOutBuilder() {
    TestAttemptOut._defaults(this);
  }

  TestAttemptOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _config = $v.config.toBuilder();
      _correctCount = $v.correctCount;
      _createdAt = $v.createdAt;
      _finishedAt = $v.finishedAt;
      _id = $v.id;
      _questions = $v.questions.toBuilder();
      _retakeOfId = $v.retakeOfId;
      _score = $v.score;
      _setId = $v.setId;
      _setTitle = $v.setTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestAttemptOut other) {
    _$v = other as _$TestAttemptOut;
  }

  @override
  void update(void Function(TestAttemptOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestAttemptOut build() => _build();

  _$TestAttemptOut _build() {
    _$TestAttemptOut _$result;
    try {
      _$result = _$v ??
          _$TestAttemptOut._(
            config: config.build(),
            correctCount: BuiltValueNullFieldError.checkNotNull(
                correctCount, r'TestAttemptOut', 'correctCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'TestAttemptOut', 'createdAt'),
            finishedAt: finishedAt,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TestAttemptOut', 'id'),
            questions: questions.build(),
            retakeOfId: retakeOfId,
            score: score,
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'TestAttemptOut', 'setId'),
            setTitle: BuiltValueNullFieldError.checkNotNull(
                setTitle, r'TestAttemptOut', 'setTitle'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'config';
        config.build();

        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestAttemptOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
