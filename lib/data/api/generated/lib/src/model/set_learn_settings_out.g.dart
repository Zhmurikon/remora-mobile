// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_learn_settings_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetLearnSettingsOut extends SetLearnSettingsOut {
  @override
  final bool customized;
  @override
  final int matchPercent;
  @override
  final BuiltList<LearnQuestionType> questionTypes;
  @override
  final int successesRequired;
  @override
  final LearnTypingCheck typingCheck;

  factory _$SetLearnSettingsOut(
          [void Function(SetLearnSettingsOutBuilder)? updates]) =>
      (SetLearnSettingsOutBuilder()..update(updates))._build();

  _$SetLearnSettingsOut._(
      {required this.customized,
      required this.matchPercent,
      required this.questionTypes,
      required this.successesRequired,
      required this.typingCheck})
      : super._();
  @override
  SetLearnSettingsOut rebuild(
          void Function(SetLearnSettingsOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetLearnSettingsOutBuilder toBuilder() =>
      SetLearnSettingsOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetLearnSettingsOut &&
        customized == other.customized &&
        matchPercent == other.matchPercent &&
        questionTypes == other.questionTypes &&
        successesRequired == other.successesRequired &&
        typingCheck == other.typingCheck;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customized.hashCode);
    _$hash = $jc(_$hash, matchPercent.hashCode);
    _$hash = $jc(_$hash, questionTypes.hashCode);
    _$hash = $jc(_$hash, successesRequired.hashCode);
    _$hash = $jc(_$hash, typingCheck.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetLearnSettingsOut')
          ..add('customized', customized)
          ..add('matchPercent', matchPercent)
          ..add('questionTypes', questionTypes)
          ..add('successesRequired', successesRequired)
          ..add('typingCheck', typingCheck))
        .toString();
  }
}

class SetLearnSettingsOutBuilder
    implements Builder<SetLearnSettingsOut, SetLearnSettingsOutBuilder> {
  _$SetLearnSettingsOut? _$v;

  bool? _customized;
  bool? get customized => _$this._customized;
  set customized(bool? customized) => _$this._customized = customized;

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

  SetLearnSettingsOutBuilder() {
    SetLearnSettingsOut._defaults(this);
  }

  SetLearnSettingsOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customized = $v.customized;
      _matchPercent = $v.matchPercent;
      _questionTypes = $v.questionTypes.toBuilder();
      _successesRequired = $v.successesRequired;
      _typingCheck = $v.typingCheck;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetLearnSettingsOut other) {
    _$v = other as _$SetLearnSettingsOut;
  }

  @override
  void update(void Function(SetLearnSettingsOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetLearnSettingsOut build() => _build();

  _$SetLearnSettingsOut _build() {
    _$SetLearnSettingsOut _$result;
    try {
      _$result = _$v ??
          _$SetLearnSettingsOut._(
            customized: BuiltValueNullFieldError.checkNotNull(
                customized, r'SetLearnSettingsOut', 'customized'),
            matchPercent: BuiltValueNullFieldError.checkNotNull(
                matchPercent, r'SetLearnSettingsOut', 'matchPercent'),
            questionTypes: questionTypes.build(),
            successesRequired: BuiltValueNullFieldError.checkNotNull(
                successesRequired, r'SetLearnSettingsOut', 'successesRequired'),
            typingCheck: BuiltValueNullFieldError.checkNotNull(
                typingCheck, r'SetLearnSettingsOut', 'typingCheck'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questionTypes';
        questionTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SetLearnSettingsOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
