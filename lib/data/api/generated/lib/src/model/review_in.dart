//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_mode.dart';
import 'package:remora_api/src/model/study_direction.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_in.g.dart';

/// Один ответ. `client_review_id` генерирует клиент — он же ключ идемпотентности.
///
/// Properties:
/// * [answerCorrect] 
/// * [cardId] 
/// * [clientReviewId] 
/// * [direction] 
/// * [durationMs] 
/// * [mode] 
/// * [rating] 
/// * [reviewedAt] 
@BuiltValue()
abstract class ReviewIn implements Built<ReviewIn, ReviewInBuilder> {
  @BuiltValueField(wireName: r'answer_correct')
  bool? get answerCorrect;

  @BuiltValueField(wireName: r'card_id')
  String get cardId;

  @BuiltValueField(wireName: r'client_review_id')
  String get clientReviewId;

  @BuiltValueField(wireName: r'direction')
  StudyDirection get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  };

  @BuiltValueField(wireName: r'duration_ms')
  int? get durationMs;

  @BuiltValueField(wireName: r'mode')
  StudyMode get mode;
  // enum modeEnum {  flashcards,  learn,  test,  write,  listen,  };

  @BuiltValueField(wireName: r'rating')
  int get rating;

  @BuiltValueField(wireName: r'reviewed_at')
  DateTime get reviewedAt;

  ReviewIn._();

  factory ReviewIn([void updates(ReviewInBuilder b)]) = _$ReviewIn;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewInBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewIn> get serializer => _$ReviewInSerializer();
}

class _$ReviewInSerializer implements PrimitiveSerializer<ReviewIn> {
  @override
  final Iterable<Type> types = const [ReviewIn, _$ReviewIn];

  @override
  final String wireName = r'ReviewIn';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewIn object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.answerCorrect != null) {
      yield r'answer_correct';
      yield serializers.serialize(
        object.answerCorrect,
        specifiedType: const FullType.nullable(bool),
      );
    }
    yield r'card_id';
    yield serializers.serialize(
      object.cardId,
      specifiedType: const FullType(String),
    );
    yield r'client_review_id';
    yield serializers.serialize(
      object.clientReviewId,
      specifiedType: const FullType(String),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(StudyDirection),
    );
    if (object.durationMs != null) {
      yield r'duration_ms';
      yield serializers.serialize(
        object.durationMs,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(StudyMode),
    );
    yield r'rating';
    yield serializers.serialize(
      object.rating,
      specifiedType: const FullType(int),
    );
    yield r'reviewed_at';
    yield serializers.serialize(
      object.reviewedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewInBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'answer_correct':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.answerCorrect = valueDes;
          break;
        case r'card_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cardId = valueDes;
          break;
        case r'client_review_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientReviewId = valueDes;
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyDirection),
          ) as StudyDirection;
          result.direction = valueDes;
          break;
        case r'duration_ms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationMs = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyMode),
          ) as StudyMode;
          result.mode = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rating = valueDes;
          break;
        case r'reviewed_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.reviewedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewIn deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewInBuilder();
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


