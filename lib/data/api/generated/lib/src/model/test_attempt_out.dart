//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/test_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/test_question_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_attempt_out.g.dart';

/// TestAttemptOut
///
/// Properties:
/// * [config] 
/// * [correctCount] 
/// * [createdAt] 
/// * [finishedAt] 
/// * [id] 
/// * [questions] 
/// * [retakeOfId] 
/// * [score] 
/// * [setId] 
/// * [setTitle] 
@BuiltValue()
abstract class TestAttemptOut implements Built<TestAttemptOut, TestAttemptOutBuilder> {
  @BuiltValueField(wireName: r'config')
  TestConfig get config;

  @BuiltValueField(wireName: r'correct_count')
  int get correctCount;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'finished_at')
  DateTime? get finishedAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'questions')
  BuiltList<TestQuestionOut> get questions;

  @BuiltValueField(wireName: r'retake_of_id')
  String? get retakeOfId;

  @BuiltValueField(wireName: r'score')
  num? get score;

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  @BuiltValueField(wireName: r'set_title')
  String get setTitle;

  TestAttemptOut._();

  factory TestAttemptOut([void updates(TestAttemptOutBuilder b)]) = _$TestAttemptOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestAttemptOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestAttemptOut> get serializer => _$TestAttemptOutSerializer();
}

class _$TestAttemptOutSerializer implements PrimitiveSerializer<TestAttemptOut> {
  @override
  final Iterable<Type> types = const [TestAttemptOut, _$TestAttemptOut];

  @override
  final String wireName = r'TestAttemptOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestAttemptOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'config';
    yield serializers.serialize(
      object.config,
      specifiedType: const FullType(TestConfig),
    );
    yield r'correct_count';
    yield serializers.serialize(
      object.correctCount,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'finished_at';
    yield object.finishedAt == null ? null : serializers.serialize(
      object.finishedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'questions';
    yield serializers.serialize(
      object.questions,
      specifiedType: const FullType(BuiltList, [FullType(TestQuestionOut)]),
    );
    if (object.retakeOfId != null) {
      yield r'retake_of_id';
      yield serializers.serialize(
        object.retakeOfId,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'score';
    yield object.score == null ? null : serializers.serialize(
      object.score,
      specifiedType: const FullType.nullable(num),
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
    TestAttemptOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestAttemptOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TestConfig),
          ) as TestConfig;
          result.config.replace(valueDes);
          break;
        case r'correct_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.correctCount = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.finishedAt = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'questions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TestQuestionOut)]),
          ) as BuiltList<TestQuestionOut>;
          result.questions.replace(valueDes);
          break;
        case r'retake_of_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.retakeOfId = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.score = valueDes;
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
  TestAttemptOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestAttemptOutBuilder();
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


