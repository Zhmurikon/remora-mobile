//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/bot_platform.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bot_code_request.g.dart';

/// BotCodeRequest
///
/// Properties:
/// * [platform] 
@BuiltValue()
abstract class BotCodeRequest implements Built<BotCodeRequest, BotCodeRequestBuilder> {
  @BuiltValueField(wireName: r'platform')
  BotPlatform get platform;
  // enum platformEnum {  telegram,  vk,  };

  BotCodeRequest._();

  factory BotCodeRequest([void updates(BotCodeRequestBuilder b)]) = _$BotCodeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BotCodeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BotCodeRequest> get serializer => _$BotCodeRequestSerializer();
}

class _$BotCodeRequestSerializer implements PrimitiveSerializer<BotCodeRequest> {
  @override
  final Iterable<Type> types = const [BotCodeRequest, _$BotCodeRequest];

  @override
  final String wireName = r'BotCodeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BotCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(BotPlatform),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BotCodeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BotCodeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  BotCodeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BotCodeRequestBuilder();
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


