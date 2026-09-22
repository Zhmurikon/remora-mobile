// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_direction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const StudyDirection _$termToDef = const StudyDirection._('termToDef');
const StudyDirection _$defToTerm = const StudyDirection._('defToTerm');

StudyDirection _$valueOf(String name) {
  switch (name) {
    case 'termToDef':
      return _$termToDef;
    case 'defToTerm':
      return _$defToTerm;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<StudyDirection> _$values =
    BuiltSet<StudyDirection>(const <StudyDirection>[
  _$termToDef,
  _$defToTerm,
]);

class _$StudyDirectionMeta {
  const _$StudyDirectionMeta();
  StudyDirection get termToDef => _$termToDef;
  StudyDirection get defToTerm => _$defToTerm;
  StudyDirection valueOf(String name) => _$valueOf(name);
  BuiltSet<StudyDirection> get values => _$values;
}

abstract class _$StudyDirectionMixin {
  // ignore: non_constant_identifier_names
  _$StudyDirectionMeta get StudyDirection => const _$StudyDirectionMeta();
}

Serializer<StudyDirection> _$studyDirectionSerializer =
    _$StudyDirectionSerializer();

class _$StudyDirectionSerializer
    implements PrimitiveSerializer<StudyDirection> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'termToDef': 'term_to_def',
    'defToTerm': 'def_to_term',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'term_to_def': 'termToDef',
    'def_to_term': 'defToTerm',
  };

  @override
  final Iterable<Type> types = const <Type>[StudyDirection];
  @override
  final String wireName = 'StudyDirection';

  @override
  Object serialize(Serializers serializers, StudyDirection object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  StudyDirection deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StudyDirection.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
