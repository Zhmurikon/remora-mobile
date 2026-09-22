//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_direction.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'speak_request.g.dart';

/// SpeakRequest
///
/// Properties:
/// * [cardId] 
/// * [direction] 
/// * [side] 
/// * [speed] 
/// * [voice] 
@BuiltValue()
abstract class SpeakRequest implements Built<SpeakRequest, SpeakRequestBuilder> {
  @BuiltValueField(wireName: r'card_id')
  String get cardId;

  @BuiltValueField(wireName: r'direction')
  StudyDirection? get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  };

  @BuiltValueField(wireName: r'side')
  String? get side;

  @BuiltValueField(wireName: r'speed')
  num? get speed;

  @BuiltValueField(wireName: r'voice')
  String? get voice;

  SpeakRequest._();

  factory SpeakRequest([void updates(SpeakRequestBuilder b)]) = _$SpeakRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SpeakRequestBuilder b) => b
      ..direction = StudyDirection.termToDef
      ..side = 'question'
      ..speed = 1.0;

  @BuiltValueSerializer(custom: true)
  static Serializer<SpeakRequest> get serializer => _$SpeakRequestSerializer();
}

class _$SpeakRequestSerializer implements PrimitiveSerializer<SpeakRequest> {
  @override
  final Iterable<Type> types = const [SpeakRequest, _$SpeakRequest];

  @override
  final String wireName = r'SpeakRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SpeakRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'card_id';
    yield serializers.serialize(
      object.cardId,
      specifiedType: const FullType(String),
    );
    if (object.direction != null) {
      yield r'direction';
      yield serializers.serialize(
        object.direction,
        specifiedType: const FullType(StudyDirection),
      );
    }
    if (object.side != null) {
      yield r'side';
      yield serializers.serialize(
        object.side,
        specifiedType: const FullType(String),
      );
    }
    if (object.speed != null) {
      yield r'speed';
      yield serializers.serialize(
        object.speed,
        specifiedType: const FullType(num),
      );
    }
    if (object.voice != null) {
      yield r'voice';
      yield serializers.serialize(
        object.voice,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SpeakRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SpeakRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'card_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cardId = valueDes;
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(StudyDirection),
          ) as StudyDirection?;
          if (valueDes == null) continue;
          result.direction = valueDes;
          break;
        case r'side':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.side = valueDes;
          break;
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.speed = valueDes;
          break;
        case r'voice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.voice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SpeakRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpeakRequestBuilder();
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


