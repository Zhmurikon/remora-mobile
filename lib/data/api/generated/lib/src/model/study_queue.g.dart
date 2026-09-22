// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_queue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StudyQueue extends StudyQueue {
  @override
  final Strictness answerStrictness;
  @override
  final int dueTotal;
  @override
  final DateTime generatedAt;
  @override
  final BuiltList<QueueItem> items;
  @override
  final String langDefinition;
  @override
  final String langTerm;
  @override
  final int learnMatchPercent;
  @override
  final BuiltList<LearnQuestionType> learnQuestionTypes;
  @override
  final int learnSuccessesRequired;
  @override
  final LearnTypingCheck learnTypingCheck;
  @override
  final StudyMode mode;
  @override
  final int newLeftToday;
  @override
  final int newTotal;
  @override
  final int reviewsLeftToday;
  @override
  final String schedulerVersion;
  @override
  final String setId;
  @override
  final String setTitle;

  factory _$StudyQueue([void Function(StudyQueueBuilder)? updates]) =>
      (StudyQueueBuilder()..update(updates))._build();

  _$StudyQueue._(
      {required this.answerStrictness,
      required this.dueTotal,
      required this.generatedAt,
      required this.items,
      required this.langDefinition,
      required this.langTerm,
      required this.learnMatchPercent,
      required this.learnQuestionTypes,
      required this.learnSuccessesRequired,
      required this.learnTypingCheck,
      required this.mode,
      required this.newLeftToday,
      required this.newTotal,
      required this.reviewsLeftToday,
      required this.schedulerVersion,
      required this.setId,
      required this.setTitle})
      : super._();
  @override
  StudyQueue rebuild(void Function(StudyQueueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyQueueBuilder toBuilder() => StudyQueueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudyQueue &&
        answerStrictness == other.answerStrictness &&
        dueTotal == other.dueTotal &&
        generatedAt == other.generatedAt &&
        items == other.items &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        learnMatchPercent == other.learnMatchPercent &&
        learnQuestionTypes == other.learnQuestionTypes &&
        learnSuccessesRequired == other.learnSuccessesRequired &&
        learnTypingCheck == other.learnTypingCheck &&
        mode == other.mode &&
        newLeftToday == other.newLeftToday &&
        newTotal == other.newTotal &&
        reviewsLeftToday == other.reviewsLeftToday &&
        schedulerVersion == other.schedulerVersion &&
        setId == other.setId &&
        setTitle == other.setTitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, answerStrictness.hashCode);
    _$hash = $jc(_$hash, dueTotal.hashCode);
    _$hash = $jc(_$hash, generatedAt.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, learnMatchPercent.hashCode);
    _$hash = $jc(_$hash, learnQuestionTypes.hashCode);
    _$hash = $jc(_$hash, learnSuccessesRequired.hashCode);
    _$hash = $jc(_$hash, learnTypingCheck.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, newLeftToday.hashCode);
    _$hash = $jc(_$hash, newTotal.hashCode);
    _$hash = $jc(_$hash, reviewsLeftToday.hashCode);
    _$hash = $jc(_$hash, schedulerVersion.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, setTitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudyQueue')
          ..add('answerStrictness', answerStrictness)
          ..add('dueTotal', dueTotal)
          ..add('generatedAt', generatedAt)
          ..add('items', items)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('learnMatchPercent', learnMatchPercent)
          ..add('learnQuestionTypes', learnQuestionTypes)
          ..add('learnSuccessesRequired', learnSuccessesRequired)
          ..add('learnTypingCheck', learnTypingCheck)
          ..add('mode', mode)
          ..add('newLeftToday', newLeftToday)
          ..add('newTotal', newTotal)
          ..add('reviewsLeftToday', reviewsLeftToday)
          ..add('schedulerVersion', schedulerVersion)
          ..add('setId', setId)
          ..add('setTitle', setTitle))
        .toString();
  }
}

class StudyQueueBuilder implements Builder<StudyQueue, StudyQueueBuilder> {
  _$StudyQueue? _$v;

  Strictness? _answerStrictness;
  Strictness? get answerStrictness => _$this._answerStrictness;
  set answerStrictness(Strictness? answerStrictness) =>
      _$this._answerStrictness = answerStrictness;

  int? _dueTotal;
  int? get dueTotal => _$this._dueTotal;
  set dueTotal(int? dueTotal) => _$this._dueTotal = dueTotal;

  DateTime? _generatedAt;
  DateTime? get generatedAt => _$this._generatedAt;
  set generatedAt(DateTime? generatedAt) => _$this._generatedAt = generatedAt;

  ListBuilder<QueueItem>? _items;
  ListBuilder<QueueItem> get items =>
      _$this._items ??= ListBuilder<QueueItem>();
  set items(ListBuilder<QueueItem>? items) => _$this._items = items;

