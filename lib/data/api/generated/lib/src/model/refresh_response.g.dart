// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshResponse extends RefreshResponse {
  @override
  final String accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;

  factory _$RefreshResponse([void Function(RefreshResponseBuilder)? updates]) =>
      (RefreshResponseBuilder()..update(updates))._build();

  _$RefreshResponse._(
      {required this.accessToken, this.refreshToken, this.tokenType})
      : super._();
  @override
  RefreshResponse rebuild(void Function(RefreshResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshResponseBuilder toBuilder() => RefreshResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshResponse &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshResponse')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class RefreshResponseBuilder
    implements Builder<RefreshResponse, RefreshResponseBuilder> {
  _$RefreshResponse? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  RefreshResponseBuilder() {
    RefreshResponse._defaults(this);
  }

  RefreshResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshResponse other) {
    _$v = other as _$RefreshResponse;
  }

  @override
  void update(void Function(RefreshResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshResponse build() => _build();

  _$RefreshResponse _build() {
    final _$result = _$v ??
        _$RefreshResponse._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'RefreshResponse', 'accessToken'),
          refreshToken: refreshToken,
          tokenType: tokenType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
