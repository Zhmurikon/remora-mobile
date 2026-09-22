//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/course_article_public.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_section_public.g.dart';

/// CourseSectionPublic
///
/// Properties:
/// * [articles] 
/// * [id] 
/// * [position] 
/// * [title] 
@BuiltValue()
abstract class CourseSectionPublic implements Built<CourseSectionPublic, CourseSectionPublicBuilder> {
  @BuiltValueField(wireName: r'articles')
  BuiltList<CourseArticlePublic> get articles;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'position')
  int get position;

  @BuiltValueField(wireName: r'title')
  String get title;

  CourseSectionPublic._();

  factory CourseSectionPublic([void updates(CourseSectionPublicBuilder b)]) = _$CourseSectionPublic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseSectionPublicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseSectionPublic> get serializer => _$CourseSectionPublicSerializer();
}

class _$CourseSectionPublicSerializer implements PrimitiveSerializer<CourseSectionPublic> {
  @override
  final Iterable<Type> types = const [CourseSectionPublic, _$CourseSectionPublic];

  @override
  final String wireName = r'CourseSectionPublic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseSectionPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'articles';
    yield serializers.serialize(
      object.articles,
      specifiedType: const FullType(BuiltList, [FullType(CourseArticlePublic)]),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseSectionPublic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseSectionPublicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'articles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CourseArticlePublic)]),
          ) as BuiltList<CourseArticlePublic>;
          result.articles.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.position = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseSectionPublic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseSectionPublicBuilder();
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


