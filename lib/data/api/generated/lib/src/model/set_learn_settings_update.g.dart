// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_learn_settings_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetLearnSettingsUpdate extends SetLearnSettingsUpdate {
  @override
  final int matchPercent;
  @override
  final BuiltList<LearnQuestionType> questionTypes;
  @override
  final int successesRequired;
  @override
  final LearnTypingCheck typingCheck;

  factory _$SetLearnSettingsUpdate(
          [void Function(SetLearnSettingsUpdateBuilder)? updates]) =>
      (SetLearnSettingsUpdateBuilder()..update(updates))._build();

  _$SetLearnSettingsUpdate._(
      {required this.matchPercent,
      required this.questionTypes,
      required this.successesRequired,
      required this.typingCheck})
      : super._();
  @override
  SetLearnSettingsUpdate rebuild(
          void Function(SetLearnSettingsUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetLearnSettingsUpdateBuilder toBuilder() =>
      SetLearnSettingsUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetLearnSettingsUpdate &&
        matchPercent == other.matchPercent &&
        questionTypes == other.questionTypes &&
        successesRequired == other.successesRequired &&
        typingCheck == other.typingCheck;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, matchPercent.hashCode);
    _$hash = $jc(_$hash, questionTypes.hashCode);
    _$hash = $jc(_$hash, successesRequired.hashCode);
    _$hash = $jc(_$hash, typingCheck.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetLearnSettingsUpdate')
          ..add('matchPercent', matchPercent)
          ..add('questionTypes', questionTypes)
          ..add('successesRequired', successesRequired)
          ..add('typingCheck', typingCheck))
        .toString();
  }
}

class SetLearnSettingsUpdateBuilder
    implements Builder<SetLearnSettingsUpdate, SetLearnSettingsUpdateBuilder> {
  _$SetLearnSettingsUpdate? _$v;

  int? _matchPercent;
  int? get matchPercent => _$this._matchPercent;
  set matchPercent(int? matchPercent) => _$this._matchPercent = matchPercent;

  ListBuilder<LearnQuestionType>? _questionTypes;
  ListBuilder<LearnQuestionType> get questionTypes =>
      _$this._questionTypes ??= ListBuilder<LearnQuestionType>();
  set questionTypes(ListBuilder<LearnQuestionType>? questionTypes) =>
      _$this._questionTypes = questionTypes;

  int? _successesRequired;
  int? get successesRequired => _$this._successesRequired;
  set successesRequired(int? successesRequired) =>
      _$this._successesRequired = successesRequired;

  LearnTypingCheck? _typingCheck;
  LearnTypingCheck? get typingCheck => _$this._typingCheck;
  set typingCheck(LearnTypingCheck? typingCheck) =>
      _$this._typingCheck = typingCheck;

  SetLearnSettingsUpdateBuilder() {
    SetLearnSettingsUpdate._defaults(this);
  }

  SetLearnSettingsUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _matchPercent = $v.matchPercent;
      _questionTypes = $v.questionTypes.toBuilder();
      _successesRequired = $v.successesRequired;
      _typingCheck = $v.typingCheck;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetLearnSettingsUpdate other) {
    _$v = other as _$SetLearnSettingsUpdate;
  }

  @override
  void update(void Function(SetLearnSettingsUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetLearnSettingsUpdate build() => _build();

  _$SetLearnSettingsUpdate _build() {
    _$SetLearnSettingsUpdate _$result;
    try {
      _$result = _$v ??
          _$SetLearnSettingsUpdate._(
            matchPercent: BuiltValueNullFieldError.checkNotNull(
                matchPercent, r'SetLearnSettingsUpdate', 'matchPercent'),
            questionTypes: questionTypes.build(),
            successesRequired: BuiltValueNullFieldError.checkNotNull(
                successesRequired,
                r'SetLearnSettingsUpdate',
                'successesRequired'),
            typingCheck: BuiltValueNullFieldError.checkNotNull(
                typingCheck, r'SetLearnSettingsUpdate', 'typingCheck'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questionTypes';
        questionTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SetLearnSettingsUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
