//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/card_state_out.dart';
import 'package:remora_api/src/model/queue_card.dart';
import 'package:remora_api/src/model/study_direction.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/rating_preview_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'queue_item.g.dart';

/// QueueItem
///
/// Properties:
/// * [card] 
/// * [direction] 
/// * [previews] 
/// * [state] 
@BuiltValue()
abstract class QueueItem implements Built<QueueItem, QueueItemBuilder> {
  @BuiltValueField(wireName: r'card')
  QueueCard get card;

  @BuiltValueField(wireName: r'direction')
  StudyDirection get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  };

  @BuiltValueField(wireName: r'previews')
  BuiltList<RatingPreviewOut> get previews;

  @BuiltValueField(wireName: r'state')
  CardStateOut get state;

  QueueItem._();

  factory QueueItem([void updates(QueueItemBuilder b)]) = _$QueueItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QueueItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QueueItem> get serializer => _$QueueItemSerializer();
}

class _$QueueItemSerializer implements PrimitiveSerializer<QueueItem> {
  @override
  final Iterable<Type> types = const [QueueItem, _$QueueItem];

  @override
  final String wireName = r'QueueItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QueueItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'card';
    yield serializers.serialize(
      object.card,
      specifiedType: const FullType(QueueCard),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(StudyDirection),
    );
    yield r'previews';
    yield serializers.serialize(
      object.previews,
      specifiedType: const FullType(BuiltList, [FullType(RatingPreviewOut)]),
    );
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(CardStateOut),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    QueueItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QueueItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'card':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(QueueCard),
          ) as QueueCard;
          result.card.replace(valueDes);
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyDirection),
          ) as StudyDirection;
          result.direction = valueDes;
          break;
        case r'previews':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(RatingPreviewOut)]),
          ) as BuiltList<RatingPreviewOut>;
          result.previews.replace(valueDes);
          break;
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CardStateOut),
          ) as CardStateOut;
          result.state.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QueueItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QueueItemBuilder();
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


