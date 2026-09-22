//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/agent_section_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_course_write.g.dart';

/// AgentCourseWrite
///
/// Properties:
/// * [description] 
/// * [sections] 
/// * [title] 
@BuiltValue()
abstract class AgentCourseWrite implements Built<AgentCourseWrite, AgentCourseWriteBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'sections')
  BuiltList<AgentSectionWrite>? get sections;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentCourseWrite._();

  factory AgentCourseWrite([void updates(AgentCourseWriteBuilder b)]) = _$AgentCourseWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentCourseWriteBuilder b) => b
      ..description = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentCourseWrite> get serializer => _$AgentCourseWriteSerializer();
}

class _$AgentCourseWriteSerializer implements PrimitiveSerializer<AgentCourseWrite> {
  @override
  final Iterable<Type> types = const [AgentCourseWrite, _$AgentCourseWrite];

  @override
  final String wireName = r'AgentCourseWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentCourseWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.sections != null) {
      yield r'sections';
      yield serializers.serialize(
        object.sections,
        specifiedType: const FullType(BuiltList, [FullType(AgentSectionWrite)]),
      );
    }
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AgentCourseWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentCourseWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AgentSectionWrite)]),
          ) as BuiltList<AgentSectionWrite>?;
          if (valueDes == null) continue;
          result.sections.replace(valueDes);
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AgentCourseWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentCourseWriteBuilder();
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


