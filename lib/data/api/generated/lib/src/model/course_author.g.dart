// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_author.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseAuthor extends CourseAuthor {
  @override
  final String? avatarUrl;
  @override
  final String? displayName;
  @override
  final String id;
  @override
  final String username;

  factory _$CourseAuthor([void Function(CourseAuthorBuilder)? updates]) =>
      (CourseAuthorBuilder()..update(updates))._build();

  _$CourseAuthor._(
      {this.avatarUrl,
      this.displayName,
      required this.id,
      required this.username})
      : super._();
  @override
  CourseAuthor rebuild(void Function(CourseAuthorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseAuthorBuilder toBuilder() => CourseAuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseAuthor &&
        avatarUrl == other.avatarUrl &&
        displayName == other.displayName &&
        id == other.id &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseAuthor')
          ..add('avatarUrl', avatarUrl)
          ..add('displayName', displayName)
          ..add('id', id)
          ..add('username', username))
        .toString();
  }
}

class CourseAuthorBuilder
    implements Builder<CourseAuthor, CourseAuthorBuilder> {
  _$CourseAuthor? _$v;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  CourseAuthorBuilder() {
    CourseAuthor._defaults(this);
  }

  CourseAuthorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avatarUrl = $v.avatarUrl;
      _displayName = $v.displayName;
      _id = $v.id;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseAuthor other) {
    _$v = other as _$CourseAuthor;
  }

  @override
  void update(void Function(CourseAuthorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseAuthor build() => _build();

  _$CourseAuthor _build() {
    final _$result = _$v ??
        _$CourseAuthor._(
          avatarUrl: avatarUrl,
          displayName: displayName,
          id: BuiltValueNullFieldError.checkNotNull(id, r'CourseAuthor', 'id'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'CourseAuthor', 'username'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
