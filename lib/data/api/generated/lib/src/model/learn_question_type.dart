//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'learn_question_type.g.dart';

/// Упражнения, которые можно включить в адаптивном «Заучивании».
class LearnQuestionType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'choice')
  static const LearnQuestionType choice = _$choice;
  @BuiltValueEnumConst(wireName: r'typing')
  static const LearnQuestionType typing = _$typing;
  @BuiltValueEnumConst(wireName: r'recall')
  static const LearnQuestionType recall = _$recall;

  static Serializer<LearnQuestionType> get serializer => _$learnQuestionTypeSerializer;

  const LearnQuestionType._(String name): super(name);

  static BuiltSet<LearnQuestionType> get values => _$values;
  static LearnQuestionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class LearnQuestionTypeMixin = Object with _$LearnQuestionTypeMixin;

