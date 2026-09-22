// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strictness.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Strictness _$strict = const Strictness._('strict');
const Strictness _$moderate = const Strictness._('moderate');
const Strictness _$lenient = const Strictness._('lenient');

Strictness _$valueOf(String name) {
  switch (name) {
    case 'strict':
      return _$strict;
    case 'moderate':
      return _$moderate;
    case 'lenient':
      return _$lenient;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<Strictness> _$values = BuiltSet<Strictness>(const <Strictness>[
  _$strict,
  _$moderate,
  _$lenient,
]);

class _$StrictnessMeta {
  const _$StrictnessMeta();
  Strictness get strict => _$strict;
  Strictness get moderate => _$moderate;
  Strictness get lenient => _$lenient;
  Strictness valueOf(String name) => _$valueOf(name);
  BuiltSet<Strictness> get values => _$values;
}

abstract class _$StrictnessMixin {
  // ignore: non_constant_identifier_names
  _$StrictnessMeta get Strictness => const _$StrictnessMeta();
}

Serializer<Strictness> _$strictnessSerializer = _$StrictnessSerializer();

class _$StrictnessSerializer implements PrimitiveSerializer<Strictness> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'strict': 'strict',
    'moderate': 'moderate',
    'lenient': 'lenient',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'strict': 'strict',
    'moderate': 'moderate',
    'lenient': 'lenient',
  };

  @override
  final Iterable<Type> types = const <Type>[Strictness];
  @override
  final String wireName = 'Strictness';

  @override
  Object serialize(Serializers serializers, Strictness object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  Strictness deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Strictness.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
