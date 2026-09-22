//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_question_kind.g.dart';

class TestQuestionKind extends EnumClass {

  @BuiltValueEnumConst(wireName: r'choice')
  static const TestQuestionKind choice = _$choice;
  @BuiltValueEnumConst(wireName: r'true_false')
  static const TestQuestionKind trueFalse = _$trueFalse;
  @BuiltValueEnumConst(wireName: r'typing')
  static const TestQuestionKind typing = _$typing;
  @BuiltValueEnumConst(wireName: r'matching')
  static const TestQuestionKind matching = _$matching;

  static Serializer<TestQuestionKind> get serializer => _$testQuestionKindSerializer;

  const TestQuestionKind._(String name): super(name);

  static BuiltSet<TestQuestionKind> get values => _$values;
  static TestQuestionKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TestQuestionKindMixin = Object with _$TestQuestionKindMixin;

