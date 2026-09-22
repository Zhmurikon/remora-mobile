//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/test_question_review.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_result.g.dart';

/// TestResult
///
/// Properties:
/// * [attemptId] 
/// * [correctCount] 
/// * [finishedAt] 
/// * [review] 
/// * [score] 
/// * [setId] 
/// * [total] 
/// * [wrongCardIds] 
@BuiltValue()
abstract class TestResult implements Built<TestResult, TestResultBuilder> {
  @BuiltValueField(wireName: r'attempt_id')
  String get attemptId;

  @BuiltValueField(wireName: r'correct_count')
  int get correctCount;

  @BuiltValueField(wireName: r'finished_at')
  DateTime get finishedAt;

  @BuiltValueField(wireName: r'review')
  BuiltList<TestQuestionReview> get review;

  @BuiltValueField(wireName: r'score')
  num get score;

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'wrong_card_ids')
  BuiltList<String> get wrongCardIds;

  TestResult._();

  factory TestResult([void updates(TestResultBuilder b)]) = _$TestResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestResult> get serializer => _$TestResultSerializer();
}

class _$TestResultSerializer implements PrimitiveSerializer<TestResult> {
  @override
  final Iterable<Type> types = const [TestResult, _$TestResult];

  @override
  final String wireName = r'TestResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attempt_id';
    yield serializers.serialize(
      object.attemptId,
      specifiedType: const FullType(String),
    );
    yield r'correct_count';
    yield serializers.serialize(
      object.correctCount,
      specifiedType: const FullType(int),
    );
    yield r'finished_at';
    yield serializers.serialize(
      object.finishedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'review';
    yield serializers.serialize(
      object.review,
      specifiedType: const FullType(BuiltList, [FullType(TestQuestionReview)]),
    );
    yield r'score';
    yield serializers.serialize(
      object.score,
      specifiedType: const FullType(num),
    );
    yield r'set_id';
    yield serializers.serialize(
      object.setId,
      specifiedType: const FullType(String),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'wrong_card_ids';
    yield serializers.serialize(
      object.wrongCardIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TestResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attempt_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attemptId = valueDes;
          break;
        case r'correct_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.correctCount = valueDes;
          break;
        case r'finished_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.finishedAt = valueDes;
          break;
        case r'review':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TestQuestionReview)]),
          ) as BuiltList<TestQuestionReview>;
          result.review.replace(valueDes);
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.score = valueDes;
          break;
        case r'set_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.setId = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'wrong_card_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.wrongCardIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestResultBuilder();
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


