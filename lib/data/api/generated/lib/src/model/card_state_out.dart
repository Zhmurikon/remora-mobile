//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_direction.dart';
import 'package:remora_api/src/model/card_state_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_state_out.g.dart';

/// CardStateOut
///
/// Properties:
/// * [cardId] 
/// * [difficulty] 
/// * [direction] 
/// * [dueAt] 
/// * [lapses] 
/// * [lastReviewedAt] 
/// * [reps] 
/// * [stability] 
/// * [state] 
/// * [suspendedAt] 
@BuiltValue()
abstract class CardStateOut implements Built<CardStateOut, CardStateOutBuilder> {
  @BuiltValueField(wireName: r'card_id')
  String get cardId;

  @BuiltValueField(wireName: r'difficulty')
  num? get difficulty;

  @BuiltValueField(wireName: r'direction')
  StudyDirection get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  };

  @BuiltValueField(wireName: r'due_at')
  DateTime get dueAt;

  @BuiltValueField(wireName: r'lapses')
  int get lapses;

  @BuiltValueField(wireName: r'last_reviewed_at')
  DateTime? get lastReviewedAt;

  @BuiltValueField(wireName: r'reps')
  int get reps;

  @BuiltValueField(wireName: r'stability')
  num? get stability;

  @BuiltValueField(wireName: r'state')
  CardStateKind get state;
  // enum stateEnum {  new,  learning,  review,  relearning,  };

  @BuiltValueField(wireName: r'suspended_at')
  DateTime? get suspendedAt;

  CardStateOut._();

  factory CardStateOut([void updates(CardStateOutBuilder b)]) = _$CardStateOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CardStateOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CardStateOut> get serializer => _$CardStateOutSerializer();
}

class _$CardStateOutSerializer implements PrimitiveSerializer<CardStateOut> {
  @override
  final Iterable<Type> types = const [CardStateOut, _$CardStateOut];

  @override
  final String wireName = r'CardStateOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CardStateOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'card_id';
    yield serializers.serialize(
      object.cardId,
      specifiedType: const FullType(String),
    );
    yield r'difficulty';
    yield object.difficulty == null ? null : serializers.serialize(
      object.difficulty,
      specifiedType: const FullType.nullable(num),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(StudyDirection),
    );
    yield r'due_at';
    yield serializers.serialize(
      object.dueAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'lapses';
    yield serializers.serialize(
      object.lapses,
      specifiedType: const FullType(int),
    );
    yield r'last_reviewed_at';
    yield object.lastReviewedAt == null ? null : serializers.serialize(
      object.lastReviewedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'reps';
    yield serializers.serialize(
      object.reps,
      specifiedType: const FullType(int),
    );
    yield r'stability';
    yield object.stability == null ? null : serializers.serialize(
      object.stability,
      specifiedType: const FullType.nullable(num),
    );
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(CardStateKind),
    );
    if (object.suspendedAt != null) {
      yield r'suspended_at';
      yield serializers.serialize(
        object.suspendedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CardStateOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CardStateOutBuilder result,
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
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyDirection),
          ) as StudyDirection;
          result.direction = valueDes;
          break;
        case r'due_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.dueAt = valueDes;
          break;
        case r'lapses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.lapses = valueDes;
          break;
        case r'last_reviewed_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastReviewedAt = valueDes;
          break;
        case r'reps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reps = valueDes;
          break;
        case r'stability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.stability = valueDes;
          break;
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CardStateKind),
          ) as CardStateKind;
          result.state = valueDes;
          break;
        case r'suspended_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.suspendedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CardStateOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CardStateOutBuilder();
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


