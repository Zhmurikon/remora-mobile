// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SessionStatus _$active = const SessionStatus._('active');
const SessionStatus _$finished = const SessionStatus._('finished');
const SessionStatus _$abandoned = const SessionStatus._('abandoned');

SessionStatus _$valueOf(String name) {
  switch (name) {
    case 'active':
      return _$active;
    case 'finished':
      return _$finished;
    case 'abandoned':
      return _$abandoned;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SessionStatus> _$values =
    BuiltSet<SessionStatus>(const <SessionStatus>[
  _$active,
  _$finished,
  _$abandoned,
]);

class _$SessionStatusMeta {
  const _$SessionStatusMeta();
  SessionStatus get active => _$active;
  SessionStatus get finished => _$finished;
  SessionStatus get abandoned => _$abandoned;
  SessionStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<SessionStatus> get values => _$values;
}

abstract class _$SessionStatusMixin {
  // ignore: non_constant_identifier_names
  _$SessionStatusMeta get SessionStatus => const _$SessionStatusMeta();
}

Serializer<SessionStatus> _$sessionStatusSerializer =
    _$SessionStatusSerializer();

class _$SessionStatusSerializer implements PrimitiveSerializer<SessionStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'active': 'active',
    'finished': 'finished',
    'abandoned': 'abandoned',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'active': 'active',
    'finished': 'finished',
    'abandoned': 'abandoned',
  };

  @override
  final Iterable<Type> types = const <Type>[SessionStatus];
  @override
  final String wireName = 'SessionStatus';

  @override
  Object serialize(Serializers serializers, SessionStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SessionStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SessionStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
