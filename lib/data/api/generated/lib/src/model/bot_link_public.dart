//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/bot_platform.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bot_link_public.g.dart';

/// BotLinkPublic
///
/// Properties:
/// * [actorId] 
/// * [createdAt] 
/// * [id] 
/// * [platform] 
@BuiltValue()
abstract class BotLinkPublic implements Built<BotLinkPublic, BotLinkPublicBuilder> {
  @BuiltValueField(wireName: r'actor_id')
  String get actorId;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'platform')
  BotPlatform get platform;
  // enum platformEnum {  telegram,  vk,  };

  BotLinkPublic._();

  factory BotLinkPublic([void updates(BotLinkPublicBuilder b)]) = _$BotLinkPublic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BotLinkPublicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BotLinkPublic> get serializer => _$BotLinkPublicSerializer();
}

class _$BotLinkPublicSerializer implements PrimitiveSerializer<BotLinkPublic> {
  @override
  final Iterable<Type> types = const [BotLinkPublic, _$BotLinkPublic];

  @override
  final String wireName = r'BotLinkPublic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BotLinkPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'actor_id';
    yield serializers.serialize(
      object.actorId,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(BotPlatform),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BotLinkPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BotLinkPublicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'actor_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.actorId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BotPlatform),
          ) as BotPlatform;
          result.platform = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BotLinkPublic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BotLinkPublicBuilder();
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


