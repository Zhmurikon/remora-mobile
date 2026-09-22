// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_created.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiTokenCreated extends ApiTokenCreated {
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  final String id;
  @override
  final DateTime? lastUsedAt;
  @override
  final String name;
  @override
  final String prefix;
  @override
  final DateTime? revokedAt;
  @override
  final BuiltList<String> scopes;
  @override
  final String token;

  factory _$ApiTokenCreated([void Function(ApiTokenCreatedBuilder)? updates]) =>
      (ApiTokenCreatedBuilder()..update(updates))._build();

  _$ApiTokenCreated._(
      {required this.createdAt,
      required this.expiresAt,
      required this.id,
      this.lastUsedAt,
      required this.name,
      required this.prefix,
      this.revokedAt,
      required this.scopes,
      required this.token})
      : super._();
  @override
  ApiTokenCreated rebuild(void Function(ApiTokenCreatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiTokenCreatedBuilder toBuilder() => ApiTokenCreatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiTokenCreated &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        id == other.id &&
        lastUsedAt == other.lastUsedAt &&
        name == other.name &&
        prefix == other.prefix &&
        revokedAt == other.revokedAt &&
        scopes == other.scopes &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, lastUsedAt.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, prefix.hashCode);
    _$hash = $jc(_$hash, revokedAt.hashCode);
    _$hash = $jc(_$hash, scopes.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiTokenCreated')
          ..add('createdAt', createdAt)
          ..add('expiresAt', expiresAt)
          ..add('id', id)
          ..add('lastUsedAt', lastUsedAt)
          ..add('name', name)
          ..add('prefix', prefix)
          ..add('revokedAt', revokedAt)
          ..add('scopes', scopes)
          ..add('token', token))
        .toString();
  }
}

class ApiTokenCreatedBuilder
    implements Builder<ApiTokenCreated, ApiTokenCreatedBuilder> {
  _$ApiTokenCreated? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _lastUsedAt;
  DateTime? get lastUsedAt => _$this._lastUsedAt;
  set lastUsedAt(DateTime? lastUsedAt) => _$this._lastUsedAt = lastUsedAt;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _prefix;
  String? get prefix => _$this._prefix;
  set prefix(String? prefix) => _$this._prefix = prefix;

  DateTime? _revokedAt;
  DateTime? get revokedAt => _$this._revokedAt;
  set revokedAt(DateTime? revokedAt) => _$this._revokedAt = revokedAt;

  ListBuilder<String>? _scopes;
  ListBuilder<String> get scopes => _$this._scopes ??= ListBuilder<String>();
  set scopes(ListBuilder<String>? scopes) => _$this._scopes = scopes;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  ApiTokenCreatedBuilder() {
    ApiTokenCreated._defaults(this);
  }

  ApiTokenCreatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _expiresAt = $v.expiresAt;
      _id = $v.id;
      _lastUsedAt = $v.lastUsedAt;
      _name = $v.name;
      _prefix = $v.prefix;
      _revokedAt = $v.revokedAt;
      _scopes = $v.scopes.toBuilder();
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiTokenCreated other) {
    _$v = other as _$ApiTokenCreated;
  }

  @override
  void update(void Function(ApiTokenCreatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiTokenCreated build() => _build();

  _$ApiTokenCreated _build() {
    _$ApiTokenCreated _$result;
    try {
      _$result = _$v ??
          _$ApiTokenCreated._(
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ApiTokenCreated', 'createdAt'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'ApiTokenCreated', 'expiresAt'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ApiTokenCreated', 'id'),
            lastUsedAt: lastUsedAt,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ApiTokenCreated', 'name'),
            prefix: BuiltValueNullFieldError.checkNotNull(
                prefix, r'ApiTokenCreated', 'prefix'),
            revokedAt: revokedAt,
            scopes: scopes.build(),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'ApiTokenCreated', 'token'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scopes';
        scopes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiTokenCreated', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
