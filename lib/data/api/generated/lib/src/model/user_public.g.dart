// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPublic extends UserPublic {
  @override
  final String? avatarUrl;
  @override
  final Date? birthDate;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final bool emailVerified;
  @override
  final String id;
  @override
  final String locale;
  @override
  final String role;
  @override
  final String timezone;
  @override
  final String username;

  factory _$UserPublic([void Function(UserPublicBuilder)? updates]) =>
      (UserPublicBuilder()..update(updates))._build();

  _$UserPublic._(
      {this.avatarUrl,
      this.birthDate,
      this.displayName,
      this.email,
      required this.emailVerified,
      required this.id,
      required this.locale,
      required this.role,
      required this.timezone,
      required this.username})
      : super._();
  @override
  UserPublic rebuild(void Function(UserPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPublicBuilder toBuilder() => UserPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPublic &&
        avatarUrl == other.avatarUrl &&
        birthDate == other.birthDate &&
        displayName == other.displayName &&
        email == other.email &&
        emailVerified == other.emailVerified &&
        id == other.id &&
        locale == other.locale &&
        role == other.role &&
        timezone == other.timezone &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, emailVerified.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, timezone.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPublic')
          ..add('avatarUrl', avatarUrl)
          ..add('birthDate', birthDate)
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('emailVerified', emailVerified)
          ..add('id', id)
          ..add('locale', locale)
          ..add('role', role)
          ..add('timezone', timezone)
          ..add('username', username))
        .toString();
  }
}

class UserPublicBuilder implements Builder<UserPublic, UserPublicBuilder> {
  _$UserPublic? _$v;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  Date? _birthDate;
  Date? get birthDate => _$this._birthDate;
  set birthDate(Date? birthDate) => _$this._birthDate = birthDate;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _emailVerified;
  bool? get emailVerified => _$this._emailVerified;
  set emailVerified(bool? emailVerified) =>
      _$this._emailVerified = emailVerified;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _timezone;
  String? get timezone => _$this._timezone;
  set timezone(String? timezone) => _$this._timezone = timezone;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  UserPublicBuilder() {
    UserPublic._defaults(this);
  }

  UserPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avatarUrl = $v.avatarUrl;
      _birthDate = $v.birthDate;
      _displayName = $v.displayName;
      _email = $v.email;
      _emailVerified = $v.emailVerified;
      _id = $v.id;
      _locale = $v.locale;
      _role = $v.role;
      _timezone = $v.timezone;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPublic other) {
    _$v = other as _$UserPublic;
  }

  @override
  void update(void Function(UserPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPublic build() => _build();

  _$UserPublic _build() {
    final _$result = _$v ??
        _$UserPublic._(
          avatarUrl: avatarUrl,
          birthDate: birthDate,
          displayName: displayName,
          email: email,
          emailVerified: BuiltValueNullFieldError.checkNotNull(
              emailVerified, r'UserPublic', 'emailVerified'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'UserPublic', 'id'),
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'UserPublic', 'locale'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'UserPublic', 'role'),
          timezone: BuiltValueNullFieldError.checkNotNull(
              timezone, r'UserPublic', 'timezone'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'UserPublic', 'username'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
