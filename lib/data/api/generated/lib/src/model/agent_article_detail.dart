//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/agent_set_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_article_detail.g.dart';

/// AgentArticleDetail
///
/// Properties:
/// * [body] 
/// * [id] 
/// * [material] 
/// * [position] 
/// * [title] 
@BuiltValue()
abstract class AgentArticleDetail implements Built<AgentArticleDetail, AgentArticleDetailBuilder> {
  @BuiltValueField(wireName: r'body')
  String get body;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'material')
  AgentSetDetail get material;

  @BuiltValueField(wireName: r'position')
  int get position;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentArticleDetail._();

  factory AgentArticleDetail([void updates(AgentArticleDetailBuilder b)]) = _$AgentArticleDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentArticleDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentArticleDetail> get serializer => _$AgentArticleDetailSerializer();
}

class _$AgentArticleDetailSerializer implements PrimitiveSerializer<AgentArticleDetail> {
  @override
  final Iterable<Type> types = const [AgentArticleDetail, _$AgentArticleDetail];

  @override
  final String wireName = r'AgentArticleDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentArticleDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'material';
    yield serializers.serialize(
      object.material,
      specifiedType: const FullType(AgentSetDetail),
    );
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(int),
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
    AgentArticleDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentArticleDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'material':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AgentSetDetail),
          ) as AgentSetDetail;
          result.material.replace(valueDes);
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.position = valueDes;
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
  AgentArticleDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentArticleDetailBuilder();
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


