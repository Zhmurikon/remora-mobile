//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rating_preview_out.g.dart';

/// Подпись на кнопке самооценки: когда карточка вернётся при такой оценке.
///
/// Properties:
/// * [dueAt] 
/// * [intervalSeconds] 
/// * [rating] 
@BuiltValue()
abstract class RatingPreviewOut implements Built<RatingPreviewOut, RatingPreviewOutBuilder> {
  @BuiltValueField(wireName: r'due_at')
  DateTime get dueAt;

  @BuiltValueField(wireName: r'interval_seconds')
  int get intervalSeconds;

  @BuiltValueField(wireName: r'rating')
  int get rating;

  RatingPreviewOut._();

  factory RatingPreviewOut([void updates(RatingPreviewOutBuilder b)]) = _$RatingPreviewOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RatingPreviewOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RatingPreviewOut> get serializer => _$RatingPreviewOutSerializer();
}

class _$RatingPreviewOutSerializer implements PrimitiveSerializer<RatingPreviewOut> {
  @override
  final Iterable<Type> types = const [RatingPreviewOut, _$RatingPreviewOut];

  @override
  final String wireName = r'RatingPreviewOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RatingPreviewOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'due_at';
    yield serializers.serialize(
      object.dueAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'interval_seconds';
    yield serializers.serialize(
      object.intervalSeconds,
      specifiedType: const FullType(int),
    );
    yield r'rating';
    yield serializers.serialize(
      object.rating,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RatingPreviewOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RatingPreviewOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'due_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.dueAt = valueDes;
          break;
        case r'interval_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.intervalSeconds = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rating = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RatingPreviewOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RatingPreviewOutBuilder();
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


