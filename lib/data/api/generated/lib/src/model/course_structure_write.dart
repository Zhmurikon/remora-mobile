//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/section_write.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_structure_write.g.dart';

/// CourseStructureWrite
///
/// Properties:
/// * [revision] 
/// * [sections] 
@BuiltValue()
abstract class CourseStructureWrite implements Built<CourseStructureWrite, CourseStructureWriteBuilder> {
  @BuiltValueField(wireName: r'revision')
  String get revision;

  @BuiltValueField(wireName: r'sections')
  BuiltList<SectionWrite> get sections;

  CourseStructureWrite._();

  factory CourseStructureWrite([void updates(CourseStructureWriteBuilder b)]) = _$CourseStructureWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseStructureWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseStructureWrite> get serializer => _$CourseStructureWriteSerializer();
}

class _$CourseStructureWriteSerializer implements PrimitiveSerializer<CourseStructureWrite> {
  @override
  final Iterable<Type> types = const [CourseStructureWrite, _$CourseStructureWrite];

  @override
  final String wireName = r'CourseStructureWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseStructureWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'revision';
    yield serializers.serialize(
      object.revision,
      specifiedType: const FullType(String),
    );
    yield r'sections';
    yield serializers.serialize(
      object.sections,
      specifiedType: const FullType(BuiltList, [FullType(SectionWrite)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseStructureWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseStructureWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
          break;
        case r'sections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SectionWrite)]),
          ) as BuiltList<SectionWrite>;
          result.sections.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseStructureWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseStructureWriteBuilder();
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


