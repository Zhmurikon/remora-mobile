//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_status.g.dart';

class MediaStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const MediaStatus pending = _$pending;
  @BuiltValueEnumConst(wireName: r'ready')
  static const MediaStatus ready = _$ready;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const MediaStatus rejected = _$rejected;

  static Serializer<MediaStatus> get serializer => _$mediaStatusSerializer;

  const MediaStatus._(String name): super(name);

  static BuiltSet<MediaStatus> get values => _$values;
  static MediaStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class MediaStatusMixin = Object with _$MediaStatusMixin;

