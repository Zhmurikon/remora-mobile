//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_publication.g.dart';

/// CoursePublication
///
/// Properties:
/// * [tags] 
@BuiltValue()
abstract class CoursePublication implements Built<CoursePublication, CoursePublicationBuilder> {
  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  CoursePublication._();

  factory CoursePublication([void updates(CoursePublicationBuilder b)]) = _$CoursePublication;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CoursePublicationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CoursePublication> get serializer => _$CoursePublicationSerializer();
}

class _$CoursePublicationSerializer implements PrimitiveSerializer<CoursePublication> {
  @override
  final Iterable<Type> types = const [CoursePublication, _$CoursePublication];

  @override
  final String wireName = r'CoursePublication';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CoursePublication object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CoursePublication object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CoursePublicationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.tags.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CoursePublication deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoursePublicationBuilder();
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


