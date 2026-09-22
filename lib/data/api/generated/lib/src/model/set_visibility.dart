//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_visibility.g.dart';

class SetVisibility extends EnumClass {

  @BuiltValueEnumConst(wireName: r'private')
  static const SetVisibility private = _$private;
  @BuiltValueEnumConst(wireName: r'unlisted')
  static const SetVisibility unlisted = _$unlisted;
  @BuiltValueEnumConst(wireName: r'public')
  static const SetVisibility public = _$public;

  static Serializer<SetVisibility> get serializer => _$setVisibilitySerializer;

  const SetVisibility._(String name): super(name);

  static BuiltSet<SetVisibility> get values => _$values;
  static SetVisibility valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SetVisibilityMixin = Object with _$SetVisibilityMixin;

