//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/content_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_write.g.dart';

/// CardWrite
///
/// Properties:
/// * [altAnswers] 
/// * [codeLanguage] 
/// * [contentType] 
/// * [definition] 
/// * [definitionImageId] 
/// * [definitionTranscription] 
/// * [hint] 
/// * [id] 
/// * [term] 
/// * [termImageId] 
/// * [termTranscription] 
/// * [wrongDefinitionAnswers] 
/// * [wrongTermAnswers] 
@BuiltValue()
abstract class CardWrite implements Built<CardWrite, CardWriteBuilder> {
  @BuiltValueField(wireName: r'alt_answers')
  BuiltList<String>? get altAnswers;

  @BuiltValueField(wireName: r'code_language')
  String? get codeLanguage;

  @BuiltValueField(wireName: r'content_type')
  ContentType? get contentType;
  // enum contentTypeEnum {  text,  latex,  code,  };

  @BuiltValueField(wireName: r'definition')
  String get definition;

  @BuiltValueField(wireName: r'definition_image_id')
  String? get definitionImageId;

  @BuiltValueField(wireName: r'definition_transcription')
  String? get definitionTranscription;

  @BuiltValueField(wireName: r'hint')
  String? get hint;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'term')
  String get term;

  @BuiltValueField(wireName: r'term_image_id')
  String? get termImageId;

  @BuiltValueField(wireName: r'term_transcription')
  String? get termTranscription;

  @BuiltValueField(wireName: r'wrong_definition_answers')
  BuiltList<String>? get wrongDefinitionAnswers;

  @BuiltValueField(wireName: r'wrong_term_answers')
  BuiltList<String>? get wrongTermAnswers;

  CardWrite._();

  factory CardWrite([void updates(CardWriteBuilder b)]) = _$CardWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CardWriteBuilder b) => b
      ..contentType = ContentType.text;

  @BuiltValueSerializer(custom: true)
  static Serializer<CardWrite> get serializer => _$CardWriteSerializer();
}

class _$CardWriteSerializer implements PrimitiveSerializer<CardWrite> {
  @override
  final Iterable<Type> types = const [CardWrite, _$CardWrite];

  @override
  final String wireName = r'CardWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CardWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.altAnswers != null) {
      yield r'alt_answers';
      yield serializers.serialize(
        object.altAnswers,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.codeLanguage != null) {
      yield r'code_language';
      yield serializers.serialize(
        object.codeLanguage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentType != null) {
      yield r'content_type';
      yield serializers.serialize(
        object.contentType,
        specifiedType: const FullType(ContentType),
      );
    }
    yield r'definition';
    yield serializers.serialize(
      object.definition,
      specifiedType: const FullType(String),
    );
    if (object.definitionImageId != null) {
      yield r'definition_image_id';
      yield serializers.serialize(
        object.definitionImageId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.definitionTranscription != null) {
      yield r'definition_transcription';
      yield serializers.serialize(
        object.definitionTranscription,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.hint != null) {
      yield r'hint';
      yield serializers.serialize(
        object.hint,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'term';
    yield serializers.serialize(
      object.term,
      specifiedType: const FullType(String),
    );
    if (object.termImageId != null) {
      yield r'term_image_id';
      yield serializers.serialize(
        object.termImageId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.termTranscription != null) {
      yield r'term_transcription';
      yield serializers.serialize(
        object.termTranscription,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.wrongDefinitionAnswers != null) {
      yield r'wrong_definition_answers';
      yield serializers.serialize(
        object.wrongDefinitionAnswers,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.wrongTermAnswers != null) {
      yield r'wrong_term_answers';
      yield serializers.serialize(
        object.wrongTermAnswers,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CardWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CardWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'alt_answers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.altAnswers.replace(valueDes);
          break;
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
            specifiedType: const FullType.nullable(ContentType),
          ) as ContentType?;
          if (valueDes == null) continue;
          result.contentType = valueDes;
          break;
        case r'definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.definition = valueDes;
          break;
        case r'definition_image_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.definitionImageId = valueDes;
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
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.term = valueDes;
          break;
        case r'term_image_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.termImageId = valueDes;
          break;
        case r'term_transcription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.termTranscription = valueDes;
          break;
        case r'wrong_definition_answers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.wrongDefinitionAnswers.replace(valueDes);
          break;
        case r'wrong_term_answers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.wrongTermAnswers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CardWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CardWriteBuilder();
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


