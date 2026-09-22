// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccountExportStatus _$queued = const AccountExportStatus._('queued');
const AccountExportStatus _$processing =
    const AccountExportStatus._('processing');
const AccountExportStatus _$completed =
    const AccountExportStatus._('completed');
const AccountExportStatus _$failed = const AccountExportStatus._('failed');

AccountExportStatus _$valueOf(String name) {
  switch (name) {
    case 'queued':
      return _$queued;
    case 'processing':
      return _$processing;
    case 'completed':
      return _$completed;
    case 'failed':
      return _$failed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AccountExportStatus> _$values =
    BuiltSet<AccountExportStatus>(const <AccountExportStatus>[
  _$queued,
  _$processing,
  _$completed,
  _$failed,
]);

class _$AccountExportStatusMeta {
  const _$AccountExportStatusMeta();
  AccountExportStatus get queued => _$queued;
  AccountExportStatus get processing => _$processing;
  AccountExportStatus get completed => _$completed;
  AccountExportStatus get failed => _$failed;
  AccountExportStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<AccountExportStatus> get values => _$values;
}

abstract class _$AccountExportStatusMixin {
  // ignore: non_constant_identifier_names
  _$AccountExportStatusMeta get AccountExportStatus =>
      const _$AccountExportStatusMeta();
}

Serializer<AccountExportStatus> _$accountExportStatusSerializer =
    _$AccountExportStatusSerializer();

class _$AccountExportStatusSerializer
    implements PrimitiveSerializer<AccountExportStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'queued': 'queued',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'queued': 'queued',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountExportStatus];
  @override
  final String wireName = 'AccountExportStatus';

  @override
  Object serialize(Serializers serializers, AccountExportStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountExportStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountExportStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
