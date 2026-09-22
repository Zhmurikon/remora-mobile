// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_card.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicCard extends PublicCard {
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

  factory _$PublicCard([void Function(PublicCardBuilder)? updates]) =>
      (PublicCardBuilder()..update(updates))._build();

  _$PublicCard._(
      {this.codeLanguage,
      required this.contentType,
      required this.definition,
      this.definitionImageUrl,
      this.definitionTranscription,
      this.hint,
      required this.id,
      required this.position,
      required this.term,
      this.termImageUrl,
      this.termTranscription})
      : super._();
  @override
  PublicCard rebuild(void Function(PublicCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicCardBuilder toBuilder() => PublicCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicCard &&
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
        termTranscription == other.termTranscription;
  }

  @override
  int get hashCode {
    var _$hash = 0;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicCard')
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
          ..add('termTranscription', termTranscription))
        .toString();
  }
}

class PublicCardBuilder implements Builder<PublicCard, PublicCardBuilder> {
  _$PublicCard? _$v;

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

  PublicCardBuilder() {
    PublicCard._defaults(this);
  }

  PublicCardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicCard other) {
    _$v = other as _$PublicCard;
  }

  @override
  void update(void Function(PublicCardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicCard build() => _build();

  _$PublicCard _build() {
    final _$result = _$v ??
        _$PublicCard._(
          codeLanguage: codeLanguage,
          contentType: BuiltValueNullFieldError.checkNotNull(
              contentType, r'PublicCard', 'contentType'),
          definition: BuiltValueNullFieldError.checkNotNull(
              definition, r'PublicCard', 'definition'),
          definitionImageUrl: definitionImageUrl,
          definitionTranscription: definitionTranscription,
          hint: hint,
          id: BuiltValueNullFieldError.checkNotNull(id, r'PublicCard', 'id'),
          position: BuiltValueNullFieldError.checkNotNull(
              position, r'PublicCard', 'position'),
          term: BuiltValueNullFieldError.checkNotNull(
              term, r'PublicCard', 'term'),
          termImageUrl: termImageUrl,
          termTranscription: termTranscription,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
