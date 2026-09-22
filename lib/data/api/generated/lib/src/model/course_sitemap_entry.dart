//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_sitemap_entry.g.dart';

/// CourseSitemapEntry
///
/// Properties:
/// * [authorUsername] 
/// * [slug] 
/// * [updatedAt] 
@BuiltValue()
abstract class CourseSitemapEntry implements Built<CourseSitemapEntry, CourseSitemapEntryBuilder> {
  @BuiltValueField(wireName: r'author_username')
  String get authorUsername;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  CourseSitemapEntry._();

  factory CourseSitemapEntry([void updates(CourseSitemapEntryBuilder b)]) = _$CourseSitemapEntry;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseSitemapEntryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseSitemapEntry> get serializer => _$CourseSitemapEntrySerializer();
}

class _$CourseSitemapEntrySerializer implements PrimitiveSerializer<CourseSitemapEntry> {
  @override
  final Iterable<Type> types = const [CourseSitemapEntry, _$CourseSitemapEntry];

  @override
  final String wireName = r'CourseSitemapEntry';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseSitemapEntry object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'author_username';
    yield serializers.serialize(
      object.authorUsername,
      specifiedType: const FullType(String),
    );
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseSitemapEntry object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseSitemapEntryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'author_username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.authorUsername = valueDes;
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseSitemapEntry deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseSitemapEntryBuilder();
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


