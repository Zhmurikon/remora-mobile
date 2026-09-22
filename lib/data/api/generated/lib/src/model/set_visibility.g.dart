// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_visibility.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SetVisibility _$private = const SetVisibility._('private');
const SetVisibility _$unlisted = const SetVisibility._('unlisted');
const SetVisibility _$public = const SetVisibility._('public');

SetVisibility _$valueOf(String name) {
  switch (name) {
    case 'private':
      return _$private;
    case 'unlisted':
      return _$unlisted;
    case 'public':
      return _$public;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SetVisibility> _$values =
    BuiltSet<SetVisibility>(const <SetVisibility>[
  _$private,
  _$unlisted,
  _$public,
]);

class _$SetVisibilityMeta {
  const _$SetVisibilityMeta();
  SetVisibility get private => _$private;
  SetVisibility get unlisted => _$unlisted;
  SetVisibility get public => _$public;
  SetVisibility valueOf(String name) => _$valueOf(name);
  BuiltSet<SetVisibility> get values => _$values;
}

abstract class _$SetVisibilityMixin {
  // ignore: non_constant_identifier_names
  _$SetVisibilityMeta get SetVisibility => const _$SetVisibilityMeta();
}

Serializer<SetVisibility> _$setVisibilitySerializer =
    _$SetVisibilitySerializer();

class _$SetVisibilitySerializer implements PrimitiveSerializer<SetVisibility> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'private': 'private',
    'unlisted': 'unlisted',
    'public': 'public',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'private': 'private',
    'unlisted': 'unlisted',
    'public': 'public',
  };

  @override
  final Iterable<Type> types = const <Type>[SetVisibility];
  @override
  final String wireName = 'SetVisibility';

  @override
  Object serialize(Serializers serializers, SetVisibility object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SetVisibility deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SetVisibility.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
