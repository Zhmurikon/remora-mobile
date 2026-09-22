//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/report_reason.dart';
import 'package:remora_api/src/model/report_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_submitted.g.dart';

/// Автору жалобы возвращаем только факт приёма, без внутренней кухни модерации.
///
/// Properties:
/// * [createdAt] 
/// * [id] 
/// * [reason] 
/// * [status] 
@BuiltValue()
abstract class ReportSubmitted implements Built<ReportSubmitted, ReportSubmittedBuilder> {
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'reason')
  ReportReason get reason;
  // enum reasonEnum {  spam,  misleading,  copyright,  offensive,  adult,  other,  };

  @BuiltValueField(wireName: r'status')
  ReportStatus get status;
  // enum statusEnum {  open,  accepted,  rejected,  };

  ReportSubmitted._();

  factory ReportSubmitted([void updates(ReportSubmittedBuilder b)]) = _$ReportSubmitted;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportSubmittedBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportSubmitted> get serializer => _$ReportSubmittedSerializer();
}

class _$ReportSubmittedSerializer implements PrimitiveSerializer<ReportSubmitted> {
  @override
  final Iterable<Type> types = const [ReportSubmitted, _$ReportSubmitted];

  @override
  final String wireName = r'ReportSubmitted';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportSubmitted object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ReportReason),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ReportStatus),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportSubmitted object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportSubmittedBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportReason),
          ) as ReportReason;
          result.reason = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportStatus),
          ) as ReportStatus;
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
  ReportSubmitted deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportSubmittedBuilder();
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


