//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'strictness.g.dart';

class Strictness extends EnumClass {

  @BuiltValueEnumConst(wireName: r'strict')
  static const Strictness strict = _$strict;
  @BuiltValueEnumConst(wireName: r'moderate')
  static const Strictness moderate = _$moderate;
  @BuiltValueEnumConst(wireName: r'lenient')
  static const Strictness lenient = _$lenient;

  static Serializer<Strictness> get serializer => _$strictnessSerializer;

  const Strictness._(String name): super(name);

  static BuiltSet<Strictness> get values => _$values;
  static Strictness valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class StrictnessMixin = Object with _$StrictnessMixin;

