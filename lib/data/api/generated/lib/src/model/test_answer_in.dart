//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_answer_in.g.dart';

/// TestAnswerIn
///
/// Properties:
/// * [questionId] 
/// * [value] 
/// * [values] 
@BuiltValue()
abstract class TestAnswerIn implements Built<TestAnswerIn, TestAnswerInBuilder> {
  @BuiltValueField(wireName: r'question_id')
  String get questionId;

  @BuiltValueField(wireName: r'value')
  String? get value;

  @BuiltValueField(wireName: r'values')
  BuiltList<String>? get values;

  TestAnswerIn._();

  factory TestAnswerIn([void updates(TestAnswerInBuilder b)]) = _$TestAnswerIn;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestAnswerInBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestAnswerIn> get serializer => _$TestAnswerInSerializer();
}

class _$TestAnswerInSerializer implements PrimitiveSerializer<TestAnswerIn> {
  @override
  final Iterable<Type> types = const [TestAnswerIn, _$TestAnswerIn];

  @override
  final String wireName = r'TestAnswerIn';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestAnswerIn object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'question_id';
    yield serializers.serialize(
      object.questionId,
      specifiedType: const FullType(String),
    );
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.values != null) {
      yield r'values';
      yield serializers.serialize(
        object.values,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TestAnswerIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestAnswerInBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'question_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.questionId = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.value = valueDes;
          break;
        case r'values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.values.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestAnswerIn deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestAnswerInBuilder();
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


