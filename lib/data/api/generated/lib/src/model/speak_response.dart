//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'speak_response.g.dart';

/// SpeakResponse
///
/// Properties:
/// * [audioUrl] 
/// * [cached] 
/// * [lang] 
/// * [voice] 
@BuiltValue()
abstract class SpeakResponse implements Built<SpeakResponse, SpeakResponseBuilder> {
  @BuiltValueField(wireName: r'audio_url')
  String get audioUrl;

  @BuiltValueField(wireName: r'cached')
  bool get cached;

  @BuiltValueField(wireName: r'lang')
  String get lang;

  @BuiltValueField(wireName: r'voice')
  String get voice;

  SpeakResponse._();

  factory SpeakResponse([void updates(SpeakResponseBuilder b)]) = _$SpeakResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SpeakResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SpeakResponse> get serializer => _$SpeakResponseSerializer();
}

class _$SpeakResponseSerializer implements PrimitiveSerializer<SpeakResponse> {
  @override
  final Iterable<Type> types = const [SpeakResponse, _$SpeakResponse];

  @override
  final String wireName = r'SpeakResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SpeakResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'audio_url';
    yield serializers.serialize(
      object.audioUrl,
      specifiedType: const FullType(String),
    );
    yield r'cached';
    yield serializers.serialize(
      object.cached,
      specifiedType: const FullType(bool),
    );
    yield r'lang';
    yield serializers.serialize(
      object.lang,
      specifiedType: const FullType(String),
    );
    yield r'voice';
    yield serializers.serialize(
      object.voice,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SpeakResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SpeakResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'audio_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.audioUrl = valueDes;
          break;
        case r'cached':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.cached = valueDes;
          break;
        case r'lang':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lang = valueDes;
          break;
        case r'voice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.voice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SpeakResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpeakResponseBuilder();
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


