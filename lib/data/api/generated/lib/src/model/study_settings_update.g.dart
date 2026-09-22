// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_settings_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StudySettingsUpdate extends StudySettingsUpdate {
  @override
  final Strictness? answerStrictness;
  @override
  final int? dailyGoalCards;
  @override
  final num? fsrsDesiredRetention;
  @override
  final int? fsrsMaxIntervalDays;
  @override
  final int? learnMatchPercent;
  @override
  final BuiltList<LearnQuestionType>? learnQuestionTypes;
  @override
  final int? learnSuccessesRequired;
  @override
  final LearnTypingCheck? learnTypingCheck;
  @override
  final int? newCardsPerDay;
  @override
  final int? reviewsPerDay;

  factory _$StudySettingsUpdate(
          [void Function(StudySettingsUpdateBuilder)? updates]) =>
      (StudySettingsUpdateBuilder()..update(updates))._build();

  _$StudySettingsUpdate._(
      {this.answerStrictness,
      this.dailyGoalCards,
      this.fsrsDesiredRetention,
      this.fsrsMaxIntervalDays,
      this.learnMatchPercent,
      this.learnQuestionTypes,
      this.learnSuccessesRequired,
      this.learnTypingCheck,
      this.newCardsPerDay,
      this.reviewsPerDay})
      : super._();
  @override
  StudySettingsUpdate rebuild(
          void Function(StudySettingsUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudySettingsUpdateBuilder toBuilder() =>
      StudySettingsUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudySettingsUpdate &&
        answerStrictness == other.answerStrictness &&
        dailyGoalCards == other.dailyGoalCards &&
        fsrsDesiredRetention == other.fsrsDesiredRetention &&
        fsrsMaxIntervalDays == other.fsrsMaxIntervalDays &&
        learnMatchPercent == other.learnMatchPercent &&
        learnQuestionTypes == other.learnQuestionTypes &&
        learnSuccessesRequired == other.learnSuccessesRequired &&
        learnTypingCheck == other.learnTypingCheck &&
        newCardsPerDay == other.newCardsPerDay &&
        reviewsPerDay == other.reviewsPerDay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, answerStrictness.hashCode);
    _$hash = $jc(_$hash, dailyGoalCards.hashCode);
    _$hash = $jc(_$hash, fsrsDesiredRetention.hashCode);
    _$hash = $jc(_$hash, fsrsMaxIntervalDays.hashCode);
    _$hash = $jc(_$hash, learnMatchPercent.hashCode);
    _$hash = $jc(_$hash, learnQuestionTypes.hashCode);
    _$hash = $jc(_$hash, learnSuccessesRequired.hashCode);
    _$hash = $jc(_$hash, learnTypingCheck.hashCode);
    _$hash = $jc(_$hash, newCardsPerDay.hashCode);
    _$hash = $jc(_$hash, reviewsPerDay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudySettingsUpdate')
          ..add('answerStrictness', answerStrictness)
          ..add('dailyGoalCards', dailyGoalCards)
          ..add('fsrsDesiredRetention', fsrsDesiredRetention)
          ..add('fsrsMaxIntervalDays', fsrsMaxIntervalDays)
          ..add('learnMatchPercent', learnMatchPercent)
          ..add('learnQuestionTypes', learnQuestionTypes)
          ..add('learnSuccessesRequired', learnSuccessesRequired)
          ..add('learnTypingCheck', learnTypingCheck)
          ..add('newCardsPerDay', newCardsPerDay)
          ..add('reviewsPerDay', reviewsPerDay))
        .toString();
  }
}

