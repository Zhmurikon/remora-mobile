// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DirectionMode _$termToDef = const DirectionMode._('termToDef');
const DirectionMode _$defToTerm = const DirectionMode._('defToTerm');
const DirectionMode _$both = const DirectionMode._('both');

DirectionMode _$valueOf(String name) {
  switch (name) {
    case 'termToDef':
      return _$termToDef;
    case 'defToTerm':
      return _$defToTerm;
    case 'both':
      return _$both;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DirectionMode> _$values =
    BuiltSet<DirectionMode>(const <DirectionMode>[
  _$termToDef,
  _$defToTerm,
  _$both,
]);

class _$DirectionModeMeta {
  const _$DirectionModeMeta();
  DirectionMode get termToDef => _$termToDef;
  DirectionMode get defToTerm => _$defToTerm;
  DirectionMode get both => _$both;
  DirectionMode valueOf(String name) => _$valueOf(name);
  BuiltSet<DirectionMode> get values => _$values;
}

abstract class _$DirectionModeMixin {
  // ignore: non_constant_identifier_names
  _$DirectionModeMeta get DirectionMode => const _$DirectionModeMeta();
}

Serializer<DirectionMode> _$directionModeSerializer =
    _$DirectionModeSerializer();

class _$DirectionModeSerializer implements PrimitiveSerializer<DirectionMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'termToDef': 'term_to_def',
    'defToTerm': 'def_to_term',
    'both': 'both',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'term_to_def': 'termToDef',
    'def_to_term': 'defToTerm',
    'both': 'both',
  };

  @override
  final Iterable<Type> types = const <Type>[DirectionMode];
  @override
  final String wireName = 'DirectionMode';

  @override
  Object serialize(Serializers serializers, DirectionMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DirectionMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DirectionMode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
