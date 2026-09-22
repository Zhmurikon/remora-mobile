//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/review_in.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_batch.g.dart';

/// ReviewBatch
///
/// Properties:
/// * [reviews] 
/// * [sessionId] 
@BuiltValue()
abstract class ReviewBatch implements Built<ReviewBatch, ReviewBatchBuilder> {
  @BuiltValueField(wireName: r'reviews')
  BuiltList<ReviewIn> get reviews;

  @BuiltValueField(wireName: r'session_id')
  String? get sessionId;

  ReviewBatch._();

  factory ReviewBatch([void updates(ReviewBatchBuilder b)]) = _$ReviewBatch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewBatchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewBatch> get serializer => _$ReviewBatchSerializer();
}

class _$ReviewBatchSerializer implements PrimitiveSerializer<ReviewBatch> {
  @override
  final Iterable<Type> types = const [ReviewBatch, _$ReviewBatch];

  @override
  final String wireName = r'ReviewBatch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewBatch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reviews';
    yield serializers.serialize(
      object.reviews,
      specifiedType: const FullType(BuiltList, [FullType(ReviewIn)]),
    );
    if (object.sessionId != null) {
      yield r'session_id';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewBatch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewBatchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reviews':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReviewIn)]),
          ) as BuiltList<ReviewIn>;
          result.reviews.replace(valueDes);
          break;
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewBatch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewBatchBuilder();
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


