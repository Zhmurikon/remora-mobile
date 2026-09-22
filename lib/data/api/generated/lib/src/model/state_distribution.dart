//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state_distribution.g.dart';

/// StateDistribution
///
/// Properties:
/// * [learning] 
/// * [new_] 
/// * [relearning] 
/// * [review] 
@BuiltValue()
abstract class StateDistribution implements Built<StateDistribution, StateDistributionBuilder> {
  @BuiltValueField(wireName: r'learning')
  int? get learning;

  @BuiltValueField(wireName: r'new')
  int? get new_;

  @BuiltValueField(wireName: r'relearning')
  int? get relearning;

  @BuiltValueField(wireName: r'review')
  int? get review;

  StateDistribution._();

  factory StateDistribution([void updates(StateDistributionBuilder b)]) = _$StateDistribution;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StateDistributionBuilder b) => b
      ..learning = 0
      ..new_ = 0
      ..relearning = 0
      ..review = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<StateDistribution> get serializer => _$StateDistributionSerializer();
}

class _$StateDistributionSerializer implements PrimitiveSerializer<StateDistribution> {
  @override
  final Iterable<Type> types = const [StateDistribution, _$StateDistribution];

  @override
  final String wireName = r'StateDistribution';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StateDistribution object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.learning != null) {
      yield r'learning';
      yield serializers.serialize(
        object.learning,
        specifiedType: const FullType(int),
      );
    }
    if (object.new_ != null) {
      yield r'new';
      yield serializers.serialize(
        object.new_,
        specifiedType: const FullType(int),
      );
    }
    if (object.relearning != null) {
      yield r'relearning';
      yield serializers.serialize(
        object.relearning,
        specifiedType: const FullType(int),
      );
    }
    if (object.review != null) {
      yield r'review';
      yield serializers.serialize(
        object.review,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StateDistribution object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StateDistributionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'learning':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.learning = valueDes;
          break;
        case r'new':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.new_ = valueDes;
          break;
        case r'relearning':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.relearning = valueDes;
          break;
        case r'review':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.review = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StateDistribution deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StateDistributionBuilder();
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


