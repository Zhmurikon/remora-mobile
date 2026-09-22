// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaStatus _$pending = const MediaStatus._('pending');
const MediaStatus _$ready = const MediaStatus._('ready');
const MediaStatus _$rejected = const MediaStatus._('rejected');

MediaStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'ready':
      return _$ready;
    case 'rejected':
      return _$rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MediaStatus> _$values =
    BuiltSet<MediaStatus>(const <MediaStatus>[
  _$pending,
  _$ready,
  _$rejected,
]);

class _$MediaStatusMeta {
  const _$MediaStatusMeta();
  MediaStatus get pending => _$pending;
  MediaStatus get ready => _$ready;
  MediaStatus get rejected => _$rejected;
  MediaStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<MediaStatus> get values => _$values;
}

abstract class _$MediaStatusMixin {
  // ignore: non_constant_identifier_names
  _$MediaStatusMeta get MediaStatus => const _$MediaStatusMeta();
}

Serializer<MediaStatus> _$mediaStatusSerializer = _$MediaStatusSerializer();

class _$MediaStatusSerializer implements PrimitiveSerializer<MediaStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'ready': 'ready',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'ready': 'ready',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[MediaStatus];
  @override
  final String wireName = 'MediaStatus';

  @override
  Object serialize(Serializers serializers, MediaStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MediaStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
