// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestConfig extends TestConfig {
  @override
  final DirectionMode? direction;
  @override
  final BuiltList<TestQuestionKind>? kinds;
  @override
  final int? questionCount;
  @override
  final TestSource? source_;
  @override
  final bool? writeToSchedule;

  factory _$TestConfig([void Function(TestConfigBuilder)? updates]) =>
      (TestConfigBuilder()..update(updates))._build();

  _$TestConfig._(
      {this.direction,
      this.kinds,
      this.questionCount,
      this.source_,
      this.writeToSchedule})
      : super._();
  @override
  TestConfig rebuild(void Function(TestConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestConfigBuilder toBuilder() => TestConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestConfig &&
        direction == other.direction &&
        kinds == other.kinds &&
        questionCount == other.questionCount &&
        source_ == other.source_ &&
        writeToSchedule == other.writeToSchedule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, kinds.hashCode);
    _$hash = $jc(_$hash, questionCount.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, writeToSchedule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestConfig')
          ..add('direction', direction)
          ..add('kinds', kinds)
          ..add('questionCount', questionCount)
          ..add('source_', source_)
          ..add('writeToSchedule', writeToSchedule))
        .toString();
  }
}

class TestConfigBuilder implements Builder<TestConfig, TestConfigBuilder> {
  _$TestConfig? _$v;

  DirectionMode? _direction;
  DirectionMode? get direction => _$this._direction;
  set direction(DirectionMode? direction) => _$this._direction = direction;

  ListBuilder<TestQuestionKind>? _kinds;
  ListBuilder<TestQuestionKind> get kinds =>
      _$this._kinds ??= ListBuilder<TestQuestionKind>();
  set kinds(ListBuilder<TestQuestionKind>? kinds) => _$this._kinds = kinds;

  int? _questionCount;
  int? get questionCount => _$this._questionCount;
  set questionCount(int? questionCount) =>
      _$this._questionCount = questionCount;

  TestSource? _source_;
  TestSource? get source_ => _$this._source_;
  set source_(TestSource? source_) => _$this._source_ = source_;

  bool? _writeToSchedule;
  bool? get writeToSchedule => _$this._writeToSchedule;
  set writeToSchedule(bool? writeToSchedule) =>
      _$this._writeToSchedule = writeToSchedule;

  TestConfigBuilder() {
    TestConfig._defaults(this);
  }

  TestConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _direction = $v.direction;
      _kinds = $v.kinds?.toBuilder();
      _questionCount = $v.questionCount;
      _source_ = $v.source_;
      _writeToSchedule = $v.writeToSchedule;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestConfig other) {
    _$v = other as _$TestConfig;
  }

  @override
  void update(void Function(TestConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestConfig build() => _build();

  _$TestConfig _build() {
    _$TestConfig _$result;
    try {
      _$result = _$v ??
          _$TestConfig._(
            direction: direction,
            kinds: _kinds?.build(),
            questionCount: questionCount,
            source_: source_,
            writeToSchedule: writeToSchedule,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'kinds';
        _kinds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
