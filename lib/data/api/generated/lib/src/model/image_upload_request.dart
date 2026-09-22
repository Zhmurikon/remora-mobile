//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'image_upload_request.g.dart';

/// ImageUploadRequest
///
/// Properties:
/// * [filename] 
/// * [mime] 
/// * [sizeBytes] 
@BuiltValue()
abstract class ImageUploadRequest implements Built<ImageUploadRequest, ImageUploadRequestBuilder> {
  @BuiltValueField(wireName: r'filename')
  String get filename;

  @BuiltValueField(wireName: r'mime')
  String get mime;

  @BuiltValueField(wireName: r'size_bytes')
  int get sizeBytes;

  ImageUploadRequest._();

  factory ImageUploadRequest([void updates(ImageUploadRequestBuilder b)]) = _$ImageUploadRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ImageUploadRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ImageUploadRequest> get serializer => _$ImageUploadRequestSerializer();
}

class _$ImageUploadRequestSerializer implements PrimitiveSerializer<ImageUploadRequest> {
  @override
  final Iterable<Type> types = const [ImageUploadRequest, _$ImageUploadRequest];

  @override
  final String wireName = r'ImageUploadRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ImageUploadRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'filename';
    yield serializers.serialize(
      object.filename,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ImageUploadRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ImageUploadRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.filename = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ImageUploadRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ImageUploadRequestBuilder();
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


