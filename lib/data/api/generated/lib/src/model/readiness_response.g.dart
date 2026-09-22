// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readiness_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReadinessResponseStatusEnum _$readinessResponseStatusEnum_ok =
    const ReadinessResponseStatusEnum._('ok');
const ReadinessResponseStatusEnum _$readinessResponseStatusEnum_degraded =
    const ReadinessResponseStatusEnum._('degraded');

ReadinessResponseStatusEnum _$readinessResponseStatusEnumValueOf(String name) {
  switch (name) {
    case 'ok':
      return _$readinessResponseStatusEnum_ok;
    case 'degraded':
      return _$readinessResponseStatusEnum_degraded;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReadinessResponseStatusEnum>
    _$readinessResponseStatusEnumValues =
    BuiltSet<ReadinessResponseStatusEnum>(const <ReadinessResponseStatusEnum>[
  _$readinessResponseStatusEnum_ok,
  _$readinessResponseStatusEnum_degraded,
]);

Serializer<ReadinessResponseStatusEnum>
    _$readinessResponseStatusEnumSerializer =
    _$ReadinessResponseStatusEnumSerializer();

class _$ReadinessResponseStatusEnumSerializer
    implements PrimitiveSerializer<ReadinessResponseStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ok': 'ok',
    'degraded': 'degraded',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ok': 'ok',
    'degraded': 'degraded',
  };

  @override
  final Iterable<Type> types = const <Type>[ReadinessResponseStatusEnum];
  @override
  final String wireName = 'ReadinessResponseStatusEnum';

  @override
  Object serialize(Serializers serializers, ReadinessResponseStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReadinessResponseStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReadinessResponseStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ReadinessResponse extends ReadinessResponse {
  @override
  final BuiltMap<String, String> checks;
  @override
  final ReadinessResponseStatusEnum status;

  factory _$ReadinessResponse(
          [void Function(ReadinessResponseBuilder)? updates]) =>
      (ReadinessResponseBuilder()..update(updates))._build();

  _$ReadinessResponse._({required this.checks, required this.status})
      : super._();
  @override
  ReadinessResponse rebuild(void Function(ReadinessResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadinessResponseBuilder toBuilder() =>
      ReadinessResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadinessResponse &&
        checks == other.checks &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, checks.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReadinessResponse')
          ..add('checks', checks)
          ..add('status', status))
        .toString();
  }
}

class ReadinessResponseBuilder
    implements Builder<ReadinessResponse, ReadinessResponseBuilder> {
  _$ReadinessResponse? _$v;

  MapBuilder<String, String>? _checks;
  MapBuilder<String, String> get checks =>
      _$this._checks ??= MapBuilder<String, String>();
  set checks(MapBuilder<String, String>? checks) => _$this._checks = checks;

  ReadinessResponseStatusEnum? _status;
  ReadinessResponseStatusEnum? get status => _$this._status;
  set status(ReadinessResponseStatusEnum? status) => _$this._status = status;

  ReadinessResponseBuilder() {
    ReadinessResponse._defaults(this);
  }

  ReadinessResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _checks = $v.checks.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadinessResponse other) {
    _$v = other as _$ReadinessResponse;
  }

  @override
  void update(void Function(ReadinessResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadinessResponse build() => _build();

  _$ReadinessResponse _build() {
    _$ReadinessResponse _$result;
    try {
      _$result = _$v ??
          _$ReadinessResponse._(
            checks: checks.build(),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ReadinessResponse', 'status'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checks';
        checks.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReadinessResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
