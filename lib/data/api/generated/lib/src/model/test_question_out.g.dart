// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_question_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestQuestionOut extends TestQuestionOut {
  @override
  final String cardId;
  @override
  final String? codeLanguage;
  @override
  final ContentType contentType;
  @override
  final StudyDirection direction;
  @override
  final String? hint;
  @override
  final String id;
  @override
  final TestQuestionKind kind;
  @override
  final BuiltList<String>? options;
  @override
  final BuiltList<String>? pairs;
  @override
  final String prompt;
  @override
  final String? promptImageUrl;
  @override
  final String? statement;

  factory _$TestQuestionOut([void Function(TestQuestionOutBuilder)? updates]) =>
      (TestQuestionOutBuilder()..update(updates))._build();

  _$TestQuestionOut._(
      {required this.cardId,
      this.codeLanguage,
      required this.contentType,
      required this.direction,
      this.hint,
      required this.id,
      required this.kind,
      this.options,
      this.pairs,
      required this.prompt,
      this.promptImageUrl,
      this.statement})
      : super._();
  @override
  TestQuestionOut rebuild(void Function(TestQuestionOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestQuestionOutBuilder toBuilder() => TestQuestionOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestQuestionOut &&
        cardId == other.cardId &&
        codeLanguage == other.codeLanguage &&
        contentType == other.contentType &&
        direction == other.direction &&
        hint == other.hint &&
        id == other.id &&
        kind == other.kind &&
        options == other.options &&
        pairs == other.pairs &&
        prompt == other.prompt &&
        promptImageUrl == other.promptImageUrl &&
        statement == other.statement;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardId.hashCode);
    _$hash = $jc(_$hash, codeLanguage.hashCode);
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, hint.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, pairs.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, promptImageUrl.hashCode);
    _$hash = $jc(_$hash, statement.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestQuestionOut')
          ..add('cardId', cardId)
          ..add('codeLanguage', codeLanguage)
          ..add('contentType', contentType)
          ..add('direction', direction)
          ..add('hint', hint)
          ..add('id', id)
          ..add('kind', kind)
          ..add('options', options)
          ..add('pairs', pairs)
          ..add('prompt', prompt)
          ..add('promptImageUrl', promptImageUrl)
          ..add('statement', statement))
        .toString();
  }
}

class TestQuestionOutBuilder
    implements Builder<TestQuestionOut, TestQuestionOutBuilder> {
  _$TestQuestionOut? _$v;

  String? _cardId;
  String? get cardId => _$this._cardId;
  set cardId(String? cardId) => _$this._cardId = cardId;

  String? _codeLanguage;
  String? get codeLanguage => _$this._codeLanguage;
  set codeLanguage(String? codeLanguage) => _$this._codeLanguage = codeLanguage;

  ContentType? _contentType;
  ContentType? get contentType => _$this._contentType;
  set contentType(ContentType? contentType) =>
      _$this._contentType = contentType;

  StudyDirection? _direction;
  StudyDirection? get direction => _$this._direction;
  set direction(StudyDirection? direction) => _$this._direction = direction;

  String? _hint;
  String? get hint => _$this._hint;
  set hint(String? hint) => _$this._hint = hint;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  TestQuestionKind? _kind;
  TestQuestionKind? get kind => _$this._kind;
  set kind(TestQuestionKind? kind) => _$this._kind = kind;

  ListBuilder<String>? _options;
  ListBuilder<String> get options => _$this._options ??= ListBuilder<String>();
  set options(ListBuilder<String>? options) => _$this._options = options;

  ListBuilder<String>? _pairs;
  ListBuilder<String> get pairs => _$this._pairs ??= ListBuilder<String>();
  set pairs(ListBuilder<String>? pairs) => _$this._pairs = pairs;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _promptImageUrl;
  String? get promptImageUrl => _$this._promptImageUrl;
  set promptImageUrl(String? promptImageUrl) =>
      _$this._promptImageUrl = promptImageUrl;

  String? _statement;
  String? get statement => _$this._statement;
  set statement(String? statement) => _$this._statement = statement;

  TestQuestionOutBuilder() {
    TestQuestionOut._defaults(this);
  }

  TestQuestionOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardId = $v.cardId;
      _codeLanguage = $v.codeLanguage;
      _contentType = $v.contentType;
      _direction = $v.direction;
      _hint = $v.hint;
      _id = $v.id;
      _kind = $v.kind;
      _options = $v.options?.toBuilder();
      _pairs = $v.pairs?.toBuilder();
      _prompt = $v.prompt;
      _promptImageUrl = $v.promptImageUrl;
      _statement = $v.statement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestQuestionOut other) {
    _$v = other as _$TestQuestionOut;
  }

  @override
  void update(void Function(TestQuestionOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestQuestionOut build() => _build();

  _$TestQuestionOut _build() {
    _$TestQuestionOut _$result;
    try {
      _$result = _$v ??
          _$TestQuestionOut._(
            cardId: BuiltValueNullFieldError.checkNotNull(
                cardId, r'TestQuestionOut', 'cardId'),
            codeLanguage: codeLanguage,
            contentType: BuiltValueNullFieldError.checkNotNull(
                contentType, r'TestQuestionOut', 'contentType'),
            direction: BuiltValueNullFieldError.checkNotNull(
                direction, r'TestQuestionOut', 'direction'),
            hint: hint,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TestQuestionOut', 'id'),
            kind: BuiltValueNullFieldError.checkNotNull(
                kind, r'TestQuestionOut', 'kind'),
            options: _options?.build(),
            pairs: _pairs?.build(),
            prompt: BuiltValueNullFieldError.checkNotNull(
                prompt, r'TestQuestionOut', 'prompt'),
            promptImageUrl: promptImageUrl,
            statement: statement,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'pairs';
        _pairs?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TestQuestionOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
