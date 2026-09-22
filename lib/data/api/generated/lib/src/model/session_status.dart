//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_status.g.dart';

class SessionStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'active')
  static const SessionStatus active = _$active;
  @BuiltValueEnumConst(wireName: r'finished')
  static const SessionStatus finished = _$finished;
  @BuiltValueEnumConst(wireName: r'abandoned')
  static const SessionStatus abandoned = _$abandoned;

  static Serializer<SessionStatus> get serializer => _$sessionStatusSerializer;

  const SessionStatus._(String name): super(name);

  static BuiltSet<SessionStatus> get values => _$values;
  static SessionStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SessionStatusMixin = Object with _$SessionStatusMixin;

