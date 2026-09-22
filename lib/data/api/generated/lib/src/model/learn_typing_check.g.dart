// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_typing_check.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LearnTypingCheck _$automatic = const LearnTypingCheck._('automatic');
const LearnTypingCheck _$selfCheck = const LearnTypingCheck._('selfCheck');

LearnTypingCheck _$valueOf(String name) {
  switch (name) {
    case 'automatic':
      return _$automatic;
    case 'selfCheck':
      return _$selfCheck;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LearnTypingCheck> _$values =
    BuiltSet<LearnTypingCheck>(const <LearnTypingCheck>[
  _$automatic,
  _$selfCheck,
]);

class _$LearnTypingCheckMeta {
  const _$LearnTypingCheckMeta();
  LearnTypingCheck get automatic => _$automatic;
  LearnTypingCheck get selfCheck => _$selfCheck;
  LearnTypingCheck valueOf(String name) => _$valueOf(name);
  BuiltSet<LearnTypingCheck> get values => _$values;
}

abstract class _$LearnTypingCheckMixin {
  // ignore: non_constant_identifier_names
  _$LearnTypingCheckMeta get LearnTypingCheck => const _$LearnTypingCheckMeta();
}

Serializer<LearnTypingCheck> _$learnTypingCheckSerializer =
    _$LearnTypingCheckSerializer();

class _$LearnTypingCheckSerializer
    implements PrimitiveSerializer<LearnTypingCheck> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'automatic': 'automatic',
    'selfCheck': 'self_check',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'automatic': 'automatic',
    'self_check': 'selfCheck',
  };

  @override
  final Iterable<Type> types = const <Type>[LearnTypingCheck];
  @override
  final String wireName = 'LearnTypingCheck';

  @override
  Object serialize(Serializers serializers, LearnTypingCheck object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LearnTypingCheck deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LearnTypingCheck.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
