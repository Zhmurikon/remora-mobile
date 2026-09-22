//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_resolution.g.dart';

/// `accepted` блокирует курс, `rejected` снимает подозрения и оставляет его доступным.
///
/// Properties:
/// * [outcome] 
@BuiltValue()
abstract class ReportResolution implements Built<ReportResolution, ReportResolutionBuilder> {
  @BuiltValueField(wireName: r'outcome')
  ReportResolutionOutcomeEnum get outcome;
  // enum outcomeEnum {  accepted,  rejected,  };

  ReportResolution._();

  factory ReportResolution([void updates(ReportResolutionBuilder b)]) = _$ReportResolution;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportResolutionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportResolution> get serializer => _$ReportResolutionSerializer();
}

class _$ReportResolutionSerializer implements PrimitiveSerializer<ReportResolution> {
  @override
  final Iterable<Type> types = const [ReportResolution, _$ReportResolution];

  @override
  final String wireName = r'ReportResolution';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportResolution object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'outcome';
    yield serializers.serialize(
      object.outcome,
      specifiedType: const FullType(ReportResolutionOutcomeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportResolution object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportResolutionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'outcome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportResolutionOutcomeEnum),
          ) as ReportResolutionOutcomeEnum;
          result.outcome = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportResolution deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportResolutionBuilder();
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


class ReportResolutionOutcomeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'accepted')
  static const ReportResolutionOutcomeEnum accepted = _$reportResolutionOutcomeEnum_accepted;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const ReportResolutionOutcomeEnum rejected = _$reportResolutionOutcomeEnum_rejected;

  static Serializer<ReportResolutionOutcomeEnum> get serializer => _$reportResolutionOutcomeEnumSerializer;

  const ReportResolutionOutcomeEnum._(String name): super(name);

  static BuiltSet<ReportResolutionOutcomeEnum> get values => _$reportResolutionOutcomeEnumValues;
  static ReportResolutionOutcomeEnum valueOf(String name) => _$reportResolutionOutcomeEnumValueOf(name);
}

