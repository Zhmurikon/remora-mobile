//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/agent_set_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_article_write.g.dart';

/// AgentArticleWrite
///
/// Properties:
/// * [body] 
/// * [id] 
/// * [material] 
/// * [title] 
@BuiltValue()
abstract class AgentArticleWrite implements Built<AgentArticleWrite, AgentArticleWriteBuilder> {
  @BuiltValueField(wireName: r'body')
  String? get body;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'material')
  AgentSetWrite get material;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentArticleWrite._();

  factory AgentArticleWrite([void updates(AgentArticleWriteBuilder b)]) = _$AgentArticleWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentArticleWriteBuilder b) => b
      ..body = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentArticleWrite> get serializer => _$AgentArticleWriteSerializer();
}

class _$AgentArticleWriteSerializer implements PrimitiveSerializer<AgentArticleWrite> {
  @override
  final Iterable<Type> types = const [AgentArticleWrite, _$AgentArticleWrite];

  @override
  final String wireName = r'AgentArticleWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentArticleWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'material';
    yield serializers.serialize(
      object.material,
      specifiedType: const FullType(AgentSetWrite),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AgentArticleWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentArticleWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.body = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'material':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AgentSetWrite),
          ) as AgentSetWrite;
          result.material.replace(valueDes);
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
  AgentArticleWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentArticleWriteBuilder();
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


