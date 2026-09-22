//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/test_question_kind.dart';
import 'package:remora_api/src/model/test_source.dart';
import 'package:remora_api/src/model/direction_mode.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_config.g.dart';

/// TestConfig
///
/// Properties:
/// * [direction] 
/// * [kinds] 
/// * [questionCount] 
/// * [source_] 
/// * [writeToSchedule] 
@BuiltValue()
abstract class TestConfig implements Built<TestConfig, TestConfigBuilder> {
  @BuiltValueField(wireName: r'direction')
  DirectionMode? get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  both,  };

  @BuiltValueField(wireName: r'kinds')
  BuiltList<TestQuestionKind>? get kinds;

  @BuiltValueField(wireName: r'question_count')
  int? get questionCount;

  @BuiltValueField(wireName: r'source')
  TestSource? get source_;
  // enum source_Enum {  all,  hard,  new,  };

  @BuiltValueField(wireName: r'write_to_schedule')
  bool? get writeToSchedule;

  TestConfig._();

  factory TestConfig([void updates(TestConfigBuilder b)]) = _$TestConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestConfigBuilder b) => b
      ..direction = DirectionMode.termToDef
      ..kinds = ListBuilder()
      ..questionCount = 20
      ..source_ = TestSource.all
      ..writeToSchedule = true;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestConfig> get serializer => _$TestConfigSerializer();
}

class _$TestConfigSerializer implements PrimitiveSerializer<TestConfig> {
  @override
  final Iterable<Type> types = const [TestConfig, _$TestConfig];

  @override
  final String wireName = r'TestConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.direction != null) {
      yield r'direction';
      yield serializers.serialize(
        object.direction,
        specifiedType: const FullType(DirectionMode),
      );
    }
    if (object.kinds != null) {
      yield r'kinds';
      yield serializers.serialize(
        object.kinds,
        specifiedType: const FullType(BuiltList, [FullType(TestQuestionKind)]),
      );
    }
    if (object.questionCount != null) {
      yield r'question_count';
      yield serializers.serialize(
        object.questionCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.source_ != null) {
      yield r'source';
      yield serializers.serialize(
        object.source_,
        specifiedType: const FullType(TestSource),
      );
    }
    if (object.writeToSchedule != null) {
      yield r'write_to_schedule';
      yield serializers.serialize(
        object.writeToSchedule,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TestConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DirectionMode),
          ) as DirectionMode?;
          if (valueDes == null) continue;
          result.direction = valueDes;
          break;
        case r'kinds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(TestQuestionKind)]),
          ) as BuiltList<TestQuestionKind>?;
          if (valueDes == null) continue;
          result.kinds.replace(valueDes);
          break;
        case r'question_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.questionCount = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(TestSource),
          ) as TestSource?;
          if (valueDes == null) continue;
          result.source_ = valueDes;
          break;
        case r'write_to_schedule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.writeToSchedule = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestConfigBuilder();
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


