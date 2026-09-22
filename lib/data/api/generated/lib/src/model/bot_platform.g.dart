// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_platform.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BotPlatform _$telegram = const BotPlatform._('telegram');
const BotPlatform _$vk = const BotPlatform._('vk');

BotPlatform _$valueOf(String name) {
  switch (name) {
    case 'telegram':
      return _$telegram;
    case 'vk':
      return _$vk;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<BotPlatform> _$values =
    BuiltSet<BotPlatform>(const <BotPlatform>[
  _$telegram,
  _$vk,
]);

class _$BotPlatformMeta {
  const _$BotPlatformMeta();
  BotPlatform get telegram => _$telegram;
  BotPlatform get vk => _$vk;
  BotPlatform valueOf(String name) => _$valueOf(name);
  BuiltSet<BotPlatform> get values => _$values;
}

abstract class _$BotPlatformMixin {
  // ignore: non_constant_identifier_names
  _$BotPlatformMeta get BotPlatform => const _$BotPlatformMeta();
}

Serializer<BotPlatform> _$botPlatformSerializer = _$BotPlatformSerializer();

class _$BotPlatformSerializer implements PrimitiveSerializer<BotPlatform> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'telegram': 'telegram',
    'vk': 'vk',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'telegram': 'telegram',
    'vk': 'vk',
  };

  @override
  final Iterable<Type> types = const <Type>[BotPlatform];
  @override
  final String wireName = 'BotPlatform';

  @override
  Object serialize(Serializers serializers, BotPlatform object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BotPlatform deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BotPlatform.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
