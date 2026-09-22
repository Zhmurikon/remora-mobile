//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/agent_section_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_course_update.g.dart';

/// AgentCourseUpdate
///
/// Properties:
/// * [description] 
/// * [revision] 
/// * [sections] 
/// * [title] 
@BuiltValue()
abstract class AgentCourseUpdate implements Built<AgentCourseUpdate, AgentCourseUpdateBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'revision')
  String get revision;

  @BuiltValueField(wireName: r'sections')
  BuiltList<AgentSectionWrite>? get sections;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentCourseUpdate._();

  factory AgentCourseUpdate([void updates(AgentCourseUpdateBuilder b)]) = _$AgentCourseUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentCourseUpdateBuilder b) => b
      ..description = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentCourseUpdate> get serializer => _$AgentCourseUpdateSerializer();
}

class _$AgentCourseUpdateSerializer implements PrimitiveSerializer<AgentCourseUpdate> {
  @override
  final Iterable<Type> types = const [AgentCourseUpdate, _$AgentCourseUpdate];

  @override
  final String wireName = r'AgentCourseUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentCourseUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'revision';
    yield serializers.serialize(
      object.revision,
      specifiedType: const FullType(String),
    );
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
    AgentCourseUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentCourseUpdateBuilder result,
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
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
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
  AgentCourseUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentCourseUpdateBuilder();
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


