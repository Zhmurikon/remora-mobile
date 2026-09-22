// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReportStatus _$open = const ReportStatus._('open');
const ReportStatus _$accepted = const ReportStatus._('accepted');
const ReportStatus _$rejected = const ReportStatus._('rejected');

ReportStatus _$valueOf(String name) {
  switch (name) {
    case 'open':
      return _$open;
    case 'accepted':
      return _$accepted;
    case 'rejected':
      return _$rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReportStatus> _$values =
    BuiltSet<ReportStatus>(const <ReportStatus>[
  _$open,
  _$accepted,
  _$rejected,
]);

class _$ReportStatusMeta {
  const _$ReportStatusMeta();
  ReportStatus get open => _$open;
  ReportStatus get accepted => _$accepted;
  ReportStatus get rejected => _$rejected;
  ReportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ReportStatus> get values => _$values;
}

abstract class _$ReportStatusMixin {
  // ignore: non_constant_identifier_names
  _$ReportStatusMeta get ReportStatus => const _$ReportStatusMeta();
}

Serializer<ReportStatus> _$reportStatusSerializer = _$ReportStatusSerializer();

class _$ReportStatusSerializer implements PrimitiveSerializer<ReportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'open': 'open',
    'accepted': 'accepted',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'open': 'open',
    'accepted': 'accepted',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[ReportStatus];
  @override
  final String wireName = 'ReportStatus';

  @override
  Object serialize(Serializers serializers, ReportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
