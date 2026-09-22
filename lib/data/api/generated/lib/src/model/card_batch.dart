//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/card_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_batch.g.dart';

/// CardBatch
///
/// Properties:
/// * [cards] 
@BuiltValue()
abstract class CardBatch implements Built<CardBatch, CardBatchBuilder> {
  @BuiltValueField(wireName: r'cards')
  BuiltList<CardWrite> get cards;

  CardBatch._();

  factory CardBatch([void updates(CardBatchBuilder b)]) = _$CardBatch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CardBatchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CardBatch> get serializer => _$CardBatchSerializer();
}

class _$CardBatchSerializer implements PrimitiveSerializer<CardBatch> {
  @override
  final Iterable<Type> types = const [CardBatch, _$CardBatch];

  @override
  final String wireName = r'CardBatch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CardBatch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cards';
    yield serializers.serialize(
      object.cards,
      specifiedType: const FullType(BuiltList, [FullType(CardWrite)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CardBatch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CardBatchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CardWrite)]),
          ) as BuiltList<CardWrite>;
          result.cards.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CardBatch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CardBatchBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}


