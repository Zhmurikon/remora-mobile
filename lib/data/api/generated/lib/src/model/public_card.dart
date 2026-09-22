//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/content_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_card.g.dart';

/// PublicCard
///
/// Properties:
/// * [codeLanguage] 
/// * [contentType] 
/// * [definition] 
/// * [definitionImageUrl] 
/// * [definitionTranscription] 
/// * [hint] 
/// * [id] 
/// * [position] 
/// * [term] 
/// * [termImageUrl] 
/// * [termTranscription] 
@BuiltValue()
abstract class PublicCard implements Built<PublicCard, PublicCardBuilder> {
  @BuiltValueField(wireName: r'code_language')
  String? get codeLanguage;

  @BuiltValueField(wireName: r'content_type')
  ContentType get contentType;
  // enum contentTypeEnum {  text,  latex,  code,  };

  @BuiltValueField(wireName: r'definition')
  String get definition;

  @BuiltValueField(wireName: r'definition_image_url')
  String? get definitionImageUrl;

  @BuiltValueField(wireName: r'definition_transcription')
  String? get definitionTranscription;

  @BuiltValueField(wireName: r'hint')
  String? get hint;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'position')
  int get position;

  @BuiltValueField(wireName: r'term')
  String get term;

  @BuiltValueField(wireName: r'term_image_url')
  String? get termImageUrl;

  @BuiltValueField(wireName: r'term_transcription')
  String? get termTranscription;

  PublicCard._();

  factory PublicCard([void updates(PublicCardBuilder b)]) = _$PublicCard;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicCardBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicCard> get serializer => _$PublicCardSerializer();
}

class _$PublicCardSerializer implements PrimitiveSerializer<PublicCard> {
  @override
  final Iterable<Type> types = const [PublicCard, _$PublicCard];

  @override
  final String wireName = r'PublicCard';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicCard object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code_language';
    yield object.codeLanguage == null ? null : serializers.serialize(
      object.codeLanguage,
      specifiedType: const FullType.nullable(String),
    );
    yield r'content_type';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(ContentType),
    );
    yield r'definition';
    yield serializers.serialize(
      object.definition,
      specifiedType: const FullType(String),
    );
    if (object.definitionImageUrl != null) {
      yield r'definition_image_url';
      yield serializers.serialize(
        object.definitionImageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'definition_transcription';
    yield object.definitionTranscription == null ? null : serializers.serialize(
      object.definitionTranscription,
      specifiedType: const FullType.nullable(String),
    );
    yield r'hint';
    yield object.hint == null ? null : serializers.serialize(
      object.hint,
      specifiedType: const FullType.nullable(String),
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
    yield r'term';
    yield serializers.serialize(
      object.term,
      specifiedType: const FullType(String),
    );
    if (object.termImageUrl != null) {
      yield r'term_image_url';
      yield serializers.serialize(
        object.termImageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'term_transcription';
    yield object.termTranscription == null ? null : serializers.serialize(
      object.termTranscription,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicCard object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicCardBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code_language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.codeLanguage = valueDes;
          break;
        case r'content_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContentType),
          ) as ContentType;
          result.contentType = valueDes;
          break;
        case r'definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.definition = valueDes;
          break;
        case r'definition_image_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.definitionImageUrl = valueDes;
          break;
        case r'definition_transcription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.definitionTranscription = valueDes;
          break;
        case r'hint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.hint = valueDes;
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
        case r'term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.term = valueDes;
          break;
        case r'term_image_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.termImageUrl = valueDes;
          break;
        case r'term_transcription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.termTranscription = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicCard deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicCardBuilder();
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


