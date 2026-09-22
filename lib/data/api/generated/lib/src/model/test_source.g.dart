// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TestSource _$all = const TestSource._('all');
const TestSource _$hard = const TestSource._('hard');
const TestSource _$new_ = const TestSource._('new_');

TestSource _$valueOf(String name) {
  switch (name) {
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

final BuiltSet<TestSource> _$values = BuiltSet<TestSource>(const <TestSource>[
  _$all,
  _$hard,
  _$new_,
]);

class _$TestSourceMeta {
  const _$TestSourceMeta();
  TestSource get all => _$all;
  TestSource get hard => _$hard;
  TestSource get new_ => _$new_;
  TestSource valueOf(String name) => _$valueOf(name);
  BuiltSet<TestSource> get values => _$values;
}

abstract class _$TestSourceMixin {
  // ignore: non_constant_identifier_names
  _$TestSourceMeta get TestSource => const _$TestSourceMeta();
}

Serializer<TestSource> _$testSourceSerializer = _$TestSourceSerializer();

class _$TestSourceSerializer implements PrimitiveSerializer<TestSource> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'all': 'all',
    'hard': 'hard',
    'new_': 'new',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'all': 'all',
    'hard': 'hard',
    'new': 'new_',
  };

  @override
  final Iterable<Type> types = const <Type>[TestSource];
  @override
  final String wireName = 'TestSource';

  @override
  Object serialize(Serializers serializers, TestSource object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TestSource deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TestSource.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
