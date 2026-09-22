//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'library_item.g.dart';

/// LibraryItem
///
/// Properties:
/// * [acceptedAt] 
/// * [articleId] 
/// * [articleTitle] 
/// * [cardsCount] 
/// * [courseId] 
/// * [courseSlug] 
/// * [courseTitle] 
/// * [hasUpdates] 
/// * [id] 
/// * [savedAt] 
/// * [setId] 
/// * [setTitle] 
/// * [targetId] 
/// * [targetType] 
@BuiltValue()
abstract class LibraryItem implements Built<LibraryItem, LibraryItemBuilder> {
  @BuiltValueField(wireName: r'accepted_at')
  DateTime get acceptedAt;

  @BuiltValueField(wireName: r'article_id')
  String? get articleId;

  @BuiltValueField(wireName: r'article_title')
  String? get articleTitle;

  @BuiltValueField(wireName: r'cards_count')
  int get cardsCount;

  @BuiltValueField(wireName: r'course_id')
  String get courseId;

  @BuiltValueField(wireName: r'course_slug')
  String get courseSlug;

  @BuiltValueField(wireName: r'course_title')
  String get courseTitle;

  @BuiltValueField(wireName: r'has_updates')
  bool get hasUpdates;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'saved_at')
  DateTime get savedAt;

  @BuiltValueField(wireName: r'set_id')
  String? get setId;

  @BuiltValueField(wireName: r'set_title')
  String? get setTitle;

  @BuiltValueField(wireName: r'target_id')
  String get targetId;

  @BuiltValueField(wireName: r'target_type')
  LibraryItemTargetTypeEnum get targetType;
  // enum targetTypeEnum {  course,  article,  set,  };

  LibraryItem._();

  factory LibraryItem([void updates(LibraryItemBuilder b)]) = _$LibraryItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LibraryItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LibraryItem> get serializer => _$LibraryItemSerializer();
}

class _$LibraryItemSerializer implements PrimitiveSerializer<LibraryItem> {
  @override
  final Iterable<Type> types = const [LibraryItem, _$LibraryItem];

  @override
  final String wireName = r'LibraryItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LibraryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accepted_at';
    yield serializers.serialize(
      object.acceptedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.articleId != null) {
      yield r'article_id';
      yield serializers.serialize(
        object.articleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.articleTitle != null) {
      yield r'article_title';
      yield serializers.serialize(
        object.articleTitle,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'cards_count';
    yield serializers.serialize(
      object.cardsCount,
      specifiedType: const FullType(int),
    );
    yield r'course_id';
    yield serializers.serialize(
      object.courseId,
      specifiedType: const FullType(String),
    );
    yield r'course_slug';
    yield serializers.serialize(
      object.courseSlug,
      specifiedType: const FullType(String),
    );
    yield r'course_title';
    yield serializers.serialize(
      object.courseTitle,
      specifiedType: const FullType(String),
    );
    yield r'has_updates';
    yield serializers.serialize(
      object.hasUpdates,
      specifiedType: const FullType(bool),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'saved_at';
    yield serializers.serialize(
      object.savedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.setId != null) {
      yield r'set_id';
      yield serializers.serialize(
        object.setId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.setTitle != null) {
      yield r'set_title';
      yield serializers.serialize(
        object.setTitle,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'target_id';
    yield serializers.serialize(
      object.targetId,
      specifiedType: const FullType(String),
    );
    yield r'target_type';
    yield serializers.serialize(
      object.targetType,
      specifiedType: const FullType(LibraryItemTargetTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LibraryItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LibraryItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accepted_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.acceptedAt = valueDes;
          break;
        case r'article_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.articleId = valueDes;
          break;
        case r'article_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.articleTitle = valueDes;
          break;
        case r'cards_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsCount = valueDes;
          break;
        case r'course_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseId = valueDes;
          break;
        case r'course_slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseSlug = valueDes;
          break;
        case r'course_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseTitle = valueDes;
          break;
        case r'has_updates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasUpdates = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'saved_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.savedAt = valueDes;
          break;
        case r'set_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.setId = valueDes;
          break;
        case r'set_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.setTitle = valueDes;
          break;
        case r'target_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.targetId = valueDes;
          break;
        case r'target_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LibraryItemTargetTypeEnum),
          ) as LibraryItemTargetTypeEnum;
          result.targetType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LibraryItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LibraryItemBuilder();
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


class LibraryItemTargetTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'course')
  static const LibraryItemTargetTypeEnum course = _$libraryItemTargetTypeEnum_course;
  @BuiltValueEnumConst(wireName: r'article')
  static const LibraryItemTargetTypeEnum article = _$libraryItemTargetTypeEnum_article;
  @BuiltValueEnumConst(wireName: r'set')
  static const LibraryItemTargetTypeEnum set_ = _$libraryItemTargetTypeEnum_set_;

  static Serializer<LibraryItemTargetTypeEnum> get serializer => _$libraryItemTargetTypeEnumSerializer;

  const LibraryItemTargetTypeEnum._(String name): super(name);

  static BuiltSet<LibraryItemTargetTypeEnum> get values => _$libraryItemTargetTypeEnumValues;
  static LibraryItemTargetTypeEnum valueOf(String name) => _$libraryItemTargetTypeEnumValueOf(name);
}

