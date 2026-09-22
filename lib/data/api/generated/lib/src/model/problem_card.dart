//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'problem_card.g.dart';

/// ProblemCard
///
/// Properties:
/// * [cardId] 
/// * [definition] 
/// * [lapses] 
/// * [reps] 
/// * [retrievability] 
/// * [term] 
@BuiltValue()
abstract class ProblemCard implements Built<ProblemCard, ProblemCardBuilder> {
  @BuiltValueField(wireName: r'card_id')
  String get cardId;

  @BuiltValueField(wireName: r'definition')
  String get definition;

  @BuiltValueField(wireName: r'lapses')
  int get lapses;

  @BuiltValueField(wireName: r'reps')
  int get reps;

  @BuiltValueField(wireName: r'retrievability')
  num get retrievability;

  @BuiltValueField(wireName: r'term')
  String get term;

  ProblemCard._();

  factory ProblemCard([void updates(ProblemCardBuilder b)]) = _$ProblemCard;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProblemCardBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProblemCard> get serializer => _$ProblemCardSerializer();
}

class _$ProblemCardSerializer implements PrimitiveSerializer<ProblemCard> {
  @override
  final Iterable<Type> types = const [ProblemCard, _$ProblemCard];

  @override
  final String wireName = r'ProblemCard';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProblemCard object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'card_id';
    yield serializers.serialize(
      object.cardId,
      specifiedType: const FullType(String),
    );
    yield r'definition';
    yield serializers.serialize(
      object.definition,
      specifiedType: const FullType(String),
    );
    yield r'lapses';
    yield serializers.serialize(
      object.lapses,
      specifiedType: const FullType(int),
    );
    yield r'reps';
    yield serializers.serialize(
      object.reps,
      specifiedType: const FullType(int),
    );
    yield r'retrievability';
    yield serializers.serialize(
      object.retrievability,
      specifiedType: const FullType(num),
    );
    yield r'term';
    yield serializers.serialize(
      object.term,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProblemCard object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProblemCardBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'card_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cardId = valueDes;
          break;
        case r'definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.definition = valueDes;
          break;
        case r'lapses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.lapses = valueDes;
          break;
        case r'reps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.reps = valueDes;
          break;
        case r'retrievability':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.retrievability = valueDes;
          break;
        case r'term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.term = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProblemCard deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProblemCardBuilder();
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


