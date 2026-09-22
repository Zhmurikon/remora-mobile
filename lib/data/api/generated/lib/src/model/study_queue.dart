//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_mode.dart';
import 'package:remora_api/src/model/learn_question_type.dart';
import 'package:remora_api/src/model/queue_item.dart';
import 'package:remora_api/src/model/learn_typing_check.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/strictness.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'study_queue.g.dart';

/// Всё, что нужно тренировке на одну сессию, одним запросом.  Языки сторон и строгость лежат здесь, а не запрашиваются отдельно: без них клиент не может проверить ответ теми же правилами, что и сервер.
///
/// Properties:
/// * [answerStrictness] 
/// * [dueTotal] 
/// * [generatedAt] 
/// * [items] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [learnMatchPercent] 
/// * [learnQuestionTypes] 
/// * [learnSuccessesRequired] 
/// * [learnTypingCheck] 
/// * [mode] 
/// * [newLeftToday] 
/// * [newTotal] 
/// * [reviewsLeftToday] 
/// * [schedulerVersion] 
/// * [setId] 
/// * [setTitle] 
@BuiltValue()
abstract class StudyQueue implements Built<StudyQueue, StudyQueueBuilder> {
  @BuiltValueField(wireName: r'answer_strictness')
  Strictness get answerStrictness;
  // enum answerStrictnessEnum {  strict,  moderate,  lenient,  };

  @BuiltValueField(wireName: r'due_total')
  int get dueTotal;

  @BuiltValueField(wireName: r'generated_at')
  DateTime get generatedAt;

  @BuiltValueField(wireName: r'items')
  BuiltList<QueueItem> get items;

  @BuiltValueField(wireName: r'lang_definition')
  String get langDefinition;

  @BuiltValueField(wireName: r'lang_term')
  String get langTerm;

  @BuiltValueField(wireName: r'learn_match_percent')
  int get learnMatchPercent;

  @BuiltValueField(wireName: r'learn_question_types')
  BuiltList<LearnQuestionType> get learnQuestionTypes;

  @BuiltValueField(wireName: r'learn_successes_required')
  int get learnSuccessesRequired;

  @BuiltValueField(wireName: r'learn_typing_check')
  LearnTypingCheck get learnTypingCheck;
  // enum learnTypingCheckEnum {  automatic,  self_check,  };

  @BuiltValueField(wireName: r'mode')
  StudyMode get mode;
  // enum modeEnum {  flashcards,  learn,  test,  write,  listen,  };

  @BuiltValueField(wireName: r'new_left_today')
  int get newLeftToday;

  @BuiltValueField(wireName: r'new_total')
  int get newTotal;

  @BuiltValueField(wireName: r'reviews_left_today')
  int get reviewsLeftToday;

  @BuiltValueField(wireName: r'scheduler_version')
  String get schedulerVersion;

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  @BuiltValueField(wireName: r'set_title')
  String get setTitle;

  StudyQueue._();

  factory StudyQueue([void updates(StudyQueueBuilder b)]) = _$StudyQueue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StudyQueueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StudyQueue> get serializer => _$StudyQueueSerializer();
}

class _$StudyQueueSerializer implements PrimitiveSerializer<StudyQueue> {
  @override
  final Iterable<Type> types = const [StudyQueue, _$StudyQueue];

  @override
  final String wireName = r'StudyQueue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StudyQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'answer_strictness';
    yield serializers.serialize(
      object.answerStrictness,
      specifiedType: const FullType(Strictness),
    );
    yield r'due_total';
    yield serializers.serialize(
      object.dueTotal,
      specifiedType: const FullType(int),
    );
    yield r'generated_at';
    yield serializers.serialize(
      object.generatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(QueueItem)]),
    );
    yield r'lang_definition';
    yield serializers.serialize(
      object.langDefinition,
      specifiedType: const FullType(String),
    );
    yield r'lang_term';
    yield serializers.serialize(
      object.langTerm,
      specifiedType: const FullType(String),
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
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(StudyMode),
    );
    yield r'new_left_today';
    yield serializers.serialize(
      object.newLeftToday,
      specifiedType: const FullType(int),
    );
    yield r'new_total';
    yield serializers.serialize(
      object.newTotal,
      specifiedType: const FullType(int),
    );
    yield r'reviews_left_today';
    yield serializers.serialize(
      object.reviewsLeftToday,
      specifiedType: const FullType(int),
    );
    yield r'scheduler_version';
    yield serializers.serialize(
      object.schedulerVersion,
      specifiedType: const FullType(String),
    );
    yield r'set_id';
    yield serializers.serialize(
      object.setId,
      specifiedType: const FullType(String),
    );
    yield r'set_title';
    yield serializers.serialize(
      object.setTitle,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StudyQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StudyQueueBuilder result,
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
        case r'due_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dueTotal = valueDes;
          break;
        case r'generated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.generatedAt = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(QueueItem)]),
          ) as BuiltList<QueueItem>;
          result.items.replace(valueDes);
          break;
        case r'lang_definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langDefinition = valueDes;
          break;
        case r'lang_term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langTerm = valueDes;
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
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyMode),
          ) as StudyMode;
          result.mode = valueDes;
          break;
        case r'new_left_today':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newLeftToday = valueDes;
          break;
        case r'new_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newTotal = valueDes;
          break;
        case r'reviews_left_today':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reviewsLeftToday = valueDes;
          break;
        case r'scheduler_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.schedulerVersion = valueDes;
          break;
        case r'set_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.setId = valueDes;
          break;
        case r'set_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.setTitle = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StudyQueue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StudyQueueBuilder();
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


