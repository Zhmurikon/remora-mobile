// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_change_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordChangeRequest extends PasswordChangeRequest {
  @override
  final String currentPassword;
  @override
  final String newPassword;

  factory _$PasswordChangeRequest(
          [void Function(PasswordChangeRequestBuilder)? updates]) =>
      (PasswordChangeRequestBuilder()..update(updates))._build();

  _$PasswordChangeRequest._(
      {required this.currentPassword, required this.newPassword})
      : super._();
  @override
  PasswordChangeRequest rebuild(
          void Function(PasswordChangeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordChangeRequestBuilder toBuilder() =>
      PasswordChangeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordChangeRequest &&
        currentPassword == other.currentPassword &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentPassword.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordChangeRequest')
          ..add('currentPassword', currentPassword)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class PasswordChangeRequestBuilder
    implements Builder<PasswordChangeRequest, PasswordChangeRequestBuilder> {
  _$PasswordChangeRequest? _$v;

  String? _currentPassword;
  String? get currentPassword => _$this._currentPassword;
  set currentPassword(String? currentPassword) =>
      _$this._currentPassword = currentPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  PasswordChangeRequestBuilder() {
    PasswordChangeRequest._defaults(this);
  }

  PasswordChangeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPassword = $v.currentPassword;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordChangeRequest other) {
    _$v = other as _$PasswordChangeRequest;
  }

  @override
  void update(void Function(PasswordChangeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordChangeRequest build() => _build();

  _$PasswordChangeRequest _build() {
    final _$result = _$v ??
        _$PasswordChangeRequest._(
          currentPassword: BuiltValueNullFieldError.checkNotNull(
              currentPassword, r'PasswordChangeRequest', 'currentPassword'),
          newPassword: BuiltValueNullFieldError.checkNotNull(
              newPassword, r'PasswordChangeRequest', 'newPassword'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
