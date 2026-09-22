// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardWrite extends CardWrite {
  @override
  final BuiltList<String>? altAnswers;
  @override
  final String? codeLanguage;
  @override
  final ContentType? contentType;
  @override
  final String definition;
  @override
  final String? definitionImageId;
  @override
  final String? definitionTranscription;
  @override
  final String? hint;
  @override
  final String? id;
  @override
  final String term;
  @override
  final String? termImageId;
  @override
  final String? termTranscription;
  @override
  final BuiltList<String>? wrongDefinitionAnswers;
  @override
  final BuiltList<String>? wrongTermAnswers;

  factory _$CardWrite([void Function(CardWriteBuilder)? updates]) =>
      (CardWriteBuilder()..update(updates))._build();

  _$CardWrite._(
      {this.altAnswers,
      this.codeLanguage,
      this.contentType,
      required this.definition,
      this.definitionImageId,
      this.definitionTranscription,
      this.hint,
      this.id,
      required this.term,
      this.termImageId,
      this.termTranscription,
      this.wrongDefinitionAnswers,
      this.wrongTermAnswers})
      : super._();
  @override
  CardWrite rebuild(void Function(CardWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardWriteBuilder toBuilder() => CardWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardWrite &&
        altAnswers == other.altAnswers &&
        codeLanguage == other.codeLanguage &&
        contentType == other.contentType &&
        definition == other.definition &&
        definitionImageId == other.definitionImageId &&
        definitionTranscription == other.definitionTranscription &&
        hint == other.hint &&
        id == other.id &&
        term == other.term &&
        termImageId == other.termImageId &&
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
    _$hash = $jc(_$hash, definitionImageId.hashCode);
    _$hash = $jc(_$hash, definitionTranscription.hashCode);
    _$hash = $jc(_$hash, hint.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, term.hashCode);
    _$hash = $jc(_$hash, termImageId.hashCode);
    _$hash = $jc(_$hash, termTranscription.hashCode);
    _$hash = $jc(_$hash, wrongDefinitionAnswers.hashCode);
    _$hash = $jc(_$hash, wrongTermAnswers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardWrite')
          ..add('altAnswers', altAnswers)
          ..add('codeLanguage', codeLanguage)
          ..add('contentType', contentType)
          ..add('definition', definition)
          ..add('definitionImageId', definitionImageId)
          ..add('definitionTranscription', definitionTranscription)
          ..add('hint', hint)
          ..add('id', id)
          ..add('term', term)
          ..add('termImageId', termImageId)
          ..add('termTranscription', termTranscription)
          ..add('wrongDefinitionAnswers', wrongDefinitionAnswers)
          ..add('wrongTermAnswers', wrongTermAnswers))
        .toString();
  }
}

class CardWriteBuilder implements Builder<CardWrite, CardWriteBuilder> {
  _$CardWrite? _$v;

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

  String? _definitionImageId;
  String? get definitionImageId => _$this._definitionImageId;
  set definitionImageId(String? definitionImageId) =>
      _$this._definitionImageId = definitionImageId;

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

  String? _term;
  String? get term => _$this._term;
  set term(String? term) => _$this._term = term;

  String? _termImageId;
  String? get termImageId => _$this._termImageId;
  set termImageId(String? termImageId) => _$this._termImageId = termImageId;

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

  CardWriteBuilder() {
    CardWrite._defaults(this);
  }

  CardWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _altAnswers = $v.altAnswers?.toBuilder();
      _codeLanguage = $v.codeLanguage;
      _contentType = $v.contentType;
      _definition = $v.definition;
      _definitionImageId = $v.definitionImageId;
      _definitionTranscription = $v.definitionTranscription;
      _hint = $v.hint;
      _id = $v.id;
      _term = $v.term;
      _termImageId = $v.termImageId;
      _termTranscription = $v.termTranscription;
      _wrongDefinitionAnswers = $v.wrongDefinitionAnswers?.toBuilder();
      _wrongTermAnswers = $v.wrongTermAnswers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardWrite other) {
    _$v = other as _$CardWrite;
  }

  @override
  void update(void Function(CardWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardWrite build() => _build();

  _$CardWrite _build() {
    _$CardWrite _$result;
    try {
      _$result = _$v ??
          _$CardWrite._(
            altAnswers: _altAnswers?.build(),
            codeLanguage: codeLanguage,
            contentType: contentType,
            definition: BuiltValueNullFieldError.checkNotNull(
                definition, r'CardWrite', 'definition'),
            definitionImageId: definitionImageId,
            definitionTranscription: definitionTranscription,
            hint: hint,
            id: id,
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'CardWrite', 'term'),
            termImageId: termImageId,
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
            r'CardWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
