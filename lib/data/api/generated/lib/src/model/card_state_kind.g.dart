// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_state_kind.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CardStateKind _$new_ = const CardStateKind._('new_');
const CardStateKind _$learning = const CardStateKind._('learning');
const CardStateKind _$review = const CardStateKind._('review');
const CardStateKind _$relearning = const CardStateKind._('relearning');

CardStateKind _$valueOf(String name) {
  switch (name) {
    case 'new_':
      return _$new_;
    case 'learning':
      return _$learning;
    case 'review':
      return _$review;
    case 'relearning':
      return _$relearning;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CardStateKind> _$values =
    BuiltSet<CardStateKind>(const <CardStateKind>[
  _$new_,
  _$learning,
  _$review,
  _$relearning,
]);

class _$CardStateKindMeta {
  const _$CardStateKindMeta();
  CardStateKind get new_ => _$new_;
  CardStateKind get learning => _$learning;
  CardStateKind get review => _$review;
  CardStateKind get relearning => _$relearning;
  CardStateKind valueOf(String name) => _$valueOf(name);
  BuiltSet<CardStateKind> get values => _$values;
}

abstract class _$CardStateKindMixin {
  // ignore: non_constant_identifier_names
  _$CardStateKindMeta get CardStateKind => const _$CardStateKindMeta();
}

Serializer<CardStateKind> _$cardStateKindSerializer =
    _$CardStateKindSerializer();

class _$CardStateKindSerializer implements PrimitiveSerializer<CardStateKind> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'new_': 'new',
    'learning': 'learning',
    'review': 'review',
    'relearning': 'relearning',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'new': 'new_',
    'learning': 'learning',
    'review': 'review',
    'relearning': 'relearning',
  };

  @override
  final Iterable<Type> types = const <Type>[CardStateKind];
  @override
  final String wireName = 'CardStateKind';

  @override
  Object serialize(Serializers serializers, CardStateKind object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CardStateKind deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CardStateKind.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
