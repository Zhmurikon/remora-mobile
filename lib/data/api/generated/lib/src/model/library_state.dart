//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'library_state.g.dart';

/// LibraryState
///
/// Properties:
/// * [courseSaved] 
/// * [savedArticleIds] 
/// * [savedSetIds] 
@BuiltValue()
abstract class LibraryState implements Built<LibraryState, LibraryStateBuilder> {
  @BuiltValueField(wireName: r'course_saved')
  bool get courseSaved;

  @BuiltValueField(wireName: r'saved_article_ids')
  BuiltList<String> get savedArticleIds;

  @BuiltValueField(wireName: r'saved_set_ids')
  BuiltList<String> get savedSetIds;

  LibraryState._();

  factory LibraryState([void updates(LibraryStateBuilder b)]) = _$LibraryState;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LibraryStateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LibraryState> get serializer => _$LibraryStateSerializer();
}

class _$LibraryStateSerializer implements PrimitiveSerializer<LibraryState> {
  @override
  final Iterable<Type> types = const [LibraryState, _$LibraryState];

  @override
  final String wireName = r'LibraryState';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LibraryState object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'course_saved';
    yield serializers.serialize(
      object.courseSaved,
      specifiedType: const FullType(bool),
    );
    yield r'saved_article_ids';
    yield serializers.serialize(
      object.savedArticleIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'saved_set_ids';
    yield serializers.serialize(
      object.savedSetIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LibraryState object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LibraryStateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'course_saved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.courseSaved = valueDes;
          break;
        case r'saved_article_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.savedArticleIds.replace(valueDes);
          break;
        case r'saved_set_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.savedSetIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LibraryState deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LibraryStateBuilder();
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


