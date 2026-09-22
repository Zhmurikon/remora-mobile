//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_copy_request.g.dart';

/// CourseCopyRequest
///
/// Properties:
/// * [articleId] 
@BuiltValue()
abstract class CourseCopyRequest implements Built<CourseCopyRequest, CourseCopyRequestBuilder> {
  @BuiltValueField(wireName: r'article_id')
  String? get articleId;

  CourseCopyRequest._();

  factory CourseCopyRequest([void updates(CourseCopyRequestBuilder b)]) = _$CourseCopyRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseCopyRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseCopyRequest> get serializer => _$CourseCopyRequestSerializer();
}

class _$CourseCopyRequestSerializer implements PrimitiveSerializer<CourseCopyRequest> {
  @override
  final Iterable<Type> types = const [CourseCopyRequest, _$CourseCopyRequest];

  @override
  final String wireName = r'CourseCopyRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseCopyRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.articleId != null) {
      yield r'article_id';
      yield serializers.serialize(
        object.articleId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseCopyRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseCopyRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'article_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.articleId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseCopyRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseCopyRequestBuilder();
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


