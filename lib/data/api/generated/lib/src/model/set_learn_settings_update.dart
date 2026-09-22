//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/learn_question_type.dart';
import 'package:remora_api/src/model/learn_typing_check.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_learn_settings_update.g.dart';

/// SetLearnSettingsUpdate
///
/// Properties:
/// * [matchPercent] 
/// * [questionTypes] 
/// * [successesRequired] 
/// * [typingCheck] 
@BuiltValue()
abstract class SetLearnSettingsUpdate implements Built<SetLearnSettingsUpdate, SetLearnSettingsUpdateBuilder> {
  @BuiltValueField(wireName: r'match_percent')
  int get matchPercent;

  @BuiltValueField(wireName: r'question_types')
  BuiltList<LearnQuestionType> get questionTypes;

  @BuiltValueField(wireName: r'successes_required')
  int get successesRequired;

  @BuiltValueField(wireName: r'typing_check')
  LearnTypingCheck get typingCheck;
  // enum typingCheckEnum {  automatic,  self_check,  };

  SetLearnSettingsUpdate._();

  factory SetLearnSettingsUpdate([void updates(SetLearnSettingsUpdateBuilder b)]) = _$SetLearnSettingsUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetLearnSettingsUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetLearnSettingsUpdate> get serializer => _$SetLearnSettingsUpdateSerializer();
}

class _$SetLearnSettingsUpdateSerializer implements PrimitiveSerializer<SetLearnSettingsUpdate> {
  @override
  final Iterable<Type> types = const [SetLearnSettingsUpdate, _$SetLearnSettingsUpdate];

  @override
  final String wireName = r'SetLearnSettingsUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetLearnSettingsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'match_percent';
    yield serializers.serialize(
      object.matchPercent,
      specifiedType: const FullType(int),
    );
    yield r'question_types';
    yield serializers.serialize(
      object.questionTypes,
      specifiedType: const FullType(BuiltList, [FullType(LearnQuestionType)]),
    );
    yield r'successes_required';
    yield serializers.serialize(
      object.successesRequired,
      specifiedType: const FullType(int),
    );
    yield r'typing_check';
    yield serializers.serialize(
      object.typingCheck,
      specifiedType: const FullType(LearnTypingCheck),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SetLearnSettingsUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetLearnSettingsUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'match_percent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.matchPercent = valueDes;
          break;
        case r'question_types':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(LearnQuestionType)]),
          ) as BuiltList<LearnQuestionType>;
          result.questionTypes.replace(valueDes);
          break;
        case r'successes_required':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.successesRequired = valueDes;
          break;
        case r'typing_check':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LearnTypingCheck),
          ) as LearnTypingCheck;
          result.typingCheck = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetLearnSettingsUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetLearnSettingsUpdateBuilder();
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


