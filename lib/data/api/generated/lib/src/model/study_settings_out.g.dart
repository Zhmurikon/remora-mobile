// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_settings_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StudySettingsOut extends StudySettingsOut {
  @override
  final Strictness answerStrictness;
  @override
  final int dailyGoalCards;
  @override
  final num fsrsDesiredRetention;
  @override
  final int fsrsMaxIntervalDays;
  @override
  final int learnMatchPercent;
  @override
  final BuiltList<LearnQuestionType> learnQuestionTypes;
  @override
  final int learnSuccessesRequired;
  @override
  final LearnTypingCheck learnTypingCheck;
  @override
  final int newCardsPerDay;
  @override
  final int reviewsPerDay;

  factory _$StudySettingsOut(
          [void Function(StudySettingsOutBuilder)? updates]) =>
      (StudySettingsOutBuilder()..update(updates))._build();

  _$StudySettingsOut._(
      {required this.answerStrictness,
      required this.dailyGoalCards,
      required this.fsrsDesiredRetention,
      required this.fsrsMaxIntervalDays,
      required this.learnMatchPercent,
      required this.learnQuestionTypes,
      required this.learnSuccessesRequired,
      required this.learnTypingCheck,
      required this.newCardsPerDay,
      required this.reviewsPerDay})
      : super._();
  @override
  StudySettingsOut rebuild(void Function(StudySettingsOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudySettingsOutBuilder toBuilder() =>
      StudySettingsOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudySettingsOut &&
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
    return (newBuiltValueToStringHelper(r'StudySettingsOut')
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

class StudySettingsOutBuilder
    implements Builder<StudySettingsOut, StudySettingsOutBuilder> {
  _$StudySettingsOut? _$v;

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

  StudySettingsOutBuilder() {
    StudySettingsOut._defaults(this);
  }

  StudySettingsOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _answerStrictness = $v.answerStrictness;
      _dailyGoalCards = $v.dailyGoalCards;
      _fsrsDesiredRetention = $v.fsrsDesiredRetention;
      _fsrsMaxIntervalDays = $v.fsrsMaxIntervalDays;
      _learnMatchPercent = $v.learnMatchPercent;
      _learnQuestionTypes = $v.learnQuestionTypes.toBuilder();
      _learnSuccessesRequired = $v.learnSuccessesRequired;
      _learnTypingCheck = $v.learnTypingCheck;
      _newCardsPerDay = $v.newCardsPerDay;
      _reviewsPerDay = $v.reviewsPerDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudySettingsOut other) {
    _$v = other as _$StudySettingsOut;
  }

  @override
  void update(void Function(StudySettingsOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudySettingsOut build() => _build();

  _$StudySettingsOut _build() {
    _$StudySettingsOut _$result;
    try {
      _$result = _$v ??
          _$StudySettingsOut._(
            answerStrictness: BuiltValueNullFieldError.checkNotNull(
                answerStrictness, r'StudySettingsOut', 'answerStrictness'),
            dailyGoalCards: BuiltValueNullFieldError.checkNotNull(
                dailyGoalCards, r'StudySettingsOut', 'dailyGoalCards'),
            fsrsDesiredRetention: BuiltValueNullFieldError.checkNotNull(
                fsrsDesiredRetention,
                r'StudySettingsOut',
                'fsrsDesiredRetention'),
            fsrsMaxIntervalDays: BuiltValueNullFieldError.checkNotNull(
                fsrsMaxIntervalDays,
                r'StudySettingsOut',
                'fsrsMaxIntervalDays'),
            learnMatchPercent: BuiltValueNullFieldError.checkNotNull(
                learnMatchPercent, r'StudySettingsOut', 'learnMatchPercent'),
            learnQuestionTypes: learnQuestionTypes.build(),
            learnSuccessesRequired: BuiltValueNullFieldError.checkNotNull(
                learnSuccessesRequired,
                r'StudySettingsOut',
                'learnSuccessesRequired'),
            learnTypingCheck: BuiltValueNullFieldError.checkNotNull(
                learnTypingCheck, r'StudySettingsOut', 'learnTypingCheck'),
            newCardsPerDay: BuiltValueNullFieldError.checkNotNull(
                newCardsPerDay, r'StudySettingsOut', 'newCardsPerDay'),
            reviewsPerDay: BuiltValueNullFieldError.checkNotNull(
                reviewsPerDay, r'StudySettingsOut', 'reviewsPerDay'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'learnQuestionTypes';
        learnQuestionTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StudySettingsOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
