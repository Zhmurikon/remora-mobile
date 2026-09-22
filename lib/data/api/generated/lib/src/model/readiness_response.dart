//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'readiness_response.g.dart';

/// ReadinessResponse
///
/// Properties:
/// * [checks] 
/// * [status] 
@BuiltValue()
abstract class ReadinessResponse implements Built<ReadinessResponse, ReadinessResponseBuilder> {
  @BuiltValueField(wireName: r'checks')
  BuiltMap<String, String> get checks;

  @BuiltValueField(wireName: r'status')
  ReadinessResponseStatusEnum get status;
  // enum statusEnum {  ok,  degraded,  };

  ReadinessResponse._();

  factory ReadinessResponse([void updates(ReadinessResponseBuilder b)]) = _$ReadinessResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReadinessResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReadinessResponse> get serializer => _$ReadinessResponseSerializer();
}

class _$ReadinessResponseSerializer implements PrimitiveSerializer<ReadinessResponse> {
  @override
  final Iterable<Type> types = const [ReadinessResponse, _$ReadinessResponse];

  @override
  final String wireName = r'ReadinessResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReadinessResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'checks';
    yield serializers.serialize(
      object.checks,
      specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ReadinessResponseStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReadinessResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReadinessResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'checks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.checks.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReadinessResponseStatusEnum),
          ) as ReadinessResponseStatusEnum;
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
  ReadinessResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReadinessResponseBuilder();
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


class ReadinessResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ok')
  static const ReadinessResponseStatusEnum ok = _$readinessResponseStatusEnum_ok;
  @BuiltValueEnumConst(wireName: r'degraded')
  static const ReadinessResponseStatusEnum degraded = _$readinessResponseStatusEnum_degraded;

  static Serializer<ReadinessResponseStatusEnum> get serializer => _$readinessResponseStatusEnumSerializer;

  const ReadinessResponseStatusEnum._(String name): super(name);

  static BuiltSet<ReadinessResponseStatusEnum> get values => _$readinessResponseStatusEnumValues;
  static ReadinessResponseStatusEnum valueOf(String name) => _$readinessResponseStatusEnumValueOf(name);
}

