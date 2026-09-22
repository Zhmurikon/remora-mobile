// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_submit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestSubmit extends TestSubmit {
  @override
  final BuiltList<TestAnswerIn> answers;

  factory _$TestSubmit([void Function(TestSubmitBuilder)? updates]) =>
      (TestSubmitBuilder()..update(updates))._build();

  _$TestSubmit._({required this.answers}) : super._();
  @override
  TestSubmit rebuild(void Function(TestSubmitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestSubmitBuilder toBuilder() => TestSubmitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestSubmit && answers == other.answers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, answers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestSubmit')..add('answers', answers))
        .toString();
  }
}

class TestSubmitBuilder implements Builder<TestSubmit, TestSubmitBuilder> {
  _$TestSubmit? _$v;

  ListBuilder<TestAnswerIn>? _answers;
  ListBuilder<TestAnswerIn> get answers =>
      _$this._answers ??= ListBuilder<TestAnswerIn>();
  set answers(ListBuilder<TestAnswerIn>? answers) => _$this._answers = answers;

  TestSubmitBuilder() {
    TestSubmit._defaults(this);
  }

  TestSubmitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _answers = $v.answers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestSubmit other) {
    _$v = other as _$TestSubmit;
  }

  @override
  void update(void Function(TestSubmitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestSubmit build() => _build();

  _$TestSubmit _build() {
    _$TestSubmit _$result;
    try {
      _$result = _$v ??
          _$TestSubmit._(
            answers: answers.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'answers';
        answers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestSubmit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
