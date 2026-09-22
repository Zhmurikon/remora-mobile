//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/learn_question_type.dart';
import 'package:remora_api/src/model/learn_typing_check.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_learn_settings_out.g.dart';

/// SetLearnSettingsOut
///
/// Properties:
/// * [customized] 
/// * [matchPercent] 
/// * [questionTypes] 
/// * [successesRequired] 
/// * [typingCheck] 
@BuiltValue()
abstract class SetLearnSettingsOut implements Built<SetLearnSettingsOut, SetLearnSettingsOutBuilder> {
  @BuiltValueField(wireName: r'customized')
  bool get customized;

  @BuiltValueField(wireName: r'match_percent')
  int get matchPercent;

  @BuiltValueField(wireName: r'question_types')
  BuiltList<LearnQuestionType> get questionTypes;

  @BuiltValueField(wireName: r'successes_required')
  int get successesRequired;

  @BuiltValueField(wireName: r'typing_check')
  LearnTypingCheck get typingCheck;
  // enum typingCheckEnum {  automatic,  self_check,  };

  SetLearnSettingsOut._();

  factory SetLearnSettingsOut([void updates(SetLearnSettingsOutBuilder b)]) = _$SetLearnSettingsOut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetLearnSettingsOutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetLearnSettingsOut> get serializer => _$SetLearnSettingsOutSerializer();
}

class _$SetLearnSettingsOutSerializer implements PrimitiveSerializer<SetLearnSettingsOut> {
  @override
  final Iterable<Type> types = const [SetLearnSettingsOut, _$SetLearnSettingsOut];

  @override
  final String wireName = r'SetLearnSettingsOut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetLearnSettingsOut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'customized';
    yield serializers.serialize(
      object.customized,
      specifiedType: const FullType(bool),
    );
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
    SetLearnSettingsOut object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetLearnSettingsOutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'customized':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.customized = valueDes;
          break;
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
  SetLearnSettingsOut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetLearnSettingsOutBuilder();
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


