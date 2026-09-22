//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/agent_article_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_section_write.g.dart';

/// AgentSectionWrite
///
/// Properties:
/// * [articles] 
/// * [id] 
/// * [title] 
@BuiltValue()
abstract class AgentSectionWrite implements Built<AgentSectionWrite, AgentSectionWriteBuilder> {
  @BuiltValueField(wireName: r'articles')
  BuiltList<AgentArticleWrite>? get articles;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentSectionWrite._();

  factory AgentSectionWrite([void updates(AgentSectionWriteBuilder b)]) = _$AgentSectionWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentSectionWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentSectionWrite> get serializer => _$AgentSectionWriteSerializer();
}

class _$AgentSectionWriteSerializer implements PrimitiveSerializer<AgentSectionWrite> {
  @override
  final Iterable<Type> types = const [AgentSectionWrite, _$AgentSectionWrite];

  @override
  final String wireName = r'AgentSectionWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentSectionWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.articles != null) {
      yield r'articles';
      yield serializers.serialize(
        object.articles,
        specifiedType: const FullType(BuiltList, [FullType(AgentArticleWrite)]),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
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
    AgentSectionWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentSectionWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'articles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AgentArticleWrite)]),
          ) as BuiltList<AgentArticleWrite>?;
          if (valueDes == null) continue;
          result.articles.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
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
  AgentSectionWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentSectionWriteBuilder();
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


