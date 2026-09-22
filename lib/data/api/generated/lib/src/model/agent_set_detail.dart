//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/set_visibility.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/card_public.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_set_detail.g.dart';

/// AgentSetDetail
///
/// Properties:
/// * [cards] 
/// * [cardsCount] 
/// * [createdAt] 
/// * [description] 
/// * [folderId] 
/// * [id] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [revision] 
/// * [slug] 
/// * [title] 
/// * [updatedAt] 
/// * [visibility] 
@BuiltValue()
abstract class AgentSetDetail implements Built<AgentSetDetail, AgentSetDetailBuilder> {
  @BuiltValueField(wireName: r'cards')
  BuiltList<CardPublic> get cards;

  @BuiltValueField(wireName: r'cards_count')
  int get cardsCount;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'folder_id')
  String? get folderId;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'lang_definition')
  String get langDefinition;

  @BuiltValueField(wireName: r'lang_term')
  String get langTerm;

  @BuiltValueField(wireName: r'revision')
  String get revision;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'visibility')
  SetVisibility get visibility;
  // enum visibilityEnum {  private,  unlisted,  public,  };

  AgentSetDetail._();

  factory AgentSetDetail([void updates(AgentSetDetailBuilder b)]) = _$AgentSetDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentSetDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentSetDetail> get serializer => _$AgentSetDetailSerializer();
}

class _$AgentSetDetailSerializer implements PrimitiveSerializer<AgentSetDetail> {
  @override
  final Iterable<Type> types = const [AgentSetDetail, _$AgentSetDetail];

  @override
  final String wireName = r'AgentSetDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentSetDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cards';
    yield serializers.serialize(
      object.cards,
      specifiedType: const FullType(BuiltList, [FullType(CardPublic)]),
    );
    yield r'cards_count';
    yield serializers.serialize(
      object.cardsCount,
      specifiedType: const FullType(int),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'folder_id';
    yield object.folderId == null ? null : serializers.serialize(
      object.folderId,
      specifiedType: const FullType.nullable(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'lang_definition';
    yield serializers.serialize(
      object.langDefinition,
      specifiedType: const FullType(String),
    );
    yield r'lang_term';
    yield serializers.serialize(
      object.langTerm,
      specifiedType: const FullType(String),
    );
    yield r'revision';
    yield serializers.serialize(
      object.revision,
      specifiedType: const FullType(String),
    );
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'visibility';
    yield serializers.serialize(
      object.visibility,
      specifiedType: const FullType(SetVisibility),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AgentSetDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentSetDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CardPublic)]),
          ) as BuiltList<CardPublic>;
          result.cards.replace(valueDes);
          break;
        case r'cards_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsCount = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.folderId = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'lang_definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langDefinition = valueDes;
          break;
        case r'lang_term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langTerm = valueDes;
          break;
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'visibility':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SetVisibility),
          ) as SetVisibility;
          result.visibility = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AgentSetDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentSetDetailBuilder();
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


