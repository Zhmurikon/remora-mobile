//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'agent_structure_delete.g.dart';

/// AgentStructureDelete
///
/// Properties:
/// * [confirm] 
/// * [revision] 
@BuiltValue()
abstract class AgentStructureDelete implements Built<AgentStructureDelete, AgentStructureDeleteBuilder> {
  @BuiltValueField(wireName: r'confirm')
  AgentStructureDeleteConfirmEnum get confirm;
  // enum confirmEnum {  true,  };

  @BuiltValueField(wireName: r'revision')
  String get revision;

  AgentStructureDelete._();

  factory AgentStructureDelete([void updates(AgentStructureDeleteBuilder b)]) = _$AgentStructureDelete;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AgentStructureDeleteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AgentStructureDelete> get serializer => _$AgentStructureDeleteSerializer();
}

class _$AgentStructureDeleteSerializer implements PrimitiveSerializer<AgentStructureDelete> {
  @override
  final Iterable<Type> types = const [AgentStructureDelete, _$AgentStructureDelete];

  @override
  final String wireName = r'AgentStructureDelete';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AgentStructureDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'confirm';
    yield serializers.serialize(
      object.confirm,
      specifiedType: const FullType(AgentStructureDeleteConfirmEnum),
    );
    yield r'revision';
    yield serializers.serialize(
      object.revision,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AgentStructureDelete object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AgentStructureDeleteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'confirm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AgentStructureDeleteConfirmEnum),
          ) as AgentStructureDeleteConfirmEnum;
          result.confirm = valueDes;
          break;
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AgentStructureDelete deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AgentStructureDeleteBuilder();
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


class AgentStructureDeleteConfirmEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'true')
  static const AgentStructureDeleteConfirmEnum true_ = _$agentStructureDeleteConfirmEnum_true_;

  static Serializer<AgentStructureDeleteConfirmEnum> get serializer => _$agentStructureDeleteConfirmEnumSerializer;

  const AgentStructureDeleteConfirmEnum._(String name): super(name);

  static BuiltSet<AgentStructureDeleteConfirmEnum> get values => _$agentStructureDeleteConfirmEnumValues;
  static AgentStructureDeleteConfirmEnum valueOf(String name) => _$agentStructureDeleteConfirmEnumValueOf(name);
}

