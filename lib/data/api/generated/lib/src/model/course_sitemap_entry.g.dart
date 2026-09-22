// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_sitemap_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseSitemapEntry extends CourseSitemapEntry {
  @override
  final String authorUsername;
  @override
  final String slug;
  @override
  final DateTime updatedAt;

  factory _$CourseSitemapEntry(
          [void Function(CourseSitemapEntryBuilder)? updates]) =>
      (CourseSitemapEntryBuilder()..update(updates))._build();

  _$CourseSitemapEntry._(
      {required this.authorUsername,
      required this.slug,
      required this.updatedAt})
      : super._();
  @override
  CourseSitemapEntry rebuild(
          void Function(CourseSitemapEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseSitemapEntryBuilder toBuilder() =>
      CourseSitemapEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseSitemapEntry &&
        authorUsername == other.authorUsername &&
        slug == other.slug &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authorUsername.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseSitemapEntry')
          ..add('authorUsername', authorUsername)
          ..add('slug', slug)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CourseSitemapEntryBuilder
    implements Builder<CourseSitemapEntry, CourseSitemapEntryBuilder> {
  _$CourseSitemapEntry? _$v;

  String? _authorUsername;
  String? get authorUsername => _$this._authorUsername;
  set authorUsername(String? authorUsername) =>
      _$this._authorUsername = authorUsername;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  CourseSitemapEntryBuilder() {
    CourseSitemapEntry._defaults(this);
  }

  CourseSitemapEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authorUsername = $v.authorUsername;
      _slug = $v.slug;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseSitemapEntry other) {
    _$v = other as _$CourseSitemapEntry;
  }

  @override
  void update(void Function(CourseSitemapEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseSitemapEntry build() => _build();

  _$CourseSitemapEntry _build() {
    final _$result = _$v ??
        _$CourseSitemapEntry._(
          authorUsername: BuiltValueNullFieldError.checkNotNull(
              authorUsername, r'CourseSitemapEntry', 'authorUsername'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'CourseSitemapEntry', 'slug'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'CourseSitemapEntry', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
