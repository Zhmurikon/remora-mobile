// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_set.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicSet extends PublicSet {
  @override
  final PublicSetAuthor author;
  @override
  final BuiltList<PublicCard> cards;
  @override
  final int cardsCount;
  @override
  final String? courseUrl;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final String id;
  @override
  final String langDefinition;
  @override
  final String langTerm;
  @override
  final int? nextCursor;
  @override
  final String slug;
  @override
  final String title;
  @override
  final DateTime updatedAt;
  @override
  final SetVisibility visibility;

  factory _$PublicSet([void Function(PublicSetBuilder)? updates]) =>
      (PublicSetBuilder()..update(updates))._build();

  _$PublicSet._(
      {required this.author,
      required this.cards,
      required this.cardsCount,
      this.courseUrl,
      required this.createdAt,
      required this.description,
      required this.id,
      required this.langDefinition,
      required this.langTerm,
      this.nextCursor,
      required this.slug,
      required this.title,
      required this.updatedAt,
      required this.visibility})
      : super._();
  @override
  PublicSet rebuild(void Function(PublicSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicSetBuilder toBuilder() => PublicSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicSet &&
        author == other.author &&
        cards == other.cards &&
        cardsCount == other.cardsCount &&
        courseUrl == other.courseUrl &&
        createdAt == other.createdAt &&
        description == other.description &&
        id == other.id &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        nextCursor == other.nextCursor &&
        slug == other.slug &&
        title == other.title &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, cards.hashCode);
    _$hash = $jc(_$hash, cardsCount.hashCode);
    _$hash = $jc(_$hash, courseUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, nextCursor.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicSet')
          ..add('author', author)
          ..add('cards', cards)
          ..add('cardsCount', cardsCount)
          ..add('courseUrl', courseUrl)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('id', id)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('nextCursor', nextCursor)
          ..add('slug', slug)
          ..add('title', title)
          ..add('updatedAt', updatedAt)
          ..add('visibility', visibility))
        .toString();
  }
}

class PublicSetBuilder implements Builder<PublicSet, PublicSetBuilder> {
  _$PublicSet? _$v;

  PublicSetAuthorBuilder? _author;
  PublicSetAuthorBuilder get author =>
      _$this._author ??= PublicSetAuthorBuilder();
  set author(PublicSetAuthorBuilder? author) => _$this._author = author;

  ListBuilder<PublicCard>? _cards;
  ListBuilder<PublicCard> get cards =>
      _$this._cards ??= ListBuilder<PublicCard>();
  set cards(ListBuilder<PublicCard>? cards) => _$this._cards = cards;

  int? _cardsCount;
  int? get cardsCount => _$this._cardsCount;
  set cardsCount(int? cardsCount) => _$this._cardsCount = cardsCount;

  String? _courseUrl;
  String? get courseUrl => _$this._courseUrl;
  set courseUrl(String? courseUrl) => _$this._courseUrl = courseUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

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

  int? _nextCursor;
  int? get nextCursor => _$this._nextCursor;
  set nextCursor(int? nextCursor) => _$this._nextCursor = nextCursor;

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

  PublicSetBuilder() {
    PublicSet._defaults(this);
  }

  PublicSetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author.toBuilder();
      _cards = $v.cards.toBuilder();
      _cardsCount = $v.cardsCount;
      _courseUrl = $v.courseUrl;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _id = $v.id;
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _nextCursor = $v.nextCursor;
      _slug = $v.slug;
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicSet other) {
    _$v = other as _$PublicSet;
  }

  @override
  void update(void Function(PublicSetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicSet build() => _build();

  _$PublicSet _build() {
    _$PublicSet _$result;
    try {
      _$result = _$v ??
          _$PublicSet._(
            author: author.build(),
            cards: cards.build(),
            cardsCount: BuiltValueNullFieldError.checkNotNull(
                cardsCount, r'PublicSet', 'cardsCount'),
            courseUrl: courseUrl,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'PublicSet', 'createdAt'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'PublicSet', 'description'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'PublicSet', 'id'),
            langDefinition: BuiltValueNullFieldError.checkNotNull(
                langDefinition, r'PublicSet', 'langDefinition'),
            langTerm: BuiltValueNullFieldError.checkNotNull(
                langTerm, r'PublicSet', 'langTerm'),
            nextCursor: nextCursor,
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'PublicSet', 'slug'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'PublicSet', 'title'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'PublicSet', 'updatedAt'),
            visibility: BuiltValueNullFieldError.checkNotNull(
                visibility, r'PublicSet', 'visibility'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
        _$failedField = 'cards';
        cards.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PublicSet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
