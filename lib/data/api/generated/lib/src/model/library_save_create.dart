//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'library_save_create.g.dart';

/// LibrarySaveCreate
///
/// Properties:
/// * [targetId] 
/// * [targetType] 
@BuiltValue()
abstract class LibrarySaveCreate implements Built<LibrarySaveCreate, LibrarySaveCreateBuilder> {
  @BuiltValueField(wireName: r'target_id')
  String get targetId;

  @BuiltValueField(wireName: r'target_type')
  LibrarySaveCreateTargetTypeEnum get targetType;
  // enum targetTypeEnum {  course,  article,  set,  };

  LibrarySaveCreate._();

  factory LibrarySaveCreate([void updates(LibrarySaveCreateBuilder b)]) = _$LibrarySaveCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LibrarySaveCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LibrarySaveCreate> get serializer => _$LibrarySaveCreateSerializer();
}

class _$LibrarySaveCreateSerializer implements PrimitiveSerializer<LibrarySaveCreate> {
  @override
  final Iterable<Type> types = const [LibrarySaveCreate, _$LibrarySaveCreate];

  @override
  final String wireName = r'LibrarySaveCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LibrarySaveCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'target_id';
    yield serializers.serialize(
      object.targetId,
      specifiedType: const FullType(String),
    );
    yield r'target_type';
    yield serializers.serialize(
      object.targetType,
      specifiedType: const FullType(LibrarySaveCreateTargetTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LibrarySaveCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LibrarySaveCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(LibrarySaveCreateTargetTypeEnum),
          ) as LibrarySaveCreateTargetTypeEnum;
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
  LibrarySaveCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LibrarySaveCreateBuilder();
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


class LibrarySaveCreateTargetTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'course')
  static const LibrarySaveCreateTargetTypeEnum course = _$librarySaveCreateTargetTypeEnum_course;
  @BuiltValueEnumConst(wireName: r'article')
  static const LibrarySaveCreateTargetTypeEnum article = _$librarySaveCreateTargetTypeEnum_article;
  @BuiltValueEnumConst(wireName: r'set')
  static const LibrarySaveCreateTargetTypeEnum set_ = _$librarySaveCreateTargetTypeEnum_set_;

  static Serializer<LibrarySaveCreateTargetTypeEnum> get serializer => _$librarySaveCreateTargetTypeEnumSerializer;

  const LibrarySaveCreateTargetTypeEnum._(String name): super(name);

  static BuiltSet<LibrarySaveCreateTargetTypeEnum> get values => _$librarySaveCreateTargetTypeEnumValues;
  static LibrarySaveCreateTargetTypeEnum valueOf(String name) => _$librarySaveCreateTargetTypeEnumValueOf(name);
}

