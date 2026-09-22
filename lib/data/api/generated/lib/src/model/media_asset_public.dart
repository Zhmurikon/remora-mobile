//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/media_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_asset_public.g.dart';

/// MediaAssetPublic
///
/// Properties:
/// * [createdAt] 
/// * [downloadUrl] 
/// * [height] 
/// * [id] 
/// * [mime] 
/// * [sizeBytes] 
/// * [status] 
/// * [width] 
@BuiltValue()
abstract class MediaAssetPublic implements Built<MediaAssetPublic, MediaAssetPublicBuilder> {
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'download_url')
  String? get downloadUrl;

  @BuiltValueField(wireName: r'height')
  int? get height;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'mime')
  String get mime;

  @BuiltValueField(wireName: r'size_bytes')
  int get sizeBytes;

  @BuiltValueField(wireName: r'status')
  MediaStatus get status;
  // enum statusEnum {  pending,  ready,  rejected,  };

  @BuiltValueField(wireName: r'width')
  int? get width;

  MediaAssetPublic._();

  factory MediaAssetPublic([void updates(MediaAssetPublicBuilder b)]) = _$MediaAssetPublic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaAssetPublicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaAssetPublic> get serializer => _$MediaAssetPublicSerializer();
}

class _$MediaAssetPublicSerializer implements PrimitiveSerializer<MediaAssetPublic> {
  @override
  final Iterable<Type> types = const [MediaAssetPublic, _$MediaAssetPublic];

  @override
  final String wireName = r'MediaAssetPublic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaAssetPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'download_url';
    yield object.downloadUrl == null ? null : serializers.serialize(
      object.downloadUrl,
      specifiedType: const FullType.nullable(String),
    );
    yield r'height';
    yield object.height == null ? null : serializers.serialize(
      object.height,
      specifiedType: const FullType.nullable(int),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'mime';
    yield serializers.serialize(
      object.mime,
      specifiedType: const FullType(String),
    );
    yield r'size_bytes';
    yield serializers.serialize(
      object.sizeBytes,
      specifiedType: const FullType(int),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(MediaStatus),
    );
    yield r'width';
    yield object.width == null ? null : serializers.serialize(
      object.width,
      specifiedType: const FullType.nullable(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaAssetPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaAssetPublicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'download_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.downloadUrl = valueDes;
          break;
        case r'height':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.height = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'mime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mime = valueDes;
          break;
        case r'size_bytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sizeBytes = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaStatus),
          ) as MediaStatus;
          result.status = valueDes;
          break;
        case r'width':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.width = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaAssetPublic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaAssetPublicBuilder();
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


