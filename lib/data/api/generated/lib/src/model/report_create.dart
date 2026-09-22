//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/report_reason.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_create.g.dart';

/// ReportCreate
///
/// Properties:
/// * [comment] 
/// * [reason] 
@BuiltValue()
abstract class ReportCreate implements Built<ReportCreate, ReportCreateBuilder> {
  @BuiltValueField(wireName: r'comment')
  String? get comment;

  @BuiltValueField(wireName: r'reason')
  ReportReason get reason;
  // enum reasonEnum {  spam,  misleading,  copyright,  offensive,  adult,  other,  };

  ReportCreate._();

  factory ReportCreate([void updates(ReportCreateBuilder b)]) = _$ReportCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportCreateBuilder b) => b
      ..comment = '';

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportCreate> get serializer => _$ReportCreateSerializer();
}

class _$ReportCreateSerializer implements PrimitiveSerializer<ReportCreate> {
  @override
  final Iterable<Type> types = const [ReportCreate, _$ReportCreate];

  @override
  final String wireName = r'ReportCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ReportReason),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.comment = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportReason),
          ) as ReportReason;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportCreateBuilder();
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


