// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_scope.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const QueueScope _$due = const QueueScope._('due');
const QueueScope _$all = const QueueScope._('all');
const QueueScope _$hard = const QueueScope._('hard');
const QueueScope _$new_ = const QueueScope._('new_');

QueueScope _$valueOf(String name) {
  switch (name) {
    case 'due':
      return _$due;
    case 'all':
      return _$all;
    case 'hard':
      return _$hard;
    case 'new_':
      return _$new_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<QueueScope> _$values = BuiltSet<QueueScope>(const <QueueScope>[
  _$due,
  _$all,
  _$hard,
  _$new_,
]);

class _$QueueScopeMeta {
  const _$QueueScopeMeta();
  QueueScope get due => _$due;
  QueueScope get all => _$all;
  QueueScope get hard => _$hard;
  QueueScope get new_ => _$new_;
  QueueScope valueOf(String name) => _$valueOf(name);
  BuiltSet<QueueScope> get values => _$values;
}

abstract class _$QueueScopeMixin {
  // ignore: non_constant_identifier_names
  _$QueueScopeMeta get QueueScope => const _$QueueScopeMeta();
}

Serializer<QueueScope> _$queueScopeSerializer = _$QueueScopeSerializer();

class _$QueueScopeSerializer implements PrimitiveSerializer<QueueScope> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'due': 'due',
    'all': 'all',
    'hard': 'hard',
    'new_': 'new',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'due': 'due',
    'all': 'all',
    'hard': 'hard',
    'new': 'new_',
  };

  @override
  final Iterable<Type> types = const <Type>[QueueScope];
  @override
  final String wireName = 'QueueScope';

  @override
  Object serialize(Serializers serializers, QueueScope object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  QueueScope deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      QueueScope.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
