// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileUpdateRequest extends ProfileUpdateRequest {
  @override
  final String? displayName;
  @override
  final String locale;
  @override
  final String timezone;
  @override
  final String username;

  factory _$ProfileUpdateRequest(
          [void Function(ProfileUpdateRequestBuilder)? updates]) =>
      (ProfileUpdateRequestBuilder()..update(updates))._build();

  _$ProfileUpdateRequest._(
      {this.displayName,
      required this.locale,
      required this.timezone,
      required this.username})
      : super._();
  @override
  ProfileUpdateRequest rebuild(
          void Function(ProfileUpdateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileUpdateRequestBuilder toBuilder() =>
      ProfileUpdateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileUpdateRequest &&
        displayName == other.displayName &&
        locale == other.locale &&
        timezone == other.timezone &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, timezone.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileUpdateRequest')
          ..add('displayName', displayName)
          ..add('locale', locale)
          ..add('timezone', timezone)
          ..add('username', username))
        .toString();
  }
}

class ProfileUpdateRequestBuilder
    implements Builder<ProfileUpdateRequest, ProfileUpdateRequestBuilder> {
  _$ProfileUpdateRequest? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _timezone;
  String? get timezone => _$this._timezone;
  set timezone(String? timezone) => _$this._timezone = timezone;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  ProfileUpdateRequestBuilder() {
    ProfileUpdateRequest._defaults(this);
  }

  ProfileUpdateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _locale = $v.locale;
      _timezone = $v.timezone;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileUpdateRequest other) {
    _$v = other as _$ProfileUpdateRequest;
  }

  @override
  void update(void Function(ProfileUpdateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileUpdateRequest build() => _build();

  _$ProfileUpdateRequest _build() {
    final _$result = _$v ??
        _$ProfileUpdateRequest._(
          displayName: displayName,
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'ProfileUpdateRequest', 'locale'),
          timezone: BuiltValueNullFieldError.checkNotNull(
              timezone, r'ProfileUpdateRequest', 'timezone'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'ProfileUpdateRequest', 'username'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
