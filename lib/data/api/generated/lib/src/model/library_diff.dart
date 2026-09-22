//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'library_diff.g.dart';

/// LibraryDiff
///
/// Properties:
/// * [acceptedAt] 
/// * [articlesAdded] 
/// * [articlesChanged] 
/// * [articlesRemoved] 
/// * [cardsAdded] 
/// * [cardsChanged] 
/// * [cardsRemoved] 
/// * [hasUpdates] 
/// * [saveId] 
/// * [summary] 
@BuiltValue()
abstract class LibraryDiff implements Built<LibraryDiff, LibraryDiffBuilder> {
  @BuiltValueField(wireName: r'accepted_at')
  DateTime get acceptedAt;

  @BuiltValueField(wireName: r'articles_added')
  int? get articlesAdded;

  @BuiltValueField(wireName: r'articles_changed')
  int? get articlesChanged;

  @BuiltValueField(wireName: r'articles_removed')
  int? get articlesRemoved;

  @BuiltValueField(wireName: r'cards_added')
  int? get cardsAdded;

  @BuiltValueField(wireName: r'cards_changed')
  int? get cardsChanged;

  @BuiltValueField(wireName: r'cards_removed')
  int? get cardsRemoved;

  @BuiltValueField(wireName: r'has_updates')
  bool get hasUpdates;

  @BuiltValueField(wireName: r'save_id')
  String get saveId;

  @BuiltValueField(wireName: r'summary')
  BuiltList<String> get summary;

  LibraryDiff._();

  factory LibraryDiff([void updates(LibraryDiffBuilder b)]) = _$LibraryDiff;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LibraryDiffBuilder b) => b
      ..articlesAdded = 0
      ..articlesChanged = 0
      ..articlesRemoved = 0
      ..cardsAdded = 0
      ..cardsChanged = 0
      ..cardsRemoved = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<LibraryDiff> get serializer => _$LibraryDiffSerializer();
}

class _$LibraryDiffSerializer implements PrimitiveSerializer<LibraryDiff> {
  @override
  final Iterable<Type> types = const [LibraryDiff, _$LibraryDiff];

  @override
  final String wireName = r'LibraryDiff';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LibraryDiff object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accepted_at';
    yield serializers.serialize(
      object.acceptedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.articlesAdded != null) {
      yield r'articles_added';
      yield serializers.serialize(
        object.articlesAdded,
        specifiedType: const FullType(int),
      );
    }
    if (object.articlesChanged != null) {
      yield r'articles_changed';
      yield serializers.serialize(
        object.articlesChanged,
        specifiedType: const FullType(int),
      );
    }
    if (object.articlesRemoved != null) {
      yield r'articles_removed';
      yield serializers.serialize(
        object.articlesRemoved,
        specifiedType: const FullType(int),
      );
    }
    if (object.cardsAdded != null) {
      yield r'cards_added';
      yield serializers.serialize(
        object.cardsAdded,
        specifiedType: const FullType(int),
      );
    }
    if (object.cardsChanged != null) {
      yield r'cards_changed';
      yield serializers.serialize(
        object.cardsChanged,
        specifiedType: const FullType(int),
      );
    }
    if (object.cardsRemoved != null) {
      yield r'cards_removed';
      yield serializers.serialize(
        object.cardsRemoved,
        specifiedType: const FullType(int),
      );
    }
    yield r'has_updates';
    yield serializers.serialize(
      object.hasUpdates,
      specifiedType: const FullType(bool),
    );
    yield r'save_id';
    yield serializers.serialize(
      object.saveId,
      specifiedType: const FullType(String),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LibraryDiff object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LibraryDiffBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accepted_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.acceptedAt = valueDes;
          break;
        case r'articles_added':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.articlesAdded = valueDes;
          break;
        case r'articles_changed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.articlesChanged = valueDes;
          break;
        case r'articles_removed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.articlesRemoved = valueDes;
          break;
        case r'cards_added':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.cardsAdded = valueDes;
          break;
        case r'cards_changed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.cardsChanged = valueDes;
          break;
        case r'cards_removed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.cardsRemoved = valueDes;
          break;
        case r'has_updates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasUpdates = valueDes;
          break;
        case r'save_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.saveId = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.summary.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LibraryDiff deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LibraryDiffBuilder();
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


