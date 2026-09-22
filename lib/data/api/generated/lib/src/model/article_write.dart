//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'article_write.g.dart';

/// ArticleWrite
///
/// Properties:
/// * [body] 
/// * [id] 
/// * [setId] 
/// * [title] 
@BuiltValue()
abstract class ArticleWrite implements Built<ArticleWrite, ArticleWriteBuilder> {
  @BuiltValueField(wireName: r'body')
  String? get body;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'set_id')
  String? get setId;

  @BuiltValueField(wireName: r'title')
  String get title;

  ArticleWrite._();

  factory ArticleWrite([void updates(ArticleWriteBuilder b)]) = _$ArticleWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ArticleWriteBuilder b) => b
      ..body = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<ArticleWrite> get serializer => _$ArticleWriteSerializer();
}

class _$ArticleWriteSerializer implements PrimitiveSerializer<ArticleWrite> {
  @override
  final Iterable<Type> types = const [ArticleWrite, _$ArticleWrite];

  @override
  final String wireName = r'ArticleWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ArticleWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.setId != null) {
      yield r'set_id';
      yield serializers.serialize(
        object.setId,
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
    ArticleWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ArticleWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.body = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'set_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.setId = valueDes;
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
  ArticleWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ArticleWriteBuilder();
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


