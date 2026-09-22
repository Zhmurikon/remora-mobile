//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_token_create.g.dart';

/// ApiTokenCreate
///
/// Properties:
/// * [expiresInDays] 
/// * [name] 
/// * [scopes] 
@BuiltValue()
abstract class ApiTokenCreate implements Built<ApiTokenCreate, ApiTokenCreateBuilder> {
  @BuiltValueField(wireName: r'expires_in_days')
  int? get expiresInDays;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'scopes')
  BuiltList<ApiTokenCreateScopesEnum>? get scopes;
  // enum scopesEnum {  materials:read,  materials:write,  courses:publish,  };

  ApiTokenCreate._();

  factory ApiTokenCreate([void updates(ApiTokenCreateBuilder b)]) = _$ApiTokenCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiTokenCreateBuilder b) => b
      ..expiresInDays = 90;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiTokenCreate> get serializer => _$ApiTokenCreateSerializer();
}

class _$ApiTokenCreateSerializer implements PrimitiveSerializer<ApiTokenCreate> {
  @override
  final Iterable<Type> types = const [ApiTokenCreate, _$ApiTokenCreate];

  @override
  final String wireName = r'ApiTokenCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiTokenCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.expiresInDays != null) {
      yield r'expires_in_days';
      yield serializers.serialize(
        object.expiresInDays,
        specifiedType: const FullType(int),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.scopes != null) {
      yield r'scopes';
      yield serializers.serialize(
        object.scopes,
        specifiedType: const FullType(BuiltList, [FullType(ApiTokenCreateScopesEnum)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiTokenCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiTokenCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expires_in_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.expiresInDays = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'scopes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ApiTokenCreateScopesEnum)]),
          ) as BuiltList<ApiTokenCreateScopesEnum>?;
          if (valueDes == null) continue;
          result.scopes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiTokenCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiTokenCreateBuilder();
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


class ApiTokenCreateScopesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'materials:read')
  static const ApiTokenCreateScopesEnum materialsColonRead = _$apiTokenCreateScopesEnum_materialsColonRead;
  @BuiltValueEnumConst(wireName: r'materials:write')
  static const ApiTokenCreateScopesEnum materialsColonWrite = _$apiTokenCreateScopesEnum_materialsColonWrite;
  @BuiltValueEnumConst(wireName: r'courses:publish')
  static const ApiTokenCreateScopesEnum coursesColonPublish = _$apiTokenCreateScopesEnum_coursesColonPublish;

  static Serializer<ApiTokenCreateScopesEnum> get serializer => _$apiTokenCreateScopesEnumSerializer;

  const ApiTokenCreateScopesEnum._(String name): super(name);

  static BuiltSet<ApiTokenCreateScopesEnum> get values => _$apiTokenCreateScopesEnumValues;
  static ApiTokenCreateScopesEnum valueOf(String name) => _$apiTokenCreateScopesEnumValueOf(name);
}

