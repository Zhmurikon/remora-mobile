//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/card_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_set_write.g.dart';

/// AgentSetWrite
///
/// Properties:
/// * [cards] 
/// * [description] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [title] 
@BuiltValue()
abstract class AgentSetWrite implements Built<AgentSetWrite, AgentSetWriteBuilder> {
  @BuiltValueField(wireName: r'cards')
  BuiltList<CardWrite>? get cards;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'lang_definition')
  String? get langDefinition;

  @BuiltValueField(wireName: r'lang_term')
  String? get langTerm;

  @BuiltValueField(wireName: r'title')
  String get title;

  AgentSetWrite._();

  factory AgentSetWrite([void updates(AgentSetWriteBuilder b)]) = _$AgentSetWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentSetWriteBuilder b) => b
      ..description = ''
      ..langDefinition = 'ru'
      ..langTerm = 'ru';

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentSetWrite> get serializer => _$AgentSetWriteSerializer();
}

class _$AgentSetWriteSerializer implements PrimitiveSerializer<AgentSetWrite> {
  @override
  final Iterable<Type> types = const [AgentSetWrite, _$AgentSetWrite];

  @override
  final String wireName = r'AgentSetWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentSetWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.cards != null) {
      yield r'cards';
      yield serializers.serialize(
        object.cards,
        specifiedType: const FullType(BuiltList, [FullType(CardWrite)]),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.langDefinition != null) {
      yield r'lang_definition';
      yield serializers.serialize(
        object.langDefinition,
        specifiedType: const FullType(String),
      );
    }
    if (object.langTerm != null) {
      yield r'lang_term';
      yield serializers.serialize(
        object.langTerm,
        specifiedType: const FullType(String),
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
    AgentSetWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentSetWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CardWrite)]),
          ) as BuiltList<CardWrite>?;
          if (valueDes == null) continue;
          result.cards.replace(valueDes);
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'lang_definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.langDefinition = valueDes;
          break;
        case r'lang_term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.langTerm = valueDes;
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
  AgentSetWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentSetWriteBuilder();
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


