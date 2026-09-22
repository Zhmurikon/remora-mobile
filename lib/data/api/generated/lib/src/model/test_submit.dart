//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/test_answer_in.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_submit.g.dart';

/// TestSubmit
///
/// Properties:
/// * [answers] 
@BuiltValue()
abstract class TestSubmit implements Built<TestSubmit, TestSubmitBuilder> {
  @BuiltValueField(wireName: r'answers')
  BuiltList<TestAnswerIn> get answers;

  TestSubmit._();

  factory TestSubmit([void updates(TestSubmitBuilder b)]) = _$TestSubmit;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestSubmitBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestSubmit> get serializer => _$TestSubmitSerializer();
}

class _$TestSubmitSerializer implements PrimitiveSerializer<TestSubmit> {
  @override
  final Iterable<Type> types = const [TestSubmit, _$TestSubmit];

  @override
  final String wireName = r'TestSubmit';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestSubmit object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'answers';
    yield serializers.serialize(
      object.answers,
      specifiedType: const FullType(BuiltList, [FullType(TestAnswerIn)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TestSubmit object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestSubmitBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'answers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TestAnswerIn)]),
          ) as BuiltList<TestAnswerIn>;
          result.answers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestSubmit deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestSubmitBuilder();
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