  String? _langDefinition;
  String? get langDefinition => _$this._langDefinition;
  set langDefinition(String? langDefinition) =>
      _$this._langDefinition = langDefinition;

  String? _langTerm;
  String? get langTerm => _$this._langTerm;
  set langTerm(String? langTerm) => _$this._langTerm = langTerm;

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

  StudyMode? _mode;
  StudyMode? get mode => _$this._mode;
  set mode(StudyMode? mode) => _$this._mode = mode;

  int? _newLeftToday;
  int? get newLeftToday => _$this._newLeftToday;
  set newLeftToday(int? newLeftToday) => _$this._newLeftToday = newLeftToday;

  int? _newTotal;
  int? get newTotal => _$this._newTotal;
  set newTotal(int? newTotal) => _$this._newTotal = newTotal;

  int? _reviewsLeftToday;
  int? get reviewsLeftToday => _$this._reviewsLeftToday;
  set reviewsLeftToday(int? reviewsLeftToday) =>
      _$this._reviewsLeftToday = reviewsLeftToday;

  String? _schedulerVersion;
  String? get schedulerVersion => _$this._schedulerVersion;
  set schedulerVersion(String? schedulerVersion) =>
      _$this._schedulerVersion = schedulerVersion;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _setTitle;
  String? get setTitle => _$this._setTitle;
  set setTitle(String? setTitle) => _$this._setTitle = setTitle;

  StudyQueueBuilder() {
    StudyQueue._defaults(this);
  }

  StudyQueueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _answerStrictness = $v.answerStrictness;
      _dueTotal = $v.dueTotal;
      _generatedAt = $v.generatedAt;
      _items = $v.items.toBuilder();
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _learnMatchPercent = $v.learnMatchPercent;
      _learnQuestionTypes = $v.learnQuestionTypes.toBuilder();
      _learnSuccessesRequired = $v.learnSuccessesRequired;
      _learnTypingCheck = $v.learnTypingCheck;
      _mode = $v.mode;
      _newLeftToday = $v.newLeftToday;
      _newTotal = $v.newTotal;
      _reviewsLeftToday = $v.reviewsLeftToday;
      _schedulerVersion = $v.schedulerVersion;
      _setId = $v.setId;
      _setTitle = $v.setTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudyQueue other) {
    _$v = other as _$StudyQueue;
  }

  @override
  void update(void Function(StudyQueueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudyQueue build() => _build();

  _$StudyQueue _build() {
    _$StudyQueue _$result;
    try {
      _$result = _$v ??
          _$StudyQueue._(
            answerStrictness: BuiltValueNullFieldError.checkNotNull(
                answerStrictness, r'StudyQueue', 'answerStrictness'),
            dueTotal: BuiltValueNullFieldError.checkNotNull(
                dueTotal, r'StudyQueue', 'dueTotal'),
            generatedAt: BuiltValueNullFieldError.checkNotNull(
                generatedAt, r'StudyQueue', 'generatedAt'),
            items: items.build(),
            langDefinition: BuiltValueNullFieldError.checkNotNull(
                langDefinition, r'StudyQueue', 'langDefinition'),
            langTerm: BuiltValueNullFieldError.checkNotNull(
                langTerm, r'StudyQueue', 'langTerm'),
            learnMatchPercent: BuiltValueNullFieldError.checkNotNull(
                learnMatchPercent, r'StudyQueue', 'learnMatchPercent'),
            learnQuestionTypes: learnQuestionTypes.build(),
            learnSuccessesRequired: BuiltValueNullFieldError.checkNotNull(
                learnSuccessesRequired,
                r'StudyQueue',
                'learnSuccessesRequired'),
            learnTypingCheck: BuiltValueNullFieldError.checkNotNull(
                learnTypingCheck, r'StudyQueue', 'learnTypingCheck'),
            mode: BuiltValueNullFieldError.checkNotNull(
                mode, r'StudyQueue', 'mode'),
            newLeftToday: BuiltValueNullFieldError.checkNotNull(
                newLeftToday, r'StudyQueue', 'newLeftToday'),
            newTotal: BuiltValueNullFieldError.checkNotNull(
                newTotal, r'StudyQueue', 'newTotal'),
            reviewsLeftToday: BuiltValueNullFieldError.checkNotNull(
                reviewsLeftToday, r'StudyQueue', 'reviewsLeftToday'),
            schedulerVersion: BuiltValueNullFieldError.checkNotNull(
                schedulerVersion, r'StudyQueue', 'schedulerVersion'),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'StudyQueue', 'setId'),
            setTitle: BuiltValueNullFieldError.checkNotNull(
                setTitle, r'StudyQueue', 'setTitle'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();

        _$failedField = 'learnQuestionTypes';
        learnQuestionTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StudyQueue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
