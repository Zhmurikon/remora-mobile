//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:remora_api/src/model/problem_card.dart';
import 'package:remora_api/src/model/forecast_day.dart';
import 'package:remora_api/src/model/state_distribution.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_stats.g.dart';

/// SetStats
///
/// Properties:
/// * [cardsTotal] 
/// * [distribution] 
/// * [dueNow] 
/// * [forecast] 
/// * [lastStudiedAt] 
/// * [learningCount] 
/// * [masteredCount] 
/// * [masteryPercent] 
/// * [notStartedCount] 
/// * [problemCards] 
/// * [setId] 
@BuiltValue()
abstract class SetStats implements Built<SetStats, SetStatsBuilder> {
  @BuiltValueField(wireName: r'cards_total')
  int get cardsTotal;

  @BuiltValueField(wireName: r'distribution')
  StateDistribution get distribution;

  @BuiltValueField(wireName: r'due_now')
  int get dueNow;

  @BuiltValueField(wireName: r'forecast')
  BuiltList<ForecastDay> get forecast;

  @BuiltValueField(wireName: r'last_studied_at')
  DateTime? get lastStudiedAt;

  @BuiltValueField(wireName: r'learning_count')
  int get learningCount;

  @BuiltValueField(wireName: r'mastered_count')
  int get masteredCount;

  @BuiltValueField(wireName: r'mastery_percent')
  num get masteryPercent;

  @BuiltValueField(wireName: r'not_started_count')
  int get notStartedCount;

  @BuiltValueField(wireName: r'problem_cards')
  BuiltList<ProblemCard> get problemCards;

  @BuiltValueField(wireName: r'set_id')
  String get setId;

  SetStats._();

  factory SetStats([void updates(SetStatsBuilder b)]) = _$SetStats;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetStatsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetStats> get serializer => _$SetStatsSerializer();
}

class _$SetStatsSerializer implements PrimitiveSerializer<SetStats> {
  @override
  final Iterable<Type> types = const [SetStats, _$SetStats];

  @override
  final String wireName = r'SetStats';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetStats object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cards_total';
    yield serializers.serialize(
      object.cardsTotal,
      specifiedType: const FullType(int),
    );
    yield r'distribution';
    yield serializers.serialize(
      object.distribution,
      specifiedType: const FullType(StateDistribution),
    );
    yield r'due_now';
    yield serializers.serialize(
      object.dueNow,
      specifiedType: const FullType(int),
    );
    yield r'forecast';
    yield serializers.serialize(
      object.forecast,
      specifiedType: const FullType(BuiltList, [FullType(ForecastDay)]),
    );
    yield r'last_studied_at';
    yield object.lastStudiedAt == null ? null : serializers.serialize(
      object.lastStudiedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'learning_count';
    yield serializers.serialize(
      object.learningCount,
      specifiedType: const FullType(int),
    );
    yield r'mastered_count';
    yield serializers.serialize(
      object.masteredCount,
      specifiedType: const FullType(int),
    );
    yield r'mastery_percent';
    yield serializers.serialize(
      object.masteryPercent,
      specifiedType: const FullType(num),
    );
    yield r'not_started_count';
    yield serializers.serialize(
      object.notStartedCount,
      specifiedType: const FullType(int),
    );
    yield r'problem_cards';
    yield serializers.serialize(
      object.problemCards,
      specifiedType: const FullType(BuiltList, [FullType(ProblemCard)]),
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
    SetStats object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetStatsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsTotal = valueDes;
          break;
        case r'distribution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StateDistribution),
          ) as StateDistribution;
          result.distribution.replace(valueDes);
          break;
        case r'due_now':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dueNow = valueDes;
          break;
        case r'forecast':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ForecastDay)]),
          ) as BuiltList<ForecastDay>;
          result.forecast.replace(valueDes);
          break;
        case r'last_studied_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastStudiedAt = valueDes;
          break;
        case r'learning_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.learningCount = valueDes;
          break;
        case r'mastered_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.masteredCount = valueDes;
          break;
        case r'mastery_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.masteryPercent = valueDes;
          break;
        case r'not_started_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.notStartedCount = valueDes;
          break;
        case r'problem_cards':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ProblemCard)]),
          ) as BuiltList<ProblemCard>;
          result.problemCards.replace(valueDes);
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
  SetStats deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetStatsBuilder();
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


