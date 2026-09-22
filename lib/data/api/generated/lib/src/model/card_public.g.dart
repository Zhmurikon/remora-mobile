// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardPublic extends CardPublic {
  @override
  final BuiltList<String>? altAnswers;
  @override
  final String? codeLanguage;
  @override
  final ContentType? contentType;
  @override
  final DateTime createdAt;
  @override
  final String definition;
  @override
  final String? definitionImageId;
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
  final String? termImageId;
  @override
  final String? termTranscription;
  @override
  final DateTime updatedAt;
  @override
  final BuiltList<String>? wrongDefinitionAnswers;
  @override
  final BuiltList<String>? wrongTermAnswers;

  factory _$CardPublic([void Function(CardPublicBuilder)? updates]) =>
      (CardPublicBuilder()..update(updates))._build();

  _$CardPublic._(
      {this.altAnswers,
      this.codeLanguage,
      this.contentType,
      required this.createdAt,
      required this.definition,
      this.definitionImageId,
      this.definitionTranscription,
      this.hint,
      required this.id,
      required this.position,
      required this.term,
      this.termImageId,
      this.termTranscription,
      required this.updatedAt,
      this.wrongDefinitionAnswers,
      this.wrongTermAnswers})
      : super._();
  @override
  CardPublic rebuild(void Function(CardPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardPublicBuilder toBuilder() => CardPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardPublic &&
        altAnswers == other.altAnswers &&
        codeLanguage == other.codeLanguage &&
        contentType == other.contentType &&
        createdAt == other.createdAt &&
        definition == other.definition &&
        definitionImageId == other.definitionImageId &&
        definitionTranscription == other.definitionTranscription &&
        hint == other.hint &&
        id == other.id &&
        position == other.position &&
        term == other.term &&
        termImageId == other.termImageId &&
        termTranscription == other.termTranscription &&
        updatedAt == other.updatedAt &&
        wrongDefinitionAnswers == other.wrongDefinitionAnswers &&
        wrongTermAnswers == other.wrongTermAnswers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, altAnswers.hashCode);
    _$hash = $jc(_$hash, codeLanguage.hashCode);
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, definition.hashCode);
    _$hash = $jc(_$hash, definitionImageId.hashCode);
    _$hash = $jc(_$hash, definitionTranscription.hashCode);
    _$hash = $jc(_$hash, hint.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, term.hashCode);
    _$hash = $jc(_$hash, termImageId.hashCode);
    _$hash = $jc(_$hash, termTranscription.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, wrongDefinitionAnswers.hashCode);
    _$hash = $jc(_$hash, wrongTermAnswers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardPublic')
          ..add('altAnswers', altAnswers)
          ..add('codeLanguage', codeLanguage)
          ..add('contentType', contentType)
          ..add('createdAt', createdAt)
          ..add('definition', definition)
          ..add('definitionImageId', definitionImageId)
          ..add('definitionTranscription', definitionTranscription)
          ..add('hint', hint)
          ..add('id', id)
          ..add('position', position)
          ..add('term', term)
          ..add('termImageId', termImageId)
          ..add('termTranscription', termTranscription)
          ..add('updatedAt', updatedAt)
          ..add('wrongDefinitionAnswers', wrongDefinitionAnswers)
          ..add('wrongTermAnswers', wrongTermAnswers))
        .toString();
  }
}

class CardPublicBuilder implements Builder<CardPublic, CardPublicBuilder> {
  _$CardPublic? _$v;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

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

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

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

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

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

  CardPublicBuilder() {
    CardPublic._defaults(this);
  }

  CardPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _altAnswers = $v.altAnswers?.toBuilder();
      _codeLanguage = $v.codeLanguage;
      _contentType = $v.contentType;
      _createdAt = $v.createdAt;
      _definition = $v.definition;
      _definitionImageId = $v.definitionImageId;
      _definitionTranscription = $v.definitionTranscription;
      _hint = $v.hint;
      _id = $v.id;
      _position = $v.position;
      _term = $v.term;
      _termImageId = $v.termImageId;
      _termTranscription = $v.termTranscription;
      _updatedAt = $v.updatedAt;
      _wrongDefinitionAnswers = $v.wrongDefinitionAnswers?.toBuilder();
      _wrongTermAnswers = $v.wrongTermAnswers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardPublic other) {
    _$v = other as _$CardPublic;
  }

  @override
  void update(void Function(CardPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardPublic build() => _build();

  _$CardPublic _build() {
    _$CardPublic _$result;
    try {
      _$result = _$v ??
          _$CardPublic._(
            altAnswers: _altAnswers?.build(),
            codeLanguage: codeLanguage,
            contentType: contentType,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CardPublic', 'createdAt'),
            definition: BuiltValueNullFieldError.checkNotNull(
                definition, r'CardPublic', 'definition'),
            definitionImageId: definitionImageId,
            definitionTranscription: definitionTranscription,
            hint: hint,
            id: BuiltValueNullFieldError.checkNotNull(id, r'CardPublic', 'id'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'CardPublic', 'position'),
            term: BuiltValueNullFieldError.checkNotNull(
                term, r'CardPublic', 'term'),
            termImageId: termImageId,
            termTranscription: termTranscription,
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CardPublic', 'updatedAt'),
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
            r'CardPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
