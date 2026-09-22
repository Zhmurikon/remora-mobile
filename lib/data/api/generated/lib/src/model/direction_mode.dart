//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'direction_mode.g.dart';

/// Направление тренировки. `both` разворачивается в два состояния на карточку.
class DirectionMode extends EnumClass {

  @BuiltValueEnumConst(wireName: r'term_to_def')
  static const DirectionMode termToDef = _$termToDef;
  @BuiltValueEnumConst(wireName: r'def_to_term')
  static const DirectionMode defToTerm = _$defToTerm;
  @BuiltValueEnumConst(wireName: r'both')
  static const DirectionMode both = _$both;

  static Serializer<DirectionMode> get serializer => _$directionModeSerializer;

  const DirectionMode._(String name): super(name);

  static BuiltSet<DirectionMode> get values => _$values;
  static DirectionMode valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DirectionModeMixin = Object with _$DirectionModeMixin;

