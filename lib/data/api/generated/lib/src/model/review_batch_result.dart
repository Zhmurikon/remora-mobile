//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/card_state_out.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_batch_result.g.dart';

/// ReviewBatchResult
///
/// Properties:
/// * [accepted] 
/// * [duplicates] 
/// * [rejected] 
/// * [states] 
@BuiltValue()
abstract class ReviewBatchResult implements Built<ReviewBatchResult, ReviewBatchResultBuilder> {
  @BuiltValueField(wireName: r'accepted')
  BuiltList<String> get accepted;

  @BuiltValueField(wireName: r'duplicates')
  BuiltList<String> get duplicates;

  @BuiltValueField(wireName: r'rejected')
  BuiltList<String> get rejected;

  @BuiltValueField(wireName: r'states')
  BuiltList<CardStateOut> get states;

  ReviewBatchResult._();

  factory ReviewBatchResult([void updates(ReviewBatchResultBuilder b)]) = _$ReviewBatchResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewBatchResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewBatchResult> get serializer => _$ReviewBatchResultSerializer();
}

class _$ReviewBatchResultSerializer implements PrimitiveSerializer<ReviewBatchResult> {
  @override
  final Iterable<Type> types = const [ReviewBatchResult, _$ReviewBatchResult];

  @override
  final String wireName = r'ReviewBatchResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewBatchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accepted';
    yield serializers.serialize(
      object.accepted,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'duplicates';
    yield serializers.serialize(
      object.duplicates,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'rejected';
    yield serializers.serialize(
      object.rejected,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'states';
    yield serializers.serialize(
      object.states,
      specifiedType: const FullType(BuiltList, [FullType(CardStateOut)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewBatchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewBatchResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accepted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.accepted.replace(valueDes);
          break;
        case r'duplicates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.duplicates.replace(valueDes);
          break;
        case r'rejected':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rejected.replace(valueDes);
          break;
        case r'states':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CardStateOut)]),
          ) as BuiltList<CardStateOut>;
          result.states.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewBatchResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewBatchResultBuilder();
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


