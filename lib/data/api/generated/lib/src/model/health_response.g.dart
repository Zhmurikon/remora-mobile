// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HealthResponseStatusEnum _$healthResponseStatusEnum_ok =
    const HealthResponseStatusEnum._('ok');

HealthResponseStatusEnum _$healthResponseStatusEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$healthResponseStatusEnum_ok;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HealthResponseStatusEnum> _$healthResponseStatusEnumValues =
    BuiltSet<HealthResponseStatusEnum>(const <HealthResponseStatusEnum>[
  _$healthResponseStatusEnum_ok,
]);

Serializer<HealthResponseStatusEnum> _$healthResponseStatusEnumSerializer =
    _$HealthResponseStatusEnumSerializer();

class _$HealthResponseStatusEnumSerializer
    implements PrimitiveSerializer<HealthResponseStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
  };

  @override
  final Iterable<Type> types = const <Type>[HealthResponseStatusEnum];
  @override
  final String wireName = 'HealthResponseStatusEnum';

  @override
  Object serialize(Serializers serializers, HealthResponseStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HealthResponseStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HealthResponseStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$HealthResponse extends HealthResponse {
  @override
  final String environment;
  @override
  final HealthResponseStatusEnum status;
  @override
  final String version;

  factory _$HealthResponse([void Function(HealthResponseBuilder)? updates]) =>
      (HealthResponseBuilder()..update(updates))._build();

  _$HealthResponse._(
      {required this.environment, required this.status, required this.version})
      : super._();
  @override
  HealthResponse rebuild(void Function(HealthResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthResponseBuilder toBuilder() => HealthResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthResponse &&
        environment == other.environment &&
        status == other.status &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, environment.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthResponse')
          ..add('environment', environment)
          ..add('status', status)
          ..add('version', version))
        .toString();
  }
}

class HealthResponseBuilder
    implements Builder<HealthResponse, HealthResponseBuilder> {
  _$HealthResponse? _$v;

  String? _environment;
  String? get environment => _$this._environment;
  set environment(String? environment) => _$this._environment = environment;

  HealthResponseStatusEnum? _status;
  HealthResponseStatusEnum? get status => _$this._status;
  set status(HealthResponseStatusEnum? status) => _$this._status = status;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  HealthResponseBuilder() {
    HealthResponse._defaults(this);
  }

  HealthResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _environment = $v.environment;
      _status = $v.status;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthResponse other) {
    _$v = other as _$HealthResponse;
  }

  @override
  void update(void Function(HealthResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthResponse build() => _build();

  _$HealthResponse _build() {
    final _$result = _$v ??
        _$HealthResponse._(
          environment: BuiltValueNullFieldError.checkNotNull(
              environment, r'HealthResponse', 'environment'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'HealthResponse', 'status'),
          version: BuiltValueNullFieldError.checkNotNull(
              version, r'HealthResponse', 'version'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
