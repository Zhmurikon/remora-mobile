// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const StudyMode _$flashcards = const StudyMode._('flashcards');
const StudyMode _$learn = const StudyMode._('learn');
const StudyMode _$test = const StudyMode._('test');
const StudyMode _$write = const StudyMode._('write');
const StudyMode _$listen = const StudyMode._('listen');

StudyMode _$valueOf(String name) {
  switch (name) {
    case 'flashcards':
      return _$flashcards;
    case 'learn':
      return _$learn;
    case 'test':
      return _$test;
    case 'write':
      return _$write;
    case 'listen':
      return _$listen;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<StudyMode> _$values = BuiltSet<StudyMode>(const <StudyMode>[
  _$flashcards,
  _$learn,
  _$test,
  _$write,
  _$listen,
]);

class _$StudyModeMeta {
  const _$StudyModeMeta();
  StudyMode get flashcards => _$flashcards;
  StudyMode get learn => _$learn;
  StudyMode get test => _$test;
  StudyMode get write => _$write;
  StudyMode get listen => _$listen;
  StudyMode valueOf(String name) => _$valueOf(name);
  BuiltSet<StudyMode> get values => _$values;
}

abstract class _$StudyModeMixin {
  // ignore: non_constant_identifier_names
  _$StudyModeMeta get StudyMode => const _$StudyModeMeta();
}

Serializer<StudyMode> _$studyModeSerializer = _$StudyModeSerializer();

class _$StudyModeSerializer implements PrimitiveSerializer<StudyMode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'flashcards': 'flashcards',
    'learn': 'learn',
    'test': 'test',
    'write': 'write',
    'listen': 'listen',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'flashcards': 'flashcards',
    'learn': 'learn',
    'test': 'test',
    'write': 'write',
    'listen': 'listen',
  };

  @override
  final Iterable<Type> types = const <Type>[StudyMode];
  @override
  final String wireName = 'StudyMode';

  @override
  Object serialize(Serializers serializers, StudyMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  StudyMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StudyMode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
