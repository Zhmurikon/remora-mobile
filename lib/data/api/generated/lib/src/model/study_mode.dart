//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'study_mode.g.dart';

class StudyMode extends EnumClass {

  @BuiltValueEnumConst(wireName: r'flashcards')
  static const StudyMode flashcards = _$flashcards;
  @BuiltValueEnumConst(wireName: r'learn')
  static const StudyMode learn = _$learn;
  @BuiltValueEnumConst(wireName: r'test')
  static const StudyMode test = _$test;
  @BuiltValueEnumConst(wireName: r'write')
  static const StudyMode write = _$write;
  @BuiltValueEnumConst(wireName: r'listen')
  static const StudyMode listen = _$listen;

  static Serializer<StudyMode> get serializer => _$studyModeSerializer;

  const StudyMode._(String name): super(name);

  static BuiltSet<StudyMode> get values => _$values;
  static StudyMode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class StudyModeMixin = Object with _$StudyModeMixin;

