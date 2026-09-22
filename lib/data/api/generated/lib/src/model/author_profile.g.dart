// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthorProfile extends AuthorProfile {
  @override
  final String? avatarUrl;
  @override
  final BuiltList<String> badges;
  @override
  final BuiltList<CourseSearchItem> courses;
  @override
  final String? displayName;
  @override
  final String id;
  @override
  final DateTime joinedAt;
  @override
  final AuthorStats stats;
  @override
  final String username;

  factory _$AuthorProfile([void Function(AuthorProfileBuilder)? updates]) =>
      (AuthorProfileBuilder()..update(updates))._build();

  _$AuthorProfile._(
      {this.avatarUrl,
      required this.badges,
      required this.courses,
      this.displayName,
      required this.id,
      required this.joinedAt,
      required this.stats,
      required this.username})
      : super._();
  @override
  AuthorProfile rebuild(void Function(AuthorProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorProfileBuilder toBuilder() => AuthorProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorProfile &&
        avatarUrl == other.avatarUrl &&
        badges == other.badges &&
        courses == other.courses &&
        displayName == other.displayName &&
        id == other.id &&
        joinedAt == other.joinedAt &&
        stats == other.stats &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jc(_$hash, badges.hashCode);
    _$hash = $jc(_$hash, courses.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, joinedAt.hashCode);
    _$hash = $jc(_$hash, stats.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthorProfile')
          ..add('avatarUrl', avatarUrl)
          ..add('badges', badges)
          ..add('courses', courses)
          ..add('displayName', displayName)
          ..add('id', id)
          ..add('joinedAt', joinedAt)
          ..add('stats', stats)
          ..add('username', username))
        .toString();
  }
}

class AuthorProfileBuilder
    implements Builder<AuthorProfile, AuthorProfileBuilder> {
  _$AuthorProfile? _$v;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  ListBuilder<String>? _badges;
  ListBuilder<String> get badges => _$this._badges ??= ListBuilder<String>();
  set badges(ListBuilder<String>? badges) => _$this._badges = badges;

  ListBuilder<CourseSearchItem>? _courses;
  ListBuilder<CourseSearchItem> get courses =>
      _$this._courses ??= ListBuilder<CourseSearchItem>();
  set courses(ListBuilder<CourseSearchItem>? courses) =>
      _$this._courses = courses;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _joinedAt;
  DateTime? get joinedAt => _$this._joinedAt;
  set joinedAt(DateTime? joinedAt) => _$this._joinedAt = joinedAt;

  AuthorStatsBuilder? _stats;
  AuthorStatsBuilder get stats => _$this._stats ??= AuthorStatsBuilder();
  set stats(AuthorStatsBuilder? stats) => _$this._stats = stats;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  AuthorProfileBuilder() {
    AuthorProfile._defaults(this);
  }

  AuthorProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avatarUrl = $v.avatarUrl;
      _badges = $v.badges.toBuilder();
      _courses = $v.courses.toBuilder();
      _displayName = $v.displayName;
      _id = $v.id;
      _joinedAt = $v.joinedAt;
      _stats = $v.stats.toBuilder();
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorProfile other) {
    _$v = other as _$AuthorProfile;
  }

  @override
  void update(void Function(AuthorProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthorProfile build() => _build();

  _$AuthorProfile _build() {
    _$AuthorProfile _$result;
    try {
      _$result = _$v ??
          _$AuthorProfile._(
            avatarUrl: avatarUrl,
            badges: badges.build(),
            courses: courses.build(),
            displayName: displayName,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AuthorProfile', 'id'),
            joinedAt: BuiltValueNullFieldError.checkNotNull(
                joinedAt, r'AuthorProfile', 'joinedAt'),
            stats: stats.build(),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'AuthorProfile', 'username'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'badges';
        badges.build();
        _$failedField = 'courses';
        courses.build();

        _$failedField = 'stats';
        stats.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AuthorProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
