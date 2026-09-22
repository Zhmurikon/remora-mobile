//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/course_search_item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/author_stats.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'author_profile.g.dart';

/// AuthorProfile
///
/// Properties:
/// * [avatarUrl] 
/// * [badges] 
/// * [courses] 
/// * [displayName] 
/// * [id] 
/// * [joinedAt] 
/// * [stats] 
/// * [username] 
@BuiltValue()
abstract class AuthorProfile implements Built<AuthorProfile, AuthorProfileBuilder> {
  @BuiltValueField(wireName: r'avatar_url')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'badges')
  BuiltList<String> get badges;

  @BuiltValueField(wireName: r'courses')
  BuiltList<CourseSearchItem> get courses;

  @BuiltValueField(wireName: r'display_name')
  String? get displayName;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'joined_at')
  DateTime get joinedAt;

  @BuiltValueField(wireName: r'stats')
  AuthorStats get stats;

  @BuiltValueField(wireName: r'username')
  String get username;

  AuthorProfile._();

  factory AuthorProfile([void updates(AuthorProfileBuilder b)]) = _$AuthorProfile;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthorProfileBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthorProfile> get serializer => _$AuthorProfileSerializer();
}

class _$AuthorProfileSerializer implements PrimitiveSerializer<AuthorProfile> {
  @override
  final Iterable<Type> types = const [AuthorProfile, _$AuthorProfile];

  @override
  final String wireName = r'AuthorProfile';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthorProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'avatar_url';
    yield object.avatarUrl == null ? null : serializers.serialize(
      object.avatarUrl,
      specifiedType: const FullType.nullable(String),
    );
    yield r'badges';
    yield serializers.serialize(
      object.badges,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'courses';
    yield serializers.serialize(
      object.courses,
      specifiedType: const FullType(BuiltList, [FullType(CourseSearchItem)]),
    );
    yield r'display_name';
    yield object.displayName == null ? null : serializers.serialize(
      object.displayName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'joined_at';
    yield serializers.serialize(
      object.joinedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'stats';
    yield serializers.serialize(
      object.stats,
      specifiedType: const FullType(AuthorStats),
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
    AuthorProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthorProfileBuilder result,
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
        case r'badges':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.badges.replace(valueDes);
          break;
        case r'courses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CourseSearchItem)]),
          ) as BuiltList<CourseSearchItem>;
          result.courses.replace(valueDes);
          break;
        case r'display_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'joined_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.joinedAt = valueDes;
          break;
        case r'stats':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AuthorStats),
          ) as AuthorStats;
          result.stats.replace(valueDes);
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
  AuthorProfile deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthorProfileBuilder();
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


