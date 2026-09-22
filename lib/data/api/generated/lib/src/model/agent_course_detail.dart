//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/agent_section_detail.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_course_detail.g.dart';

/// AgentCourseDetail
///
/// Properties:
/// * [createdAt] 
/// * [description] 
/// * [id] 
/// * [isListed] 
/// * [isPublished] 
/// * [likedByMe] 
/// * [likesCount] 
/// * [moderationStatus] 
/// * [publishedAt] 
/// * [revision] 
/// * [savesCount] 
/// * [sections] 
/// * [slug] 
/// * [tags] 
/// * [title] 
/// * [updatedAt] 
@BuiltValue()
abstract class AgentCourseDetail implements Built<AgentCourseDetail, AgentCourseDetailBuilder> {
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'is_listed')
  bool get isListed;

  @BuiltValueField(wireName: r'is_published')
  bool get isPublished;

  @BuiltValueField(wireName: r'liked_by_me')
  bool? get likedByMe;

  @BuiltValueField(wireName: r'likes_count')
  int? get likesCount;

  @BuiltValueField(wireName: r'moderation_status')
  String get moderationStatus;

  @BuiltValueField(wireName: r'published_at')
  DateTime? get publishedAt;

  @BuiltValueField(wireName: r'revision')
  String get revision;

  @BuiltValueField(wireName: r'saves_count')
  int? get savesCount;

  @BuiltValueField(wireName: r'sections')
  BuiltList<AgentSectionDetail> get sections;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String> get tags;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  AgentCourseDetail._();

  factory AgentCourseDetail([void updates(AgentCourseDetailBuilder b)]) = _$AgentCourseDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentCourseDetailBuilder b) => b
      ..description = ''
      ..likedByMe = false
      ..likesCount = 0
      ..savesCount = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentCourseDetail> get serializer => _$AgentCourseDetailSerializer();
}

class _$AgentCourseDetailSerializer implements PrimitiveSerializer<AgentCourseDetail> {
  @override
  final Iterable<Type> types = const [AgentCourseDetail, _$AgentCourseDetail];

  @override
  final String wireName = r'AgentCourseDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentCourseDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'is_listed';
    yield serializers.serialize(
      object.isListed,
      specifiedType: const FullType(bool),
    );
    yield r'is_published';
    yield serializers.serialize(
      object.isPublished,
      specifiedType: const FullType(bool),
    );
    if (object.likedByMe != null) {
      yield r'liked_by_me';
      yield serializers.serialize(
        object.likedByMe,
        specifiedType: const FullType(bool),
      );
    }
    if (object.likesCount != null) {
      yield r'likes_count';
      yield serializers.serialize(
        object.likesCount,
        specifiedType: const FullType(int),
      );
    }
    yield r'moderation_status';
    yield serializers.serialize(
      object.moderationStatus,
      specifiedType: const FullType(String),
    );
    yield r'published_at';
    yield object.publishedAt == null ? null : serializers.serialize(
      object.publishedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'revision';
    yield serializers.serialize(
      object.revision,
      specifiedType: const FullType(String),
    );
    if (object.savesCount != null) {
      yield r'saves_count';
      yield serializers.serialize(
        object.savesCount,
        specifiedType: const FullType(int),
      );
    }
    yield r'sections';
    yield serializers.serialize(
      object.sections,
      specifiedType: const FullType(BuiltList, [FullType(AgentSectionDetail)]),
    );
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    yield r'tags';
    yield serializers.serialize(
      object.tags,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
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
    AgentCourseDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentCourseDetailBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'is_listed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isListed = valueDes;
          break;
        case r'is_published':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPublished = valueDes;
          break;
        case r'liked_by_me':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.likedByMe = valueDes;
          break;
        case r'likes_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.likesCount = valueDes;
          break;
        case r'moderation_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.moderationStatus = valueDes;
          break;
        case r'published_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.publishedAt = valueDes;
          break;
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
          break;
        case r'saves_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.savesCount = valueDes;
          break;
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AgentSectionDetail)]),
          ) as BuiltList<AgentSectionDetail>;
          result.sections.replace(valueDes);
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
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
  AgentCourseDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentCourseDetailBuilder();
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


