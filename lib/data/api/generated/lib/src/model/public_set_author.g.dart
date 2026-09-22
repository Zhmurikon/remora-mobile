// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_set_author.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicSetAuthor extends PublicSetAuthor {
  @override
  final String? avatarUrl;
  @override
  final String? displayName;
  @override
  final String username;

  factory _$PublicSetAuthor([void Function(PublicSetAuthorBuilder)? updates]) =>
      (PublicSetAuthorBuilder()..update(updates))._build();

  _$PublicSetAuthor._(
      {this.avatarUrl, this.displayName, required this.username})
      : super._();
  @override
  PublicSetAuthor rebuild(void Function(PublicSetAuthorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicSetAuthorBuilder toBuilder() => PublicSetAuthorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicSetAuthor &&
        avatarUrl == other.avatarUrl &&
        displayName == other.displayName &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicSetAuthor')
          ..add('avatarUrl', avatarUrl)
          ..add('displayName', displayName)
          ..add('username', username))
        .toString();
  }
}

class PublicSetAuthorBuilder
    implements Builder<PublicSetAuthor, PublicSetAuthorBuilder> {
  _$PublicSetAuthor? _$v;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  PublicSetAuthorBuilder() {
    PublicSetAuthor._defaults(this);
  }

  PublicSetAuthorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avatarUrl = $v.avatarUrl;
      _displayName = $v.displayName;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicSetAuthor other) {
    _$v = other as _$PublicSetAuthor;
  }

  @override
  void update(void Function(PublicSetAuthorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicSetAuthor build() => _build();

  _$PublicSetAuthor _build() {
    final _$result = _$v ??
        _$PublicSetAuthor._(
          avatarUrl: avatarUrl,
          displayName: displayName,
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'PublicSetAuthor', 'username'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
