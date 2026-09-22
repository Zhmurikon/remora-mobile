//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/course_search_item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'course_search_result.g.dart';

/// CourseSearchResult
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class CourseSearchResult implements Built<CourseSearchResult, CourseSearchResultBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<CourseSearchItem> get items;

  @BuiltValueField(wireName: r'next_cursor')
  int? get nextCursor;

  CourseSearchResult._();

  factory CourseSearchResult([void updates(CourseSearchResultBuilder b)]) = _$CourseSearchResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CourseSearchResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CourseSearchResult> get serializer => _$CourseSearchResultSerializer();
}

class _$CourseSearchResultSerializer implements PrimitiveSerializer<CourseSearchResult> {
  @override
  final Iterable<Type> types = const [CourseSearchResult, _$CourseSearchResult];

  @override
  final String wireName = r'CourseSearchResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CourseSearchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(CourseSearchItem)]),
    );
    yield r'next_cursor';
    yield object.nextCursor == null ? null : serializers.serialize(
      object.nextCursor,
      specifiedType: const FullType.nullable(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CourseSearchResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CourseSearchResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CourseSearchItem)]),
          ) as BuiltList<CourseSearchItem>;
          result.items.replace(valueDes);
          break;
        case r'next_cursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CourseSearchResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CourseSearchResultBuilder();
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


