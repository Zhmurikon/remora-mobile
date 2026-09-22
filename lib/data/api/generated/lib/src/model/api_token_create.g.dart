// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ApiTokenCreateScopesEnum _$apiTokenCreateScopesEnum_materialsColonRead =
    const ApiTokenCreateScopesEnum._('materialsColonRead');
const ApiTokenCreateScopesEnum _$apiTokenCreateScopesEnum_materialsColonWrite =
    const ApiTokenCreateScopesEnum._('materialsColonWrite');
const ApiTokenCreateScopesEnum _$apiTokenCreateScopesEnum_coursesColonPublish =
    const ApiTokenCreateScopesEnum._('coursesColonPublish');

ApiTokenCreateScopesEnum _$apiTokenCreateScopesEnumValueOf(String name) {
  switch (name) {
    case 'materialsColonRead':
      return _$apiTokenCreateScopesEnum_materialsColonRead;
    case 'materialsColonWrite':
      return _$apiTokenCreateScopesEnum_materialsColonWrite;
    case 'coursesColonPublish':
      return _$apiTokenCreateScopesEnum_coursesColonPublish;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ApiTokenCreateScopesEnum> _$apiTokenCreateScopesEnumValues =
    BuiltSet<ApiTokenCreateScopesEnum>(const <ApiTokenCreateScopesEnum>[
  _$apiTokenCreateScopesEnum_materialsColonRead,
  _$apiTokenCreateScopesEnum_materialsColonWrite,
  _$apiTokenCreateScopesEnum_coursesColonPublish,
]);

Serializer<ApiTokenCreateScopesEnum> _$apiTokenCreateScopesEnumSerializer =
    _$ApiTokenCreateScopesEnumSerializer();

class _$ApiTokenCreateScopesEnumSerializer
    implements PrimitiveSerializer<ApiTokenCreateScopesEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'materialsColonRead': 'materials:read',
    'materialsColonWrite': 'materials:write',
    'coursesColonPublish': 'courses:publish',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'materials:read': 'materialsColonRead',
    'materials:write': 'materialsColonWrite',
    'courses:publish': 'coursesColonPublish',
  };

  @override
  final Iterable<Type> types = const <Type>[ApiTokenCreateScopesEnum];
  @override
  final String wireName = 'ApiTokenCreateScopesEnum';

  @override
  Object serialize(Serializers serializers, ApiTokenCreateScopesEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ApiTokenCreateScopesEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ApiTokenCreateScopesEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ApiTokenCreate extends ApiTokenCreate {
  @override
  final int? expiresInDays;
  @override
  final String name;
  @override
  final BuiltList<ApiTokenCreateScopesEnum>? scopes;

  factory _$ApiTokenCreate([void Function(ApiTokenCreateBuilder)? updates]) =>
      (ApiTokenCreateBuilder()..update(updates))._build();

  _$ApiTokenCreate._({this.expiresInDays, required this.name, this.scopes})
      : super._();
  @override
  ApiTokenCreate rebuild(void Function(ApiTokenCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiTokenCreateBuilder toBuilder() => ApiTokenCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiTokenCreate &&
        expiresInDays == other.expiresInDays &&
        name == other.name &&
        scopes == other.scopes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expiresInDays.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, scopes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiTokenCreate')
          ..add('expiresInDays', expiresInDays)
          ..add('name', name)
          ..add('scopes', scopes))
        .toString();
  }
}

class ApiTokenCreateBuilder
    implements Builder<ApiTokenCreate, ApiTokenCreateBuilder> {
  _$ApiTokenCreate? _$v;

  int? _expiresInDays;
  int? get expiresInDays => _$this._expiresInDays;
  set expiresInDays(int? expiresInDays) =>
      _$this._expiresInDays = expiresInDays;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<ApiTokenCreateScopesEnum>? _scopes;
  ListBuilder<ApiTokenCreateScopesEnum> get scopes =>
      _$this._scopes ??= ListBuilder<ApiTokenCreateScopesEnum>();
  set scopes(ListBuilder<ApiTokenCreateScopesEnum>? scopes) =>
      _$this._scopes = scopes;

  ApiTokenCreateBuilder() {
    ApiTokenCreate._defaults(this);
  }

  ApiTokenCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expiresInDays = $v.expiresInDays;
      _name = $v.name;
      _scopes = $v.scopes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiTokenCreate other) {
    _$v = other as _$ApiTokenCreate;
  }

  @override
  void update(void Function(ApiTokenCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiTokenCreate build() => _build();

  _$ApiTokenCreate _build() {
    _$ApiTokenCreate _$result;
    try {
      _$result = _$v ??
          _$ApiTokenCreate._(
            expiresInDays: expiresInDays,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ApiTokenCreate', 'name'),
            scopes: _scopes?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scopes';
        _scopes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiTokenCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
