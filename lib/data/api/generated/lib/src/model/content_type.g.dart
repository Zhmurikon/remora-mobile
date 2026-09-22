// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContentType _$text = const ContentType._('text');
const ContentType _$latex = const ContentType._('latex');
const ContentType _$code = const ContentType._('code');

ContentType _$valueOf(String name) {
  switch (name) {
    case 'text':
      return _$text;
    case 'latex':
      return _$latex;
    case 'code':
      return _$code;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ContentType> _$values =
    BuiltSet<ContentType>(const <ContentType>[
  _$text,
  _$latex,
  _$code,
]);

class _$ContentTypeMeta {
  const _$ContentTypeMeta();
  ContentType get text => _$text;
  ContentType get latex => _$latex;
  ContentType get code => _$code;
  ContentType valueOf(String name) => _$valueOf(name);
  BuiltSet<ContentType> get values => _$values;
}

abstract class _$ContentTypeMixin {
  // ignore: non_constant_identifier_names
  _$ContentTypeMeta get ContentType => const _$ContentTypeMeta();
}

Serializer<ContentType> _$contentTypeSerializer = _$ContentTypeSerializer();

class _$ContentTypeSerializer implements PrimitiveSerializer<ContentType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'text': 'text',
    'latex': 'latex',
    'code': 'code',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'text': 'text',
    'latex': 'latex',
    'code': 'code',
  };

  @override
  final Iterable<Type> types = const <Type>[ContentType];
  @override
  final String wireName = 'ContentType';

  @override
  Object serialize(Serializers serializers, ContentType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContentType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContentType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
