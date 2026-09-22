//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'author_stats.g.dart';

/// AuthorStats
///
/// Properties:
/// * [cardsStudied] 
/// * [currentStreakDays] 
/// * [likesReceived] 
/// * [publications] 
/// * [savesReceived] 
@BuiltValue()
abstract class AuthorStats implements Built<AuthorStats, AuthorStatsBuilder> {
  @BuiltValueField(wireName: r'cards_studied')
  int get cardsStudied;

  @BuiltValueField(wireName: r'current_streak_days')
  int get currentStreakDays;

  @BuiltValueField(wireName: r'likes_received')
  int get likesReceived;

  @BuiltValueField(wireName: r'publications')
  int get publications;

  @BuiltValueField(wireName: r'saves_received')
  int get savesReceived;

  AuthorStats._();

  factory AuthorStats([void updates(AuthorStatsBuilder b)]) = _$AuthorStats;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthorStatsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthorStats> get serializer => _$AuthorStatsSerializer();
}

class _$AuthorStatsSerializer implements PrimitiveSerializer<AuthorStats> {
  @override
  final Iterable<Type> types = const [AuthorStats, _$AuthorStats];

  @override
  final String wireName = r'AuthorStats';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthorStats object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cards_studied';
    yield serializers.serialize(
      object.cardsStudied,
      specifiedType: const FullType(int),
    );
    yield r'current_streak_days';
    yield serializers.serialize(
      object.currentStreakDays,
      specifiedType: const FullType(int),
    );
    yield r'likes_received';
    yield serializers.serialize(
      object.likesReceived,
      specifiedType: const FullType(int),
    );
    yield r'publications';
    yield serializers.serialize(
      object.publications,
      specifiedType: const FullType(int),
    );
    yield r'saves_received';
    yield serializers.serialize(
      object.savesReceived,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthorStats object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthorStatsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cards_studied':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cardsStudied = valueDes;
          break;
        case r'current_streak_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.currentStreakDays = valueDes;
          break;
        case r'likes_received':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.likesReceived = valueDes;
          break;
        case r'publications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.publications = valueDes;
          break;
        case r'saves_received':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.savesReceived = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthorStats deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthorStatsBuilder();
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


