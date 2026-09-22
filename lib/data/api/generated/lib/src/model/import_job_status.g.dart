// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_job_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ImportJobStatus _$queued = const ImportJobStatus._('queued');
const ImportJobStatus _$processing = const ImportJobStatus._('processing');
const ImportJobStatus _$completed = const ImportJobStatus._('completed');
const ImportJobStatus _$failed = const ImportJobStatus._('failed');

ImportJobStatus _$valueOf(String name) {
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

final BuiltSet<ImportJobStatus> _$values =
    BuiltSet<ImportJobStatus>(const <ImportJobStatus>[
  _$queued,
  _$processing,
  _$completed,
  _$failed,
]);

class _$ImportJobStatusMeta {
  const _$ImportJobStatusMeta();
  ImportJobStatus get queued => _$queued;
  ImportJobStatus get processing => _$processing;
  ImportJobStatus get completed => _$completed;
  ImportJobStatus get failed => _$failed;
  ImportJobStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ImportJobStatus> get values => _$values;
}

abstract class _$ImportJobStatusMixin {
  // ignore: non_constant_identifier_names
  _$ImportJobStatusMeta get ImportJobStatus => const _$ImportJobStatusMeta();
}

Serializer<ImportJobStatus> _$importJobStatusSerializer =
    _$ImportJobStatusSerializer();

class _$ImportJobStatusSerializer
    implements PrimitiveSerializer<ImportJobStatus> {
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
  final Iterable<Type> types = const <Type>[ImportJobStatus];
  @override
  final String wireName = 'ImportJobStatus';

  @override
  Object serialize(Serializers serializers, ImportJobStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ImportJobStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ImportJobStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
