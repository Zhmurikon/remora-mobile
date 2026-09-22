//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'queue_scope.g.dart';

/// Что класть в очередь. `due` — режим «Заучивание», остальное — фильтры «Карточек».
class QueueScope extends EnumClass {

  @BuiltValueEnumConst(wireName: r'due')
  static const QueueScope due = _$due;
  @BuiltValueEnumConst(wireName: r'all')
  static const QueueScope all = _$all;
  @BuiltValueEnumConst(wireName: r'hard')
  static const QueueScope hard = _$hard;
  @BuiltValueEnumConst(wireName: r'new')
  static const QueueScope new_ = _$new_;

  static Serializer<QueueScope> get serializer => _$queueScopeSerializer;

  const QueueScope._(String name): super(name);

  static BuiltSet<QueueScope> get values => _$values;
  static QueueScope valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class QueueScopeMixin = Object with _$QueueScopeMixin;

