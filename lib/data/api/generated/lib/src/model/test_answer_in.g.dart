// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_answer_in.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestAnswerIn extends TestAnswerIn {
  @override
  final String questionId;
  @override
  final String? value;
  @override
  final BuiltList<String>? values;

  factory _$TestAnswerIn([void Function(TestAnswerInBuilder)? updates]) =>
      (TestAnswerInBuilder()..update(updates))._build();

  _$TestAnswerIn._({required this.questionId, this.value, this.values})
      : super._();
  @override
  TestAnswerIn rebuild(void Function(TestAnswerInBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestAnswerInBuilder toBuilder() => TestAnswerInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestAnswerIn &&
        questionId == other.questionId &&
        value == other.value &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionId.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestAnswerIn')
          ..add('questionId', questionId)
          ..add('value', value)
          ..add('values', values))
        .toString();
  }
}

class TestAnswerInBuilder
    implements Builder<TestAnswerIn, TestAnswerInBuilder> {
  _$TestAnswerIn? _$v;

  String? _questionId;
  String? get questionId => _$this._questionId;
  set questionId(String? questionId) => _$this._questionId = questionId;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  ListBuilder<String>? _values;
  ListBuilder<String> get values => _$this._values ??= ListBuilder<String>();
  set values(ListBuilder<String>? values) => _$this._values = values;

  TestAnswerInBuilder() {
    TestAnswerIn._defaults(this);
  }

  TestAnswerInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionId = $v.questionId;
      _value = $v.value;
      _values = $v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestAnswerIn other) {
    _$v = other as _$TestAnswerIn;
  }

  @override
  void update(void Function(TestAnswerInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestAnswerIn build() => _build();

  _$TestAnswerIn _build() {
    _$TestAnswerIn _$result;
    try {
      _$result = _$v ??
          _$TestAnswerIn._(
            questionId: BuiltValueNullFieldError.checkNotNull(
                questionId, r'TestAnswerIn', 'questionId'),
            value: value,
            values: _values?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestAnswerIn', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
