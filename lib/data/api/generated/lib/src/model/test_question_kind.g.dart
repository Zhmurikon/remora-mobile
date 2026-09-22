// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_question_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TestQuestionKind _$choice = const TestQuestionKind._('choice');
const TestQuestionKind _$trueFalse = const TestQuestionKind._('trueFalse');
const TestQuestionKind _$typing = const TestQuestionKind._('typing');
const TestQuestionKind _$matching = const TestQuestionKind._('matching');

TestQuestionKind _$valueOf(String name) {
  switch (name) {
    case 'choice':
      return _$choice;
    case 'trueFalse':
      return _$trueFalse;
    case 'typing':
      return _$typing;
    case 'matching':
      return _$matching;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TestQuestionKind> _$values =
    BuiltSet<TestQuestionKind>(const <TestQuestionKind>[
  _$choice,
  _$trueFalse,
  _$typing,
  _$matching,
]);

class _$TestQuestionKindMeta {
  const _$TestQuestionKindMeta();
  TestQuestionKind get choice => _$choice;
  TestQuestionKind get trueFalse => _$trueFalse;
  TestQuestionKind get typing => _$typing;
  TestQuestionKind get matching => _$matching;
  TestQuestionKind valueOf(String name) => _$valueOf(name);
  BuiltSet<TestQuestionKind> get values => _$values;
}

abstract class _$TestQuestionKindMixin {
  // ignore: non_constant_identifier_names
  _$TestQuestionKindMeta get TestQuestionKind => const _$TestQuestionKindMeta();
}

Serializer<TestQuestionKind> _$testQuestionKindSerializer =
    _$TestQuestionKindSerializer();

class _$TestQuestionKindSerializer
    implements PrimitiveSerializer<TestQuestionKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'choice': 'choice',
    'trueFalse': 'true_false',
    'typing': 'typing',
    'matching': 'matching',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'choice': 'choice',
    'true_false': 'trueFalse',
    'typing': 'typing',
    'matching': 'matching',
  };

  @override
  final Iterable<Type> types = const <Type>[TestQuestionKind];
  @override
  final String wireName = 'TestQuestionKind';

  @override
  Object serialize(Serializers serializers, TestQuestionKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TestQuestionKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TestQuestionKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
