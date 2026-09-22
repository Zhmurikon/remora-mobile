//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_confirm_request.g.dart';

/// PasswordResetConfirmRequest
///
/// Properties:
/// * [newPassword] 
/// * [token] 
@BuiltValue()
abstract class PasswordResetConfirmRequest implements Built<PasswordResetConfirmRequest, PasswordResetConfirmRequestBuilder> {
  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  @BuiltValueField(wireName: r'token')
  String get token;

  PasswordResetConfirmRequest._();

  factory PasswordResetConfirmRequest([void updates(PasswordResetConfirmRequestBuilder b)]) = _$PasswordResetConfirmRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetConfirmRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetConfirmRequest> get serializer => _$PasswordResetConfirmRequestSerializer();
}

class _$PasswordResetConfirmRequestSerializer implements PrimitiveSerializer<PasswordResetConfirmRequest> {
  @override
  final Iterable<Type> types = const [PasswordResetConfirmRequest, _$PasswordResetConfirmRequest];

  @override
  final String wireName = r'PasswordResetConfirmRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetConfirmRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'new_password';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordResetConfirmRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PasswordResetConfirmRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'new_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newPassword = valueDes;
          break;
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordResetConfirmRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetConfirmRequestBuilder();
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


