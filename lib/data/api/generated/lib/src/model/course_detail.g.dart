// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseDetail extends CourseDetail {
  @override
  final CourseAuthor author;
  @override
  final DateTime createdAt;
  @override
  final String? description;
  @override
  final String id;
  @override
  final bool isListed;
  @override
  final bool isPublished;
  @override
  final bool? likedByMe;
  @override
  final int? likesCount;
  @override
  final String moderationStatus;
  @override
  final DateTime? publishedAt;
  @override
  final int? savesCount;
  @override
  final BuiltList<CourseSectionPublic> sections;
  @override
  final String slug;
  @override
  final BuiltList<String> tags;
  @override
  final String title;
  @override
  final DateTime updatedAt;

  factory _$CourseDetail([void Function(CourseDetailBuilder)? updates]) =>
      (CourseDetailBuilder()..update(updates))._build();

  _$CourseDetail._(
      {required this.author,
      required this.createdAt,
      this.description,
      required this.id,
      required this.isListed,
      required this.isPublished,
      this.likedByMe,
      this.likesCount,
      required this.moderationStatus,
      this.publishedAt,
      this.savesCount,
      required this.sections,
      required this.slug,
      required this.tags,
      required this.title,
      required this.updatedAt})
      : super._();
  @override
  CourseDetail rebuild(void Function(CourseDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseDetailBuilder toBuilder() => CourseDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseDetail &&
        author == other.author &&
        createdAt == other.createdAt &&
        description == other.description &&
        id == other.id &&
        isListed == other.isListed &&
        isPublished == other.isPublished &&
        likedByMe == other.likedByMe &&
        likesCount == other.likesCount &&
        moderationStatus == other.moderationStatus &&
        publishedAt == other.publishedAt &&
        savesCount == other.savesCount &&
        sections == other.sections &&
        slug == other.slug &&
        tags == other.tags &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isListed.hashCode);
    _$hash = $jc(_$hash, isPublished.hashCode);
    _$hash = $jc(_$hash, likedByMe.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, moderationStatus.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, savesCount.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseDetail')
          ..add('author', author)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('id', id)
          ..add('isListed', isListed)
          ..add('isPublished', isPublished)
          ..add('likedByMe', likedByMe)
          ..add('likesCount', likesCount)
          ..add('moderationStatus', moderationStatus)
          ..add('publishedAt', publishedAt)
          ..add('savesCount', savesCount)
          ..add('sections', sections)
          ..add('slug', slug)
          ..add('tags', tags)
          ..add('title', title)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CourseDetailBuilder
    implements Builder<CourseDetail, CourseDetailBuilder> {
  _$CourseDetail? _$v;

  CourseAuthorBuilder? _author;
  CourseAuthorBuilder get author => _$this._author ??= CourseAuthorBuilder();
  set author(CourseAuthorBuilder? author) => _$this._author = author;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isListed;
  bool? get isListed => _$this._isListed;
  set isListed(bool? isListed) => _$this._isListed = isListed;

  bool? _isPublished;
  bool? get isPublished => _$this._isPublished;
  set isPublished(bool? isPublished) => _$this._isPublished = isPublished;

  bool? _likedByMe;
  bool? get likedByMe => _$this._likedByMe;
  set likedByMe(bool? likedByMe) => _$this._likedByMe = likedByMe;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  String? _moderationStatus;
  String? get moderationStatus => _$this._moderationStatus;
  set moderationStatus(String? moderationStatus) =>
      _$this._moderationStatus = moderationStatus;

  DateTime? _publishedAt;
  DateTime? get publishedAt => _$this._publishedAt;
  set publishedAt(DateTime? publishedAt) => _$this._publishedAt = publishedAt;

  int? _savesCount;
  int? get savesCount => _$this._savesCount;
  set savesCount(int? savesCount) => _$this._savesCount = savesCount;

  ListBuilder<CourseSectionPublic>? _sections;
  ListBuilder<CourseSectionPublic> get sections =>
      _$this._sections ??= ListBuilder<CourseSectionPublic>();
  set sections(ListBuilder<CourseSectionPublic>? sections) =>
      _$this._sections = sections;

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

  CourseDetailBuilder() {
    CourseDetail._defaults(this);
  }

  CourseDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author.toBuilder();
      _createdAt = $v.createdAt;
      _description = $v.description;
      _id = $v.id;
      _isListed = $v.isListed;
      _isPublished = $v.isPublished;
      _likedByMe = $v.likedByMe;
      _likesCount = $v.likesCount;
      _moderationStatus = $v.moderationStatus;
      _publishedAt = $v.publishedAt;
      _savesCount = $v.savesCount;
      _sections = $v.sections.toBuilder();
      _slug = $v.slug;
      _tags = $v.tags.toBuilder();
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseDetail other) {
    _$v = other as _$CourseDetail;
  }

  @override
  void update(void Function(CourseDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseDetail build() => _build();

  _$CourseDetail _build() {
    _$CourseDetail _$result;
    try {
      _$result = _$v ??
          _$CourseDetail._(
            author: author.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CourseDetail', 'createdAt'),
            description: description,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CourseDetail', 'id'),
            isListed: BuiltValueNullFieldError.checkNotNull(
                isListed, r'CourseDetail', 'isListed'),
            isPublished: BuiltValueNullFieldError.checkNotNull(
                isPublished, r'CourseDetail', 'isPublished'),
            likedByMe: likedByMe,
            likesCount: likesCount,
            moderationStatus: BuiltValueNullFieldError.checkNotNull(
                moderationStatus, r'CourseDetail', 'moderationStatus'),
            publishedAt: publishedAt,
            savesCount: savesCount,
            sections: sections.build(),
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'CourseDetail', 'slug'),
            tags: tags.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseDetail', 'title'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CourseDetail', 'updatedAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'author';
        author.build();

        _$failedField = 'sections';
        sections.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