class StudySettingsUpdateBuilder
    implements Builder<StudySettingsUpdate, StudySettingsUpdateBuilder> {
  _$StudySettingsUpdate? _$v;

  Strictness? _answerStrictness;
  Strictness? get answerStrictness => _$this._answerStrictness;
  set answerStrictness(Strictness? answerStrictness) =>
      _$this._answerStrictness = answerStrictness;

  int? _dailyGoalCards;
  int? get dailyGoalCards => _$this._dailyGoalCards;
  set dailyGoalCards(int? dailyGoalCards) =>
      _$this._dailyGoalCards = dailyGoalCards;

  num? _fsrsDesiredRetention;
  num? get fsrsDesiredRetention => _$this._fsrsDesiredRetention;
  set fsrsDesiredRetention(num? fsrsDesiredRetention) =>
      _$this._fsrsDesiredRetention = fsrsDesiredRetention;

  int? _fsrsMaxIntervalDays;
  int? get fsrsMaxIntervalDays => _$this._fsrsMaxIntervalDays;
  set fsrsMaxIntervalDays(int? fsrsMaxIntervalDays) =>
      _$this._fsrsMaxIntervalDays = fsrsMaxIntervalDays;

  int? _learnMatchPercent;
  int? get learnMatchPercent => _$this._learnMatchPercent;
  set learnMatchPercent(int? learnMatchPercent) =>
      _$this._learnMatchPercent = learnMatchPercent;

  ListBuilder<LearnQuestionType>? _learnQuestionTypes;
  ListBuilder<LearnQuestionType> get learnQuestionTypes =>
      _$this._learnQuestionTypes ??= ListBuilder<LearnQuestionType>();
  set learnQuestionTypes(ListBuilder<LearnQuestionType>? learnQuestionTypes) =>
      _$this._learnQuestionTypes = learnQuestionTypes;

  int? _learnSuccessesRequired;
  int? get learnSuccessesRequired => _$this._learnSuccessesRequired;
  set learnSuccessesRequired(int? learnSuccessesRequired) =>
      _$this._learnSuccessesRequired = learnSuccessesRequired;

  LearnTypingCheck? _learnTypingCheck;
  LearnTypingCheck? get learnTypingCheck => _$this._learnTypingCheck;
  set learnTypingCheck(LearnTypingCheck? learnTypingCheck) =>
      _$this._learnTypingCheck = learnTypingCheck;

  int? _newCardsPerDay;
  int? get newCardsPerDay => _$this._newCardsPerDay;
  set newCardsPerDay(int? newCardsPerDay) =>
      _$this._newCardsPerDay = newCardsPerDay;

  int? _reviewsPerDay;
  int? get reviewsPerDay => _$this._reviewsPerDay;
  set reviewsPerDay(int? reviewsPerDay) =>
      _$this._reviewsPerDay = reviewsPerDay;

  StudySettingsUpdateBuilder() {
    StudySettingsUpdate._defaults(this);
  }

  StudySettingsUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _answerStrictness = $v.answerStrictness;
      _dailyGoalCards = $v.dailyGoalCards;
      _fsrsDesiredRetention = $v.fsrsDesiredRetention;
      _fsrsMaxIntervalDays = $v.fsrsMaxIntervalDays;
      _learnMatchPercent = $v.learnMatchPercent;
      _learnQuestionTypes = $v.learnQuestionTypes?.toBuilder();
      _learnSuccessesRequired = $v.learnSuccessesRequired;
      _learnTypingCheck = $v.learnTypingCheck;
      _newCardsPerDay = $v.newCardsPerDay;
      _reviewsPerDay = $v.reviewsPerDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudySettingsUpdate other) {
    _$v = other as _$StudySettingsUpdate;
  }

  @override
  void update(void Function(StudySettingsUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudySettingsUpdate build() => _build();

  _$StudySettingsUpdate _build() {
    _$StudySettingsUpdate _$result;
    try {
      _$result = _$v ??
          _$StudySettingsUpdate._(
            answerStrictness: answerStrictness,
            dailyGoalCards: dailyGoalCards,
            fsrsDesiredRetention: fsrsDesiredRetention,
            fsrsMaxIntervalDays: fsrsMaxIntervalDays,
            learnMatchPercent: learnMatchPercent,
            learnQuestionTypes: _learnQuestionTypes?.build(),
            learnSuccessesRequired: learnSuccessesRequired,
            learnTypingCheck: learnTypingCheck,
            newCardsPerDay: newCardsPerDay,
            reviewsPerDay: reviewsPerDay,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learnQuestionTypes';
        _learnQuestionTypes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StudySettingsUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
