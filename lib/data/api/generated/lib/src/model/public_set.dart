//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/set_visibility.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/public_set_author.dart';
import 'package:remora_api/src/model/public_card.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_set.g.dart';

/// PublicSet
///
/// Properties:
/// * [author] 
/// * [cards] 
/// * [cardsCount] 
/// * [courseUrl] 
/// * [createdAt] 
/// * [description] 
/// * [id] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [nextCursor] 
/// * [slug] 
/// * [title] 
/// * [updatedAt] 
/// * [visibility] 
@BuiltValue()
abstract class PublicSet implements Built<PublicSet, PublicSetBuilder> {
  @BuiltValueField(wireName: r'author')
  PublicSetAuthor get author;

  @BuiltValueField(wireName: r'cards')
  BuiltList<PublicCard> get cards;

  @BuiltValueField(wireName: r'cards_count')
  int get cardsCount;

  @BuiltValueField(wireName: r'course_url')
  String? get courseUrl;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'lang_definition')
  String get langDefinition;

  @BuiltValueField(wireName: r'lang_term')
  String get langTerm;

  @BuiltValueField(wireName: r'next_cursor')
  int? get nextCursor;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'visibility')
  SetVisibility get visibility;
  // enum visibilityEnum {  private,  unlisted,  public,  };

  PublicSet._();

  factory PublicSet([void updates(PublicSetBuilder b)]) = _$PublicSet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicSetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicSet> get serializer => _$PublicSetSerializer();
}

class _$PublicSetSerializer implements PrimitiveSerializer<PublicSet> {
  @override
  final Iterable<Type> types = const [PublicSet, _$PublicSet];

  @override
  final String wireName = r'PublicSet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicSet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'author';
    yield serializers.serialize(
      object.author,
      specifiedType: const FullType(PublicSetAuthor),
    );
    yield r'cards';
    yield serializers.serialize(
      object.cards,
      specifiedType: const FullType(BuiltList, [FullType(PublicCard)]),
    );
    yield r'cards_count';
    yield serializers.serialize(
      object.cardsCount,
      specifiedType: const FullType(int),
    );
    if (object.courseUrl != null) {
      yield r'course_url';
      yield serializers.serialize(
        object.courseUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'lang_definition';
    yield serializers.serialize(
      object.langDefinition,
      specifiedType: const FullType(String),
    );
    yield r'lang_term';
    yield serializers.serialize(
      object.langTerm,
      specifiedType: const FullType(String),
    );
    if (object.nextCursor != null) {
      yield r'next_cursor';
      yield serializers.serialize(
        object.nextCursor,
        specifiedType: const FullType.nullable(int),
      );
    }
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
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
    yield r'visibility';
    yield serializers.serialize(
      object.visibility,
      specifiedType: const FullType(SetVisibility),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicSet object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicSetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PublicSetAuthor),
          ) as PublicSetAuthor;
          result.author.replace(valueDes);
          break;
        case r'cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PublicCard)]),
          ) as BuiltList<PublicCard>;
          result.cards.replace(valueDes);
          break;
        case r'cards_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsCount = valueDes;
          break;
        case r'course_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.courseUrl = valueDes;
          break;
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
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'lang_definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langDefinition = valueDes;
          break;
        case r'lang_term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.langTerm = valueDes;
          break;
        case r'next_cursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
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
        case r'visibility':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SetVisibility),
          ) as SetVisibility;
          result.visibility = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicSet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicSetBuilder();
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


