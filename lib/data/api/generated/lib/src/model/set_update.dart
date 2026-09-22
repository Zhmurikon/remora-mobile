//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/set_visibility.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_update.g.dart';

/// SetUpdate
///
/// Properties:
/// * [description] 
/// * [folderId] 
/// * [langDefinition] 
/// * [langTerm] 
/// * [title] 
/// * [visibility] 
@BuiltValue()
abstract class SetUpdate implements Built<SetUpdate, SetUpdateBuilder> {
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

  SetUpdate._();

  factory SetUpdate([void updates(SetUpdateBuilder b)]) = _$SetUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetUpdateBuilder b) => b
      ..description = ''
      ..langDefinition = 'ru'
      ..langTerm = 'ru'
      ..visibility = SetVisibility.private;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetUpdate> get serializer => _$SetUpdateSerializer();
}

class _$SetUpdateSerializer implements PrimitiveSerializer<SetUpdate> {
  @override
  final Iterable<Type> types = const [SetUpdate, _$SetUpdate];

  @override
  final String wireName = r'SetUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetUpdate object, {
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
    SetUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetUpdateBuilder result,
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
  SetUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetUpdateBuilder();
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


