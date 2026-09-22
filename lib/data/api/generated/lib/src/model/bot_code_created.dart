//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bot_code_created.g.dart';

/// BotCodeCreated
///
/// Properties:
/// * [botUrl] 
/// * [code] 
/// * [expiresAt] 
@BuiltValue()
abstract class BotCodeCreated implements Built<BotCodeCreated, BotCodeCreatedBuilder> {
  @BuiltValueField(wireName: r'bot_url')
  String? get botUrl;

  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'expires_at')
  DateTime get expiresAt;

  BotCodeCreated._();

  factory BotCodeCreated([void updates(BotCodeCreatedBuilder b)]) = _$BotCodeCreated;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BotCodeCreatedBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BotCodeCreated> get serializer => _$BotCodeCreatedSerializer();
}

class _$BotCodeCreatedSerializer implements PrimitiveSerializer<BotCodeCreated> {
  @override
  final Iterable<Type> types = const [BotCodeCreated, _$BotCodeCreated];

  @override
  final String wireName = r'BotCodeCreated';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BotCodeCreated object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'bot_url';
    yield object.botUrl == null ? null : serializers.serialize(
      object.botUrl,
      specifiedType: const FullType.nullable(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'expires_at';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BotCodeCreated object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BotCodeCreatedBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'bot_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.botUrl = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BotCodeCreated deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BotCodeCreatedBuilder();
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


