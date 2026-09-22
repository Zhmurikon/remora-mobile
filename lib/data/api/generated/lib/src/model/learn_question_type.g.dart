// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_question_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LearnQuestionType _$choice = const LearnQuestionType._('choice');
const LearnQuestionType _$typing = const LearnQuestionType._('typing');
const LearnQuestionType _$recall = const LearnQuestionType._('recall');

LearnQuestionType _$valueOf(String name) {
  switch (name) {
    case 'choice':
      return _$choice;
    case 'typing':
      return _$typing;
    case 'recall':
      return _$recall;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LearnQuestionType> _$values =
    BuiltSet<LearnQuestionType>(const <LearnQuestionType>[
  _$choice,
  _$typing,
  _$recall,
]);

class _$LearnQuestionTypeMeta {
  const _$LearnQuestionTypeMeta();
  LearnQuestionType get choice => _$choice;
  LearnQuestionType get typing => _$typing;
  LearnQuestionType get recall => _$recall;
  LearnQuestionType valueOf(String name) => _$valueOf(name);
  BuiltSet<LearnQuestionType> get values => _$values;
}

abstract class _$LearnQuestionTypeMixin {
  // ignore: non_constant_identifier_names
  _$LearnQuestionTypeMeta get LearnQuestionType =>
      const _$LearnQuestionTypeMeta();
}

Serializer<LearnQuestionType> _$learnQuestionTypeSerializer =
    _$LearnQuestionTypeSerializer();

class _$LearnQuestionTypeSerializer
    implements PrimitiveSerializer<LearnQuestionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'choice': 'choice',
    'typing': 'typing',
    'recall': 'recall',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'choice': 'choice',
    'typing': 'typing',
    'recall': 'recall',
  };

  @override
  final Iterable<Type> types = const <Type>[LearnQuestionType];
  @override
  final String wireName = 'LearnQuestionType';

  @override
  Object serialize(Serializers serializers, LearnQuestionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LearnQuestionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LearnQuestionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
