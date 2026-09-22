//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_error_item.g.dart';

/// ImportErrorItem
///
/// Properties:
/// * [message] 
/// * [row] 
@BuiltValue()
abstract class ImportErrorItem implements Built<ImportErrorItem, ImportErrorItemBuilder> {
  @BuiltValueField(wireName: r'message')
  String get message;

  @BuiltValueField(wireName: r'row')
  int? get row;

  ImportErrorItem._();

  factory ImportErrorItem([void updates(ImportErrorItemBuilder b)]) = _$ImportErrorItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ImportErrorItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ImportErrorItem> get serializer => _$ImportErrorItemSerializer();
}

class _$ImportErrorItemSerializer implements PrimitiveSerializer<ImportErrorItem> {
  @override
  final Iterable<Type> types = const [ImportErrorItem, _$ImportErrorItem];

  @override
  final String wireName = r'ImportErrorItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ImportErrorItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    if (object.row != null) {
      yield r'row';
      yield serializers.serialize(
        object.row,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ImportErrorItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ImportErrorItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'row':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.row = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ImportErrorItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ImportErrorItemBuilder();
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


