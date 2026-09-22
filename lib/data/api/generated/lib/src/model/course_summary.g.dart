// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseSummary extends CourseSummary {
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
  final String slug;
  @override
  final BuiltList<String> tags;
  @override
  final String title;
  @override
  final DateTime updatedAt;

  factory _$CourseSummary([void Function(CourseSummaryBuilder)? updates]) =>
      (CourseSummaryBuilder()..update(updates))._build();

  _$CourseSummary._(
      {required this.createdAt,
      this.description,
      required this.id,
      required this.isListed,
      required this.isPublished,
      this.likedByMe,
      this.likesCount,
      required this.moderationStatus,
      this.publishedAt,
      this.savesCount,
      required this.slug,
      required this.tags,
      required this.title,
      required this.updatedAt})
      : super._();
  @override
  CourseSummary rebuild(void Function(CourseSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseSummaryBuilder toBuilder() => CourseSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseSummary &&
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
        slug == other.slug &&
        tags == other.tags &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
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
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseSummary')
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
          ..add('slug', slug)
          ..add('tags', tags)
          ..add('title', title)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CourseSummaryBuilder
    implements Builder<CourseSummary, CourseSummaryBuilder> {
  _$CourseSummary? _$v;

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

  CourseSummaryBuilder() {
    CourseSummary._defaults(this);
  }

  CourseSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
      _slug = $v.slug;
      _tags = $v.tags.toBuilder();
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseSummary other) {
    _$v = other as _$CourseSummary;
  }

  @override
  void update(void Function(CourseSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseSummary build() => _build();

  _$CourseSummary _build() {
    _$CourseSummary _$result;
    try {
      _$result = _$v ??
          _$CourseSummary._(
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CourseSummary', 'createdAt'),
            description: description,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CourseSummary', 'id'),
            isListed: BuiltValueNullFieldError.checkNotNull(
                isListed, r'CourseSummary', 'isListed'),
            isPublished: BuiltValueNullFieldError.checkNotNull(
                isPublished, r'CourseSummary', 'isPublished'),
            likedByMe: likedByMe,
            likesCount: likesCount,
            moderationStatus: BuiltValueNullFieldError.checkNotNull(
                moderationStatus, r'CourseSummary', 'moderationStatus'),
            publishedAt: publishedAt,
            savesCount: savesCount,
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'CourseSummary', 'slug'),
            tags: tags.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseSummary', 'title'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CourseSummary', 'updatedAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseSummary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
