// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_card.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QueueCard extends QueueCard {
  @override
  final BuiltList<String>? altAnswers;
  @override
  final String? codeLanguage;
  @override
  final ContentType contentType;
  @override
  final String definition;
  @override
  final String? definitionImageUrl;
  @override
  final String? definitionTranscription;
  @override
  final String? hint;
  @override
  final String id;
  @override
  final int position;
  @override
  final String term;
  @override
  final String? termImageUrl;
  @override
  final String? termTranscription;
  @override
  final BuiltList<String>? wrongDefinitionAnswers;
  @override
  final BuiltList<String>? wrongTermAnswers;

  factory _$QueueCard([void Function(QueueCardBuilder)? updates]) =>
      (QueueCardBuilder()..update(updates))._build();

  _$QueueCard._(
      {this.altAnswers,
      this.codeLanguage,
      required this.contentType,
      required this.definition,
      this.definitionImageUrl,
      this.definitionTranscription,
      this.hint,
      required this.id,
      required this.position,
      required this.term,
      this.termImageUrl,
      this.termTranscription,
      this.wrongDefinitionAnswers,
      this.wrongTermAnswers})
      : super._();
  @override
  QueueCard rebuild(void Function(QueueCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueueCardBuilder toBuilder() => QueueCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QueueCard &&
        altAnswers == other.altAnswers &&
        codeLanguage == other.codeLanguage &&
        contentType == other.contentType &&
        definition == other.definition &&
        definitionImageUrl == other.definitionImageUrl &&
        definitionTranscription == other.definitionTranscription &&
        hint == other.hint &&
        id == other.id &&
        position == other.position &&
        term == other.term &&
        termImageUrl == other.termImageUrl &&
        termTranscription == other.termTranscription &&
        wrongDefinitionAnswers == other.wrongDefinitionAnswers &&
        wrongTermAnswers == other.wrongTermAnswers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, altAnswers.hashCode);
    _$hash = $jc(_$hash, codeLanguage.hashCode);
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, definition.hashCode);
    _$hash = $jc(_$hash, definitionImageUrl.hashCode);
    _$hash = $jc(_$hash, definitionTranscription.hashCode);
    _$hash = $jc(_$hash, hint.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, term.hashCode);
    _$hash = $jc(_$hash, termImageUrl.hashCode);
    _$hash = $jc(_$hash, termTranscription.hashCode);
    _$hash = $jc(_$hash, wrongDefinitionAnswers.hashCode);
    _$hash = $jc(_$hash, wrongTermAnswers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QueueCard')
          ..add('altAnswers', altAnswers)
          ..add('codeLanguage', codeLanguage)
          ..add('contentType', contentType)
          ..add('definition', definition)
          ..add('definitionImageUrl', definitionImageUrl)
          ..add('definitionTranscription', definitionTranscription)
          ..add('hint', hint)
          ..add('id', id)
          ..add('position', position)
          ..add('term', term)
          ..add('termImageUrl', termImageUrl)
          ..add('termTranscription', termTranscription)
          ..add('wrongDefinitionAnswers', wrongDefinitionAnswers)
          ..add('wrongTermAnswers', wrongTermAnswers))
        .toString();
  }
}

class QueueCardBuilder implements Builder<QueueCard, QueueCardBuilder> {
  _$QueueCard? _$v;

  ListBuilder<String>? _altAnswers;
  ListBuilder<String> get altAnswers =>
      _$this._altAnswers ??= ListBuilder<String>();
  set altAnswers(ListBuilder<String>? altAnswers) =>
      _$this._altAnswers = altAnswers;

  String? _codeLanguage;
  String? get codeLanguage => _$this._codeLanguage;
  set codeLanguage(String? codeLanguage) => _$this._codeLanguage = codeLanguage;

  ContentType? _contentType;
  ContentType? get contentType => _$this._contentType;
  set contentType(ContentType? contentType) =>
      _$this._contentType = contentType;

