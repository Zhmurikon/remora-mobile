//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/answer_verdict.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/test_question_out.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_question_review.g.dart';

/// Разбор одного вопроса после проверки.
///
/// Properties:
/// * [correct] 
/// * [expected] 
/// * [expectedValues] 
/// * [given] 
/// * [givenValues] 
/// * [question] 
/// * [verdict] 
@BuiltValue()
abstract class TestQuestionReview implements Built<TestQuestionReview, TestQuestionReviewBuilder> {
  @BuiltValueField(wireName: r'correct')
  bool get correct;

  @BuiltValueField(wireName: r'expected')
  String get expected;

  @BuiltValueField(wireName: r'expected_values')
  BuiltList<String>? get expectedValues;

  @BuiltValueField(wireName: r'given')
  String? get given;

  @BuiltValueField(wireName: r'given_values')
  BuiltList<String>? get givenValues;

  @BuiltValueField(wireName: r'question')
  TestQuestionOut get question;

  @BuiltValueField(wireName: r'verdict')
  AnswerVerdict get verdict;
  // enum verdictEnum {  correct,  typo,  incorrect,  };

  TestQuestionReview._();

  factory TestQuestionReview([void updates(TestQuestionReviewBuilder b)]) = _$TestQuestionReview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestQuestionReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestQuestionReview> get serializer => _$TestQuestionReviewSerializer();
}

class _$TestQuestionReviewSerializer implements PrimitiveSerializer<TestQuestionReview> {
  @override
  final Iterable<Type> types = const [TestQuestionReview, _$TestQuestionReview];

  @override
  final String wireName = r'TestQuestionReview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestQuestionReview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'correct';
    yield serializers.serialize(
      object.correct,
      specifiedType: const FullType(bool),
    );
    yield r'expected';
    yield serializers.serialize(
      object.expected,
      specifiedType: const FullType(String),
    );
    if (object.expectedValues != null) {
      yield r'expected_values';
      yield serializers.serialize(
        object.expectedValues,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    yield r'given';
    yield object.given == null ? null : serializers.serialize(
      object.given,
      specifiedType: const FullType.nullable(String),
    );
    if (object.givenValues != null) {
      yield r'given_values';
      yield serializers.serialize(
        object.givenValues,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    yield r'question';
    yield serializers.serialize(
      object.question,
      specifiedType: const FullType(TestQuestionOut),
    );
    yield r'verdict';
    yield serializers.serialize(
      object.verdict,
      specifiedType: const FullType(AnswerVerdict),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TestQuestionReview object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestQuestionReviewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'correct':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.correct = valueDes;
          break;
        case r'expected':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expected = valueDes;
          break;
        case r'expected_values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.expectedValues.replace(valueDes);
          break;
        case r'given':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.given = valueDes;
          break;
        case r'given_values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.givenValues.replace(valueDes);
          break;
        case r'question':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TestQuestionOut),
          ) as TestQuestionOut;
          result.question.replace(valueDes);
          break;
        case r'verdict':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AnswerVerdict),
          ) as AnswerVerdict;
          result.verdict = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestQuestionReview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestQuestionReviewBuilder();
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


