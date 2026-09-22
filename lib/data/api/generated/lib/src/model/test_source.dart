//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_source.g.dart';

/// Из каких карточек собирать тест.
class TestSource extends EnumClass {

  @BuiltValueEnumConst(wireName: r'all')
  static const TestSource all = _$all;
  @BuiltValueEnumConst(wireName: r'hard')
  static const TestSource hard = _$hard;
  @BuiltValueEnumConst(wireName: r'new')
  static const TestSource new_ = _$new_;

  static Serializer<TestSource> get serializer => _$testSourceSerializer;

  const TestSource._(String name): super(name);

  static BuiltSet<TestSource> get values => _$values;
  static TestSource valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class TestSourceMixin = Object with _$TestSourceMixin;

