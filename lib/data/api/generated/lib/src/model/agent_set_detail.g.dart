// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_set_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentSetDetail extends AgentSetDetail {
  @override
  final BuiltList<CardPublic> cards;
  @override
  final int cardsCount;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final String? folderId;
  @override
  final String id;
  @override
  final String langDefinition;
  @override
  final String langTerm;
  @override
  final String revision;
  @override
  final String slug;
  @override
  final String title;
  @override
  final DateTime updatedAt;
  @override
  final SetVisibility visibility;

  factory _$AgentSetDetail([void Function(AgentSetDetailBuilder)? updates]) =>
      (AgentSetDetailBuilder()..update(updates))._build();

  _$AgentSetDetail._(
      {required this.cards,
      required this.cardsCount,
      required this.createdAt,
      required this.description,
      this.folderId,
      required this.id,
      required this.langDefinition,
      required this.langTerm,
      required this.revision,
      required this.slug,
      required this.title,
      required this.updatedAt,
      required this.visibility})
      : super._();
  @override
  AgentSetDetail rebuild(void Function(AgentSetDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentSetDetailBuilder toBuilder() => AgentSetDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentSetDetail &&
        cards == other.cards &&
        cardsCount == other.cardsCount &&
        createdAt == other.createdAt &&
        description == other.description &&
        folderId == other.folderId &&
        id == other.id &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        revision == other.revision &&
        slug == other.slug &&
        title == other.title &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cards.hashCode);
    _$hash = $jc(_$hash, cardsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, revision.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentSetDetail')
          ..add('cards', cards)
          ..add('cardsCount', cardsCount)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('folderId', folderId)
          ..add('id', id)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('revision', revision)
          ..add('slug', slug)
          ..add('title', title)
          ..add('updatedAt', updatedAt)
          ..add('visibility', visibility))
        .toString();
  }
}

class AgentSetDetailBuilder
    implements Builder<AgentSetDetail, AgentSetDetailBuilder> {
  _$AgentSetDetail? _$v;

  ListBuilder<CardPublic>? _cards;
  ListBuilder<CardPublic> get cards =>
      _$this._cards ??= ListBuilder<CardPublic>();
  set cards(ListBuilder<CardPublic>? cards) => _$this._cards = cards;

  int? _cardsCount;
  int? get cardsCount => _$this._cardsCount;
  set cardsCount(int? cardsCount) => _$this._cardsCount = cardsCount;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _langDefinition;
  String? get langDefinition => _$this._langDefinition;
  set langDefinition(String? langDefinition) =>
      _$this._langDefinition = langDefinition;

  String? _langTerm;
  String? get langTerm => _$this._langTerm;
  set langTerm(String? langTerm) => _$this._langTerm = langTerm;

  String? _revision;
  String? get revision => _$this._revision;
  set revision(String? revision) => _$this._revision = revision;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  SetVisibility? _visibility;
  SetVisibility? get visibility => _$this._visibility;
  set visibility(SetVisibility? visibility) => _$this._visibility = visibility;

  AgentSetDetailBuilder() {
    AgentSetDetail._defaults(this);
  }

  AgentSetDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards.toBuilder();
      _cardsCount = $v.cardsCount;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _folderId = $v.folderId;
      _id = $v.id;
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _revision = $v.revision;
      _slug = $v.slug;
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentSetDetail other) {
    _$v = other as _$AgentSetDetail;
  }

  @override
  void update(void Function(AgentSetDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentSetDetail build() => _build();

  _$AgentSetDetail _build() {
    _$AgentSetDetail _$result;
    try {
      _$result = _$v ??
          _$AgentSetDetail._(
            cards: cards.build(),
            cardsCount: BuiltValueNullFieldError.checkNotNull(
                cardsCount, r'AgentSetDetail', 'cardsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AgentSetDetail', 'createdAt'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'AgentSetDetail', 'description'),
            folderId: folderId,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AgentSetDetail', 'id'),
            langDefinition: BuiltValueNullFieldError.checkNotNull(
                langDefinition, r'AgentSetDetail', 'langDefinition'),
            langTerm: BuiltValueNullFieldError.checkNotNull(
                langTerm, r'AgentSetDetail', 'langTerm'),
            revision: BuiltValueNullFieldError.checkNotNull(
                revision, r'AgentSetDetail', 'revision'),
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'AgentSetDetail', 'slug'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentSetDetail', 'title'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'AgentSetDetail', 'updatedAt'),
            visibility: BuiltValueNullFieldError.checkNotNull(
                visibility, r'AgentSetDetail', 'visibility'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        cards.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentSetDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
