//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/import_error_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'anki_import_result.g.dart';

/// AnkiImportResult
///
/// Properties:
/// * [errors] 
/// * [importedCards] 
/// * [importedImages] 
/// * [skippedMedia] 
/// * [skippedNotes] 
/// * [warnings] 
@BuiltValue()
abstract class AnkiImportResult implements Built<AnkiImportResult, AnkiImportResultBuilder> {
  @BuiltValueField(wireName: r'errors')
  BuiltList<ImportErrorItem>? get errors;

  @BuiltValueField(wireName: r'imported_cards')
  int get importedCards;

  @BuiltValueField(wireName: r'imported_images')
  int get importedImages;

  @BuiltValueField(wireName: r'skipped_media')
  int get skippedMedia;

  @BuiltValueField(wireName: r'skipped_notes')
  int get skippedNotes;

  @BuiltValueField(wireName: r'warnings')
  BuiltList<String> get warnings;

  AnkiImportResult._();

  factory AnkiImportResult([void updates(AnkiImportResultBuilder b)]) = _$AnkiImportResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnkiImportResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnkiImportResult> get serializer => _$AnkiImportResultSerializer();
}

class _$AnkiImportResultSerializer implements PrimitiveSerializer<AnkiImportResult> {
  @override
  final Iterable<Type> types = const [AnkiImportResult, _$AnkiImportResult];

  @override
  final String wireName = r'AnkiImportResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnkiImportResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.errors != null) {
      yield r'errors';
      yield serializers.serialize(
        object.errors,
        specifiedType: const FullType(BuiltList, [FullType(ImportErrorItem)]),
      );
    }
    yield r'imported_cards';
    yield serializers.serialize(
      object.importedCards,
      specifiedType: const FullType(int),
    );
    yield r'imported_images';
    yield serializers.serialize(
      object.importedImages,
      specifiedType: const FullType(int),
    );
    yield r'skipped_media';
    yield serializers.serialize(
      object.skippedMedia,
      specifiedType: const FullType(int),
    );
    yield r'skipped_notes';
    yield serializers.serialize(
      object.skippedNotes,
      specifiedType: const FullType(int),
    );
    yield r'warnings';
    yield serializers.serialize(
      object.warnings,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnkiImportResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnkiImportResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'errors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ImportErrorItem)]),
          ) as BuiltList<ImportErrorItem>?;
          if (valueDes == null) continue;
          result.errors.replace(valueDes);
          break;
        case r'imported_cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.importedCards = valueDes;
          break;
        case r'imported_images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.importedImages = valueDes;
          break;
        case r'skipped_media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skippedMedia = valueDes;
          break;
        case r'skipped_notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skippedNotes = valueDes;
          break;
        case r'warnings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.warnings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnkiImportResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnkiImportResultBuilder();
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


