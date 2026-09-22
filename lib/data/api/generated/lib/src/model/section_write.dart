//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/article_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'section_write.g.dart';

/// SectionWrite
///
/// Properties:
/// * [articles] 
/// * [id] 
/// * [title] 
@BuiltValue()
abstract class SectionWrite implements Built<SectionWrite, SectionWriteBuilder> {
  @BuiltValueField(wireName: r'articles')
  BuiltList<ArticleWrite>? get articles;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  SectionWrite._();

  factory SectionWrite([void updates(SectionWriteBuilder b)]) = _$SectionWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SectionWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SectionWrite> get serializer => _$SectionWriteSerializer();
}

class _$SectionWriteSerializer implements PrimitiveSerializer<SectionWrite> {
  @override
  final Iterable<Type> types = const [SectionWrite, _$SectionWrite];

  @override
  final String wireName = r'SectionWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SectionWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.articles != null) {
      yield r'articles';
      yield serializers.serialize(
        object.articles,
        specifiedType: const FullType(BuiltList, [FullType(ArticleWrite)]),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SectionWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SectionWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'articles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ArticleWrite)]),
          ) as BuiltList<ArticleWrite>?;
          if (valueDes == null) continue;
          result.articles.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
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
  SectionWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SectionWriteBuilder();
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


