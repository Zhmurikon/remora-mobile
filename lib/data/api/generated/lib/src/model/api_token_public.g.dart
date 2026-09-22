// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiTokenPublic extends ApiTokenPublic {
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

  factory _$ApiTokenPublic([void Function(ApiTokenPublicBuilder)? updates]) =>
      (ApiTokenPublicBuilder()..update(updates))._build();

  _$ApiTokenPublic._(
      {required this.createdAt,
      required this.expiresAt,
      required this.id,
      this.lastUsedAt,
      required this.name,
      required this.prefix,
      this.revokedAt,
      required this.scopes})
      : super._();
  @override
  ApiTokenPublic rebuild(void Function(ApiTokenPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiTokenPublicBuilder toBuilder() => ApiTokenPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiTokenPublic &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        id == other.id &&
        lastUsedAt == other.lastUsedAt &&
        name == other.name &&
        prefix == other.prefix &&
        revokedAt == other.revokedAt &&
        scopes == other.scopes;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiTokenPublic')
          ..add('createdAt', createdAt)
          ..add('expiresAt', expiresAt)
          ..add('id', id)
          ..add('lastUsedAt', lastUsedAt)
          ..add('name', name)
          ..add('prefix', prefix)
          ..add('revokedAt', revokedAt)
          ..add('scopes', scopes))
        .toString();
  }
}

class ApiTokenPublicBuilder
    implements Builder<ApiTokenPublic, ApiTokenPublicBuilder> {
  _$ApiTokenPublic? _$v;

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

  ApiTokenPublicBuilder() {
    ApiTokenPublic._defaults(this);
  }

  ApiTokenPublicBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiTokenPublic other) {
    _$v = other as _$ApiTokenPublic;
  }

  @override
  void update(void Function(ApiTokenPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiTokenPublic build() => _build();

  _$ApiTokenPublic _build() {
    _$ApiTokenPublic _$result;
    try {
      _$result = _$v ??
          _$ApiTokenPublic._(
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ApiTokenPublic', 'createdAt'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'ApiTokenPublic', 'expiresAt'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ApiTokenPublic', 'id'),
            lastUsedAt: lastUsedAt,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ApiTokenPublic', 'name'),
            prefix: BuiltValueNullFieldError.checkNotNull(
                prefix, r'ApiTokenPublic', 'prefix'),
            revokedAt: revokedAt,
            scopes: scopes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scopes';
        scopes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiTokenPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
