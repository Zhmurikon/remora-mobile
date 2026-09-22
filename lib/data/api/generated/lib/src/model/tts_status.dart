//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tts_status.g.dart';

/// TtsStatus
///
/// Properties:
/// * [available] 
/// * [charsUsedThisMonth] 
/// * [voices] 
@BuiltValue()
abstract class TtsStatus implements Built<TtsStatus, TtsStatusBuilder> {
  @BuiltValueField(wireName: r'available')
  bool get available;

  @BuiltValueField(wireName: r'chars_used_this_month')
  int get charsUsedThisMonth;

  @BuiltValueField(wireName: r'voices')
  BuiltMap<String, String> get voices;

  TtsStatus._();

  factory TtsStatus([void updates(TtsStatusBuilder b)]) = _$TtsStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TtsStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TtsStatus> get serializer => _$TtsStatusSerializer();
}

class _$TtsStatusSerializer implements PrimitiveSerializer<TtsStatus> {
  @override
  final Iterable<Type> types = const [TtsStatus, _$TtsStatus];

  @override
  final String wireName = r'TtsStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TtsStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'available';
    yield serializers.serialize(
      object.available,
      specifiedType: const FullType(bool),
    );
    yield r'chars_used_this_month';
    yield serializers.serialize(
      object.charsUsedThisMonth,
      specifiedType: const FullType(int),
    );
    yield r'voices';
    yield serializers.serialize(
      object.voices,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TtsStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TtsStatusBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'available':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.available = valueDes;
          break;
        case r'chars_used_this_month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.charsUsedThisMonth = valueDes;
          break;
        case r'voices':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.voices.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TtsStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TtsStatusBuilder();
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


