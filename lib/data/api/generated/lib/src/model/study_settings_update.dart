//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/learn_question_type.dart';
import 'package:remora_api/src/model/learn_typing_check.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/strictness.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'study_settings_update.g.dart';

/// StudySettingsUpdate
///
/// Properties:
/// * [answerStrictness] 
/// * [dailyGoalCards] 
/// * [fsrsDesiredRetention] 
/// * [fsrsMaxIntervalDays] 
/// * [learnMatchPercent] 
/// * [learnQuestionTypes] 
/// * [learnSuccessesRequired] 
/// * [learnTypingCheck] 
/// * [newCardsPerDay] 
/// * [reviewsPerDay] 
@BuiltValue()
abstract class StudySettingsUpdate implements Built<StudySettingsUpdate, StudySettingsUpdateBuilder> {
  @BuiltValueField(wireName: r'answer_strictness')
  Strictness? get answerStrictness;
  // enum answerStrictnessEnum {  strict,  moderate,  lenient,  };

  @BuiltValueField(wireName: r'daily_goal_cards')
  int? get dailyGoalCards;

  @BuiltValueField(wireName: r'fsrs_desired_retention')
  num? get fsrsDesiredRetention;

  @BuiltValueField(wireName: r'fsrs_max_interval_days')
  int? get fsrsMaxIntervalDays;

  @BuiltValueField(wireName: r'learn_match_percent')
  int? get learnMatchPercent;

  @BuiltValueField(wireName: r'learn_question_types')
  BuiltList<LearnQuestionType>? get learnQuestionTypes;

  @BuiltValueField(wireName: r'learn_successes_required')
  int? get learnSuccessesRequired;

  @BuiltValueField(wireName: r'learn_typing_check')
  LearnTypingCheck? get learnTypingCheck;
  // enum learnTypingCheckEnum {  automatic,  self_check,  };

  @BuiltValueField(wireName: r'new_cards_per_day')
  int? get newCardsPerDay;

  @BuiltValueField(wireName: r'reviews_per_day')
  int? get reviewsPerDay;

  StudySettingsUpdate._();

  factory StudySettingsUpdate([void updates(StudySettingsUpdateBuilder b)]) = _$StudySettingsUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StudySettingsUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StudySettingsUpdate> get serializer => _$StudySettingsUpdateSerializer();
}

class _$StudySettingsUpdateSerializer implements PrimitiveSerializer<StudySettingsUpdate> {
  @override
  final Iterable<Type> types = const [StudySettingsUpdate, _$StudySettingsUpdate];

  @override
  final String wireName = r'StudySettingsUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StudySettingsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.answerStrictness != null) {
      yield r'answer_strictness';
      yield serializers.serialize(
        object.answerStrictness,
        specifiedType: const FullType.nullable(Strictness),
      );
    }
    if (object.dailyGoalCards != null) {
      yield r'daily_goal_cards';
      yield serializers.serialize(
        object.dailyGoalCards,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.fsrsDesiredRetention != null) {
      yield r'fsrs_desired_retention';
      yield serializers.serialize(
        object.fsrsDesiredRetention,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.fsrsMaxIntervalDays != null) {
      yield r'fsrs_max_interval_days';
      yield serializers.serialize(
        object.fsrsMaxIntervalDays,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.learnMatchPercent != null) {
      yield r'learn_match_percent';
      yield serializers.serialize(
        object.learnMatchPercent,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.learnQuestionTypes != null) {
      yield r'learn_question_types';
      yield serializers.serialize(
        object.learnQuestionTypes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(LearnQuestionType)]),
      );
    }
    if (object.learnSuccessesRequired != null) {
      yield r'learn_successes_required';
      yield serializers.serialize(
        object.learnSuccessesRequired,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.learnTypingCheck != null) {
      yield r'learn_typing_check';
      yield serializers.serialize(
        object.learnTypingCheck,
        specifiedType: const FullType.nullable(LearnTypingCheck),
      );
    }
    if (object.newCardsPerDay != null) {
      yield r'new_cards_per_day';
      yield serializers.serialize(
        object.newCardsPerDay,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.reviewsPerDay != null) {
      yield r'reviews_per_day';
      yield serializers.serialize(
        object.reviewsPerDay,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StudySettingsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StudySettingsUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'answer_strictness':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Strictness),
          ) as Strictness?;
          if (valueDes == null) continue;
          result.answerStrictness = valueDes;
          break;
        case r'daily_goal_cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dailyGoalCards = valueDes;
          break;
        case r'fsrs_desired_retention':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.fsrsDesiredRetention = valueDes;
          break;
        case r'fsrs_max_interval_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.fsrsMaxIntervalDays = valueDes;
          break;
        case r'learn_match_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.learnMatchPercent = valueDes;
          break;
        case r'learn_question_types':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(LearnQuestionType)]),
          ) as BuiltList<LearnQuestionType>?;
          if (valueDes == null) continue;
          result.learnQuestionTypes.replace(valueDes);
          break;
        case r'learn_successes_required':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.learnSuccessesRequired = valueDes;
          break;
        case r'learn_typing_check':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(LearnTypingCheck),
          ) as LearnTypingCheck?;
          if (valueDes == null) continue;
          result.learnTypingCheck = valueDes;
          break;
        case r'new_cards_per_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.newCardsPerDay = valueDes;
          break;
        case r'reviews_per_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.reviewsPerDay = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StudySettingsUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StudySettingsUpdateBuilder();
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


