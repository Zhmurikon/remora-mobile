//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_change_request.g.dart';

/// PasswordChangeRequest
///
/// Properties:
/// * [currentPassword] 
/// * [newPassword] 
@BuiltValue()
abstract class PasswordChangeRequest implements Built<PasswordChangeRequest, PasswordChangeRequestBuilder> {
  @BuiltValueField(wireName: r'current_password')
  String get currentPassword;

  @BuiltValueField(wireName: r'new_password')
  String get newPassword;

  PasswordChangeRequest._();

  factory PasswordChangeRequest([void updates(PasswordChangeRequestBuilder b)]) = _$PasswordChangeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordChangeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordChangeRequest> get serializer => _$PasswordChangeRequestSerializer();
}

class _$PasswordChangeRequestSerializer implements PrimitiveSerializer<PasswordChangeRequest> {
  @override
  final Iterable<Type> types = const [PasswordChangeRequest, _$PasswordChangeRequest];

  @override
  final String wireName = r'PasswordChangeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordChangeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'current_password';
    yield serializers.serialize(
      object.currentPassword,
      specifiedType: const FullType(String),
    );
    yield r'new_password';
    yield serializers.serialize(
      object.newPassword,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordChangeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PasswordChangeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'current_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currentPassword = valueDes;
          break;
        case r'new_password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordChangeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordChangeRequestBuilder();
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


