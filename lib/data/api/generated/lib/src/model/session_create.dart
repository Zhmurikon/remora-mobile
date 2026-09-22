//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_mode.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_create.g.dart';

/// SessionCreate
///
/// Properties:
/// * [config] 
/// * [mode] 
/// * [setId] 
@BuiltValue()
abstract class SessionCreate implements Built<SessionCreate, SessionCreateBuilder> {
  @BuiltValueField(wireName: r'config')
  BuiltMap<String, JsonObject?>? get config;

  @BuiltValueField(wireName: r'mode')
  StudyMode get mode;
  // enum modeEnum {  flashcards,  learn,  test,  write,  listen,  };

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  SessionCreate._();

  factory SessionCreate([void updates(SessionCreateBuilder b)]) = _$SessionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionCreate> get serializer => _$SessionCreateSerializer();
}

class _$SessionCreateSerializer implements PrimitiveSerializer<SessionCreate> {
  @override
  final Iterable<Type> types = const [SessionCreate, _$SessionCreate];

  @override
  final String wireName = r'SessionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.config != null) {
      yield r'config';
      yield serializers.serialize(
        object.config,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(StudyMode),
    );
    yield r'set_id';
    yield serializers.serialize(
      object.setId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SessionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.config.replace(valueDes);
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StudyMode),
          ) as StudyMode;
          result.mode = valueDes;
          break;
        case r'set_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.setId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionCreateBuilder();
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