  String? _definition;
  String? get definition => _$this._definition;
  set definition(String? definition) => _$this._definition = definition;

  String? _definitionImageUrl;
  String? get definitionImageUrl => _$this._definitionImageUrl;
  set definitionImageUrl(String? definitionImageUrl) =>
      _$this._definitionImageUrl = definitionImageUrl;

  String? _definitionTranscription;
  String? get definitionTranscription => _$this._definitionTranscription;
  set definitionTranscription(String? definitionTranscription) =>
      _$this._definitionTranscription = definitionTranscription;

  String? _hint;
  String? get hint => _$this._hint;
  set hint(String? hint) => _$this._hint = hint;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  String? _termImageUrl;
  String? get termImageUrl => _$this._termImageUrl;
  set termImageUrl(String? termImageUrl) => _$this._termImageUrl = termImageUrl;

  String? _termTranscription;
  String? get termTranscription => _$this._termTranscription;
  set termTranscription(String? termTranscription) =>
      _$this._termTranscription = termTranscription;

  ListBuilder<String>? _wrongDefinitionAnswers;
  ListBuilder<String> get wrongDefinitionAnswers =>
      _$this._wrongDefinitionAnswers ??= ListBuilder<String>();
  set wrongDefinitionAnswers(ListBuilder<String>? wrongDefinitionAnswers) =>
      _$this._wrongDefinitionAnswers = wrongDefinitionAnswers;

  ListBuilder<String>? _wrongTermAnswers;
  ListBuilder<String> get wrongTermAnswers =>
      _$this._wrongTermAnswers ??= ListBuilder<String>();
  set wrongTermAnswers(ListBuilder<String>? wrongTermAnswers) =>
      _$this._wrongTermAnswers = wrongTermAnswers;

  QueueCardBuilder() {
    QueueCard._defaults(this);
  }

  QueueCardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _altAnswers = $v.altAnswers?.toBuilder();
      _codeLanguage = $v.codeLanguage;
      _contentType = $v.contentType;
      _definition = $v.definition;
      _definitionImageUrl = $v.definitionImageUrl;
      _definitionTranscription = $v.definitionTranscription;
      _hint = $v.hint;
      _id = $v.id;
      _position = $v.position;
      _term = $v.term;
      _termImageUrl = $v.termImageUrl;
      _termTranscription = $v.termTranscription;
      _wrongDefinitionAnswers = $v.wrongDefinitionAnswers?.toBuilder();
      _wrongTermAnswers = $v.wrongTermAnswers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QueueCard other) {
    _$v = other as _$QueueCard;
  }

  @override
  void update(void Function(QueueCardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QueueCard build() => _build();

  _$QueueCard _build() {
    _$QueueCard _$result;
    try {
      _$result = _$v ??
          _$QueueCard._(
            altAnswers: _altAnswers?.build(),
            codeLanguage: codeLanguage,
            contentType: BuiltValueNullFieldError.checkNotNull(
                contentType, r'QueueCard', 'contentType'),
            definition: BuiltValueNullFieldError.checkNotNull(
                definition, r'QueueCard', 'definition'),
            definitionImageUrl: definitionImageUrl,
            definitionTranscription: definitionTranscription,
            hint: hint,
            id: BuiltValueNullFieldError.checkNotNull(id, r'QueueCard', 'id'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'QueueCard', 'position'),
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'QueueCard', 'term'),
            termImageUrl: termImageUrl,
            termTranscription: termTranscription,
            wrongDefinitionAnswers: _wrongDefinitionAnswers?.build(),
            wrongTermAnswers: _wrongTermAnswers?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'altAnswers';
        _altAnswers?.build();

        _$failedField = 'wrongDefinitionAnswers';
        _wrongDefinitionAnswers?.build();
        _$failedField = 'wrongTermAnswers';
        _wrongTermAnswers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'QueueCard', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
