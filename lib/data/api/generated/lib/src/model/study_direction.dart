//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'study_direction.g.dart';

/// Направление изучения. Состояния FSRS по направлениям раздельные.
class StudyDirection extends EnumClass {

  @BuiltValueEnumConst(wireName: r'term_to_def')
  static const StudyDirection termToDef = _$termToDef;
  @BuiltValueEnumConst(wireName: r'def_to_term')
  static const StudyDirection defToTerm = _$defToTerm;

  static Serializer<StudyDirection> get serializer => _$studyDirectionSerializer;

  const StudyDirection._(String name): super(name);

  static BuiltSet<StudyDirection> get values => _$values;
  static StudyDirection valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class StudyDirectionMixin = Object with _$StudyDirectionMixin;

