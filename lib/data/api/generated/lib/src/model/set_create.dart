//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/set_visibility.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_create.g.dart';

/// SetCreate
///
/// Properties:
/// * [description] 
/// * [folderId] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [title] 
/// * [visibility] 
@BuiltValue()
abstract class SetCreate implements Built<SetCreate, SetCreateBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'folder_id')
  String? get folderId;

  @BuiltValueField(wireName: r'lang_definition')
  String? get langDefinition;

  @BuiltValueField(wireName: r'lang_term')
  String? get langTerm;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'visibility')
  SetVisibility? get visibility;
  // enum visibilityEnum {  private,  unlisted,  public,  };

  SetCreate._();

  factory SetCreate([void updates(SetCreateBuilder b)]) = _$SetCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetCreateBuilder b) => b
      ..description = ''
      ..langDefinition = 'ru'
      ..langTerm = 'ru'
      ..visibility = SetVisibility.private;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetCreate> get serializer => _$SetCreateSerializer();
}

class _$SetCreateSerializer implements PrimitiveSerializer<SetCreate> {
  @override
  final Iterable<Type> types = const [SetCreate, _$SetCreate];

  @override
  final String wireName = r'SetCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.folderId != null) {
      yield r'folder_id';
      yield serializers.serialize(
        object.folderId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.langDefinition != null) {
      yield r'lang_definition';
      yield serializers.serialize(
        object.langDefinition,
        specifiedType: const FullType(String),
      );
    }
    if (object.langTerm != null) {
      yield r'lang_term';
      yield serializers.serialize(
        object.langTerm,
        specifiedType: const FullType(String),
      );
    }
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    if (object.visibility != null) {
      yield r'visibility';
      yield serializers.serialize(
        object.visibility,
        specifiedType: const FullType(SetVisibility),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SetCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.folderId = valueDes;
          break;
        case r'lang_definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.langDefinition = valueDes;
          break;
        case r'lang_term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.langTerm = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'visibility':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SetVisibility),
          ) as SetVisibility?;
          if (valueDes == null) continue;
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
  SetCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetCreateBuilder();
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


