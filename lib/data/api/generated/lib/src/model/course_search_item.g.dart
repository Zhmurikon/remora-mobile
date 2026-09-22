// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_search_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseSearchItem extends CourseSearchItem {
  @override
  final String author;
  @override
  final String authorId;
  @override
  final int cardsCount;
  @override
  final String description;
  @override
  final String id;
  @override
  final BuiltList<String> languages;
  @override
  final int savesCount;
  @override
  final String slug;
  @override
  final BuiltList<String> tags;
  @override
  final String title;
  @override
  final DateTime updatedAt;

  factory _$CourseSearchItem(
          [void Function(CourseSearchItemBuilder)? updates]) =>
      (CourseSearchItemBuilder()..update(updates))._build();

  _$CourseSearchItem._(
      {required this.author,
      required this.authorId,
      required this.cardsCount,
      required this.description,
      required this.id,
      required this.languages,
      required this.savesCount,
      required this.slug,
      required this.tags,
      required this.title,
      required this.updatedAt})
      : super._();
  @override
  CourseSearchItem rebuild(void Function(CourseSearchItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseSearchItemBuilder toBuilder() =>
      CourseSearchItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseSearchItem &&
        author == other.author &&
        authorId == other.authorId &&
        cardsCount == other.cardsCount &&
        description == other.description &&
        id == other.id &&
        languages == other.languages &&
        savesCount == other.savesCount &&
        slug == other.slug &&
        tags == other.tags &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, authorId.hashCode);
    _$hash = $jc(_$hash, cardsCount.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, savesCount.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseSearchItem')
          ..add('author', author)
          ..add('authorId', authorId)
          ..add('cardsCount', cardsCount)
          ..add('description', description)
          ..add('id', id)
          ..add('languages', languages)
          ..add('savesCount', savesCount)
          ..add('slug', slug)
          ..add('tags', tags)
          ..add('title', title)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CourseSearchItemBuilder
    implements Builder<CourseSearchItem, CourseSearchItemBuilder> {
  _$CourseSearchItem? _$v;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _authorId;
  String? get authorId => _$this._authorId;
  set authorId(String? authorId) => _$this._authorId = authorId;

  int? _cardsCount;
  int? get cardsCount => _$this._cardsCount;
  set cardsCount(int? cardsCount) => _$this._cardsCount = cardsCount;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<String>? _languages;
  ListBuilder<String> get languages =>
      _$this._languages ??= ListBuilder<String>();
  set languages(ListBuilder<String>? languages) =>
      _$this._languages = languages;

  int? _savesCount;
  int? get savesCount => _$this._savesCount;
  set savesCount(int? savesCount) => _$this._savesCount = savesCount;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  CourseSearchItemBuilder() {
    CourseSearchItem._defaults(this);
  }

  CourseSearchItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author;
      _authorId = $v.authorId;
      _cardsCount = $v.cardsCount;
      _description = $v.description;
      _id = $v.id;
      _languages = $v.languages.toBuilder();
      _savesCount = $v.savesCount;
      _slug = $v.slug;
      _tags = $v.tags.toBuilder();
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseSearchItem other) {
    _$v = other as _$CourseSearchItem;
  }

  @override
  void update(void Function(CourseSearchItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseSearchItem build() => _build();

  _$CourseSearchItem _build() {
    _$CourseSearchItem _$result;
    try {
      _$result = _$v ??
          _$CourseSearchItem._(
            author: BuiltValueNullFieldError.checkNotNull(
                author, r'CourseSearchItem', 'author'),
            authorId: BuiltValueNullFieldError.checkNotNull(
                authorId, r'CourseSearchItem', 'authorId'),
            cardsCount: BuiltValueNullFieldError.checkNotNull(
                cardsCount, r'CourseSearchItem', 'cardsCount'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CourseSearchItem', 'description'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CourseSearchItem', 'id'),
            languages: languages.build(),
            savesCount: BuiltValueNullFieldError.checkNotNull(
                savesCount, r'CourseSearchItem', 'savesCount'),
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'CourseSearchItem', 'slug'),
            tags: tags.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseSearchItem', 'title'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CourseSearchItem', 'updatedAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'languages';
        languages.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseSearchItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
