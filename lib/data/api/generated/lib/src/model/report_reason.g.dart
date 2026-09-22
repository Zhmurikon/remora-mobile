// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_reason.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReportReason _$spam = const ReportReason._('spam');
const ReportReason _$misleading = const ReportReason._('misleading');
const ReportReason _$copyright = const ReportReason._('copyright');
const ReportReason _$offensive = const ReportReason._('offensive');
const ReportReason _$adult = const ReportReason._('adult');
const ReportReason _$other = const ReportReason._('other');

ReportReason _$valueOf(String name) {
  switch (name) {
    case 'spam':
      return _$spam;
    case 'misleading':
      return _$misleading;
    case 'copyright':
      return _$copyright;
    case 'offensive':
      return _$offensive;
    case 'adult':
      return _$adult;
    case 'other':
      return _$other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReportReason> _$values =
    BuiltSet<ReportReason>(const <ReportReason>[
  _$spam,
  _$misleading,
  _$copyright,
  _$offensive,
  _$adult,
  _$other,
]);

class _$ReportReasonMeta {
  const _$ReportReasonMeta();
  ReportReason get spam => _$spam;
  ReportReason get misleading => _$misleading;
  ReportReason get copyright => _$copyright;
  ReportReason get offensive => _$offensive;
  ReportReason get adult => _$adult;
  ReportReason get other => _$other;
  ReportReason valueOf(String name) => _$valueOf(name);
  BuiltSet<ReportReason> get values => _$values;
}

abstract class _$ReportReasonMixin {
  // ignore: non_constant_identifier_names
  _$ReportReasonMeta get ReportReason => const _$ReportReasonMeta();
}

Serializer<ReportReason> _$reportReasonSerializer = _$ReportReasonSerializer();

class _$ReportReasonSerializer implements PrimitiveSerializer<ReportReason> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'spam': 'spam',
    'misleading': 'misleading',
    'copyright': 'copyright',
    'offensive': 'offensive',
    'adult': 'adult',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'spam': 'spam',
    'misleading': 'misleading',
    'copyright': 'copyright',
    'offensive': 'offensive',
    'adult': 'adult',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[ReportReason];
  @override
  final String wireName = 'ReportReason';

  @override
  Object serialize(Serializers serializers, ReportReason object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReportReason deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReportReason.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
