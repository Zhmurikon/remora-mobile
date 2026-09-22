//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'answer_verdict.g.dart';

class AnswerVerdict extends EnumClass {

  @BuiltValueEnumConst(wireName: r'correct')
  static const AnswerVerdict correct = _$correct;
  @BuiltValueEnumConst(wireName: r'typo')
  static const AnswerVerdict typo = _$typo;
  @BuiltValueEnumConst(wireName: r'incorrect')
  static const AnswerVerdict incorrect = _$incorrect;

  static Serializer<AnswerVerdict> get serializer => _$answerVerdictSerializer;

  const AnswerVerdict._(String name): super(name);

  static BuiltSet<AnswerVerdict> get values => _$values;
  static AnswerVerdict valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AnswerVerdictMixin = Object with _$AnswerVerdictMixin;

