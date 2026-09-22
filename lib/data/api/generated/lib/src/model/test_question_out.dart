//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_direction.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/content_type.dart';
import 'package:remora_api/src/model/test_question_kind.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_question_out.g.dart';

/// TestQuestionOut
///
/// Properties:
/// * [cardId] 
/// * [codeLanguage] 
/// * [contentType] 
/// * [direction] 
/// * [hint] 
/// * [id] 
/// * [kind] 
/// * [options] 
/// * [pairs] 
/// * [prompt] 
/// * [promptImageUrl] 
/// * [statement] 
@BuiltValue()
abstract class TestQuestionOut implements Built<TestQuestionOut, TestQuestionOutBuilder> {
  @BuiltValueField(wireName: r'card_id')
  String get cardId;

  @BuiltValueField(wireName: r'code_language')
  String? get codeLanguage;

  @BuiltValueField(wireName: r'content_type')
  ContentType get contentType;
  // enum contentTypeEnum {  text,  latex,  code,  };

  @BuiltValueField(wireName: r'direction')
  StudyDirection get direction;
  // enum directionEnum {  term_to_def,  def_to_term,  };

  @BuiltValueField(wireName: r'hint')
  String? get hint;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'kind')
  TestQuestionKind get kind;
  // enum kindEnum {  choice,  true_false,  typing,  matching,  };

  @BuiltValueField(wireName: r'options')
  BuiltList<String>? get options;

  @BuiltValueField(wireName: r'pairs')
  BuiltList<String>? get pairs;

  @BuiltValueField(wireName: r'prompt')
  String get prompt;

  @BuiltValueField(wireName: r'prompt_image_url')
  String? get promptImageUrl;

  @BuiltValueField(wireName: r'statement')
  String? get statement;

  TestQuestionOut._();

  factory TestQuestionOut([void updates(TestQuestionOutBuilder b)]) = _$TestQuestionOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestQuestionOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestQuestionOut> get serializer => _$TestQuestionOutSerializer();
}

class _$TestQuestionOutSerializer implements PrimitiveSerializer<TestQuestionOut> {
  @override
  final Iterable<Type> types = const [TestQuestionOut, _$TestQuestionOut];

  @override
  final String wireName = r'TestQuestionOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestQuestionOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'card_id';
    yield serializers.serialize(
      object.cardId,
      specifiedType: const FullType(String),
    );
    if (object.codeLanguage != null) {
      yield r'code_language';
      yield serializers.serialize(
        object.codeLanguage,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'content_type';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(ContentType),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(StudyDirection),
    );
    if (object.hint != null) {
      yield r'hint';
      yield serializers.serialize(
        object.hint,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(TestQuestionKind),
    );
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.pairs != null) {
      yield r'pairs';
      yield serializers.serialize(
        object.pairs,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    yield r'prompt';
    yield serializers.serialize(
      object.prompt,
      specifiedType: const FullType(String),
    );
    if (object.promptImageUrl != null) {
      yield r'prompt_image_url';
      yield serializers.serialize(
        object.promptImageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.statement != null) {
      yield r'statement';
      yield serializers.serialize(
        object.statement,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TestQuestionOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestQuestionOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'card_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cardId = valueDes;
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
            specifiedType: const FullType(ContentType),
          ) as ContentType;
          result.contentType = valueDes;
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyDirection),
          ) as StudyDirection;
          result.direction = valueDes;
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
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TestQuestionKind),
          ) as TestQuestionKind;
          result.kind = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.options.replace(valueDes);
          break;
        case r'pairs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.pairs.replace(valueDes);
          break;
        case r'prompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prompt = valueDes;
          break;
        case r'prompt_image_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.promptImageUrl = valueDes;
          break;
        case r'statement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.statement = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestQuestionOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestQuestionOutBuilder();
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


