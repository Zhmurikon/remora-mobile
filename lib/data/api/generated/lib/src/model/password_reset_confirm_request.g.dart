// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetConfirmRequest extends PasswordResetConfirmRequest {
  @override
  final String newPassword;
  @override
  final String token;

  factory _$PasswordResetConfirmRequest(
          [void Function(PasswordResetConfirmRequestBuilder)? updates]) =>
      (PasswordResetConfirmRequestBuilder()..update(updates))._build();

  _$PasswordResetConfirmRequest._(
      {required this.newPassword, required this.token})
      : super._();
  @override
  PasswordResetConfirmRequest rebuild(
          void Function(PasswordResetConfirmRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetConfirmRequestBuilder toBuilder() =>
      PasswordResetConfirmRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetConfirmRequest &&
        newPassword == other.newPassword &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetConfirmRequest')
          ..add('newPassword', newPassword)
          ..add('token', token))
        .toString();
  }
}

class PasswordResetConfirmRequestBuilder
    implements
        Builder<PasswordResetConfirmRequest,
            PasswordResetConfirmRequestBuilder> {
  _$PasswordResetConfirmRequest? _$v;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  PasswordResetConfirmRequestBuilder() {
    PasswordResetConfirmRequest._defaults(this);
  }

  PasswordResetConfirmRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newPassword = $v.newPassword;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetConfirmRequest other) {
    _$v = other as _$PasswordResetConfirmRequest;
  }

  @override
  void update(void Function(PasswordResetConfirmRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetConfirmRequest build() => _build();

  _$PasswordResetConfirmRequest _build() {
    final _$result = _$v ??
        _$PasswordResetConfirmRequest._(
          newPassword: BuiltValueNullFieldError.checkNotNull(
              newPassword, r'PasswordResetConfirmRequest', 'newPassword'),
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'PasswordResetConfirmRequest', 'token'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
