// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_verdict.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnswerVerdict _$correct = const AnswerVerdict._('correct');
const AnswerVerdict _$typo = const AnswerVerdict._('typo');
const AnswerVerdict _$incorrect = const AnswerVerdict._('incorrect');

AnswerVerdict _$valueOf(String name) {
  switch (name) {
    case 'correct':
      return _$correct;
    case 'typo':
      return _$typo;
    case 'incorrect':
      return _$incorrect;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AnswerVerdict> _$values =
    BuiltSet<AnswerVerdict>(const <AnswerVerdict>[
  _$correct,
  _$typo,
  _$incorrect,
]);

class _$AnswerVerdictMeta {
  const _$AnswerVerdictMeta();
  AnswerVerdict get correct => _$correct;
  AnswerVerdict get typo => _$typo;
  AnswerVerdict get incorrect => _$incorrect;
  AnswerVerdict valueOf(String name) => _$valueOf(name);
  BuiltSet<AnswerVerdict> get values => _$values;
}

abstract class _$AnswerVerdictMixin {
  // ignore: non_constant_identifier_names
  _$AnswerVerdictMeta get AnswerVerdict => const _$AnswerVerdictMeta();
}

Serializer<AnswerVerdict> _$answerVerdictSerializer =
    _$AnswerVerdictSerializer();

class _$AnswerVerdictSerializer implements PrimitiveSerializer<AnswerVerdict> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'correct': 'correct',
    'typo': 'typo',
    'incorrect': 'incorrect',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'correct': 'correct',
    'typo': 'typo',
    'incorrect': 'incorrect',
  };

  @override
  final Iterable<Type> types = const <Type>[AnswerVerdict];
  @override
  final String wireName = 'AnswerVerdict';

  @override
  Object serialize(Serializers serializers, AnswerVerdict object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AnswerVerdict deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnswerVerdict.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
