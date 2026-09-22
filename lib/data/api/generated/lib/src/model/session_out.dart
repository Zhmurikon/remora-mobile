//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/study_mode.dart';
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/session_status.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_out.g.dart';

/// SessionOut
///
/// Properties:
/// * [cardsCorrect] 
/// * [cardsSeen] 
/// * [config] 
/// * [endedAt] 
/// * [id] 
/// * [mode] 
/// * [setId] 
/// * [startedAt] 
/// * [status] 
@BuiltValue()
abstract class SessionOut implements Built<SessionOut, SessionOutBuilder> {
  @BuiltValueField(wireName: r'cards_correct')
  int get cardsCorrect;

  @BuiltValueField(wireName: r'cards_seen')
  int get cardsSeen;

  @BuiltValueField(wireName: r'config')
  BuiltMap<String, JsonObject?> get config;

  @BuiltValueField(wireName: r'ended_at')
  DateTime? get endedAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'mode')
  StudyMode get mode;
  // enum modeEnum {  flashcards,  learn,  test,  write,  listen,  };

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  @BuiltValueField(wireName: r'started_at')
  DateTime get startedAt;

  @BuiltValueField(wireName: r'status')
  SessionStatus get status;
  // enum statusEnum {  active,  finished,  abandoned,  };

  SessionOut._();

  factory SessionOut([void updates(SessionOutBuilder b)]) = _$SessionOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionOut> get serializer => _$SessionOutSerializer();
}

class _$SessionOutSerializer implements PrimitiveSerializer<SessionOut> {
  @override
  final Iterable<Type> types = const [SessionOut, _$SessionOut];

  @override
  final String wireName = r'SessionOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cards_correct';
    yield serializers.serialize(
      object.cardsCorrect,
      specifiedType: const FullType(int),
    );
    yield r'cards_seen';
    yield serializers.serialize(
      object.cardsSeen,
      specifiedType: const FullType(int),
    );
    yield r'config';
    yield serializers.serialize(
      object.config,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
    );
    yield r'ended_at';
    yield object.endedAt == null ? null : serializers.serialize(
      object.endedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
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
    yield r'started_at';
    yield serializers.serialize(
      object.startedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(SessionStatus),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SessionOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards_correct':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsCorrect = valueDes;
          break;
        case r'cards_seen':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsSeen = valueDes;
          break;
        case r'config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>;
          result.config.replace(valueDes);
          break;
        case r'ended_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endedAt = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
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
        case r'started_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startedAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SessionStatus),
          ) as SessionStatus;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionOutBuilder();
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


