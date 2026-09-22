//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_upload_ticket.g.dart';

/// ImageUploadTicket
///
/// Properties:
/// * [expiresIn] 
/// * [headers] 
/// * [id] 
/// * [method] 
/// * [uploadUrl] 
@BuiltValue()
abstract class ImageUploadTicket implements Built<ImageUploadTicket, ImageUploadTicketBuilder> {
  @BuiltValueField(wireName: r'expires_in')
  int get expiresIn;

  @BuiltValueField(wireName: r'headers')
  BuiltMap<String, String> get headers;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'method')
  String? get method;

  @BuiltValueField(wireName: r'upload_url')
  String get uploadUrl;

  ImageUploadTicket._();

  factory ImageUploadTicket([void updates(ImageUploadTicketBuilder b)]) = _$ImageUploadTicket;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ImageUploadTicketBuilder b) => b
      ..method = 'PUT';

  @BuiltValueSerializer(custom: true)
  static Serializer<ImageUploadTicket> get serializer => _$ImageUploadTicketSerializer();
}

class _$ImageUploadTicketSerializer implements PrimitiveSerializer<ImageUploadTicket> {
  @override
  final Iterable<Type> types = const [ImageUploadTicket, _$ImageUploadTicket];

  @override
  final String wireName = r'ImageUploadTicket';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ImageUploadTicket object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expires_in';
    yield serializers.serialize(
      object.expiresIn,
      specifiedType: const FullType(int),
    );
    yield r'headers';
    yield serializers.serialize(
      object.headers,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    if (object.method != null) {
      yield r'method';
      yield serializers.serialize(
        object.method,
        specifiedType: const FullType(String),
      );
    }
    yield r'upload_url';
    yield serializers.serialize(
      object.uploadUrl,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ImageUploadTicket object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ImageUploadTicketBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expires_in':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresIn = valueDes;
          break;
        case r'headers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.headers.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'method':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.method = valueDes;
          break;
        case r'upload_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uploadUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ImageUploadTicket deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ImageUploadTicketBuilder();
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


