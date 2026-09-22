//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_state_kind.g.dart';

/// Состояние карточки. `new` — строка создана, но ответов ещё не было.
class CardStateKind extends EnumClass {

  @BuiltValueEnumConst(wireName: r'new')
  static const CardStateKind new_ = _$new_;
  @BuiltValueEnumConst(wireName: r'learning')
  static const CardStateKind learning = _$learning;
  @BuiltValueEnumConst(wireName: r'review')
  static const CardStateKind review = _$review;
  @BuiltValueEnumConst(wireName: r'relearning')
  static const CardStateKind relearning = _$relearning;

  static Serializer<CardStateKind> get serializer => _$cardStateKindSerializer;

  const CardStateKind._(String name): super(name);

  static BuiltSet<CardStateKind> get values => _$values;
  static CardStateKind valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CardStateKindMixin = Object with _$CardStateKindMixin;

