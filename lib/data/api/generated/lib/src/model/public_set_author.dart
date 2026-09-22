//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_set_author.g.dart';

/// PublicSetAuthor
///
/// Properties:
/// * [avatarUrl] 
/// * [displayName] 
/// * [username] 
@BuiltValue()
abstract class PublicSetAuthor implements Built<PublicSetAuthor, PublicSetAuthorBuilder> {
  @BuiltValueField(wireName: r'avatar_url')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'display_name')
  String? get displayName;

  @BuiltValueField(wireName: r'username')
  String get username;

  PublicSetAuthor._();

  factory PublicSetAuthor([void updates(PublicSetAuthorBuilder b)]) = _$PublicSetAuthor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicSetAuthorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicSetAuthor> get serializer => _$PublicSetAuthorSerializer();
}

class _$PublicSetAuthorSerializer implements PrimitiveSerializer<PublicSetAuthor> {
  @override
  final Iterable<Type> types = const [PublicSetAuthor, _$PublicSetAuthor];

  @override
  final String wireName = r'PublicSetAuthor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicSetAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'avatar_url';
    yield object.avatarUrl == null ? null : serializers.serialize(
      object.avatarUrl,
      specifiedType: const FullType.nullable(String),
    );
    yield r'display_name';
    yield object.displayName == null ? null : serializers.serialize(
      object.displayName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicSetAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicSetAuthorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'avatar_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarUrl = valueDes;
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicSetAuthor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicSetAuthorBuilder();
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


