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

part 'study_settings_out.g.dart';

/// StudySettingsOut
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
abstract class StudySettingsOut implements Built<StudySettingsOut, StudySettingsOutBuilder> {
  @BuiltValueField(wireName: r'answer_strictness')
  Strictness get answerStrictness;
  // enum answerStrictnessEnum {  strict,  moderate,  lenient,  };

  @BuiltValueField(wireName: r'daily_goal_cards')
  int get dailyGoalCards;

  @BuiltValueField(wireName: r'fsrs_desired_retention')
  num get fsrsDesiredRetention;

  @BuiltValueField(wireName: r'fsrs_max_interval_days')
  int get fsrsMaxIntervalDays;

  @BuiltValueField(wireName: r'learn_match_percent')
  int get learnMatchPercent;

  @BuiltValueField(wireName: r'learn_question_types')
  BuiltList<LearnQuestionType> get learnQuestionTypes;

  @BuiltValueField(wireName: r'learn_successes_required')
  int get learnSuccessesRequired;

  @BuiltValueField(wireName: r'learn_typing_check')
  LearnTypingCheck get learnTypingCheck;
  // enum learnTypingCheckEnum {  automatic,  self_check,  };

  @BuiltValueField(wireName: r'new_cards_per_day')
  int get newCardsPerDay;

  @BuiltValueField(wireName: r'reviews_per_day')
  int get reviewsPerDay;

  StudySettingsOut._();

  factory StudySettingsOut([void updates(StudySettingsOutBuilder b)]) = _$StudySettingsOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StudySettingsOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StudySettingsOut> get serializer => _$StudySettingsOutSerializer();
}

class _$StudySettingsOutSerializer implements PrimitiveSerializer<StudySettingsOut> {
  @override
  final Iterable<Type> types = const [StudySettingsOut, _$StudySettingsOut];

  @override
  final String wireName = r'StudySettingsOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StudySettingsOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'answer_strictness';
    yield serializers.serialize(
      object.answerStrictness,
      specifiedType: const FullType(Strictness),
    );
    yield r'daily_goal_cards';
    yield serializers.serialize(
      object.dailyGoalCards,
      specifiedType: const FullType(int),
    );
    yield r'fsrs_desired_retention';
    yield serializers.serialize(
      object.fsrsDesiredRetention,
      specifiedType: const FullType(num),
    );
    yield r'fsrs_max_interval_days';
    yield serializers.serialize(
      object.fsrsMaxIntervalDays,
      specifiedType: const FullType(int),
    );
    yield r'learn_match_percent';
    yield serializers.serialize(
      object.learnMatchPercent,
      specifiedType: const FullType(int),
    );
    yield r'learn_question_types';
    yield serializers.serialize(
      object.learnQuestionTypes,
      specifiedType: const FullType(BuiltList, [FullType(LearnQuestionType)]),
    );
    yield r'learn_successes_required';
    yield serializers.serialize(
      object.learnSuccessesRequired,
      specifiedType: const FullType(int),
    );
    yield r'learn_typing_check';
    yield serializers.serialize(
      object.learnTypingCheck,
      specifiedType: const FullType(LearnTypingCheck),
    );
    yield r'new_cards_per_day';
    yield serializers.serialize(
      object.newCardsPerDay,
      specifiedType: const FullType(int),
    );
    yield r'reviews_per_day';
    yield serializers.serialize(
      object.reviewsPerDay,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StudySettingsOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StudySettingsOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'answer_strictness':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Strictness),
          ) as Strictness;
          result.answerStrictness = valueDes;
          break;
        case r'daily_goal_cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dailyGoalCards = valueDes;
          break;
        case r'fsrs_desired_retention':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.fsrsDesiredRetention = valueDes;
          break;
        case r'fsrs_max_interval_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fsrsMaxIntervalDays = valueDes;
          break;
        case r'learn_match_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.learnMatchPercent = valueDes;
          break;
        case r'learn_question_types':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(LearnQuestionType)]),
          ) as BuiltList<LearnQuestionType>;
          result.learnQuestionTypes.replace(valueDes);
          break;
        case r'learn_successes_required':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.learnSuccessesRequired = valueDes;
          break;
        case r'learn_typing_check':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LearnTypingCheck),
          ) as LearnTypingCheck;
          result.learnTypingCheck = valueDes;
          break;
        case r'new_cards_per_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newCardsPerDay = valueDes;
          break;
        case r'reviews_per_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
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
  StudySettingsOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StudySettingsOutBuilder();
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


