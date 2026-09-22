//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_job_status.g.dart';

class ImportJobStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'queued')
  static const ImportJobStatus queued = _$queued;
  @BuiltValueEnumConst(wireName: r'processing')
  static const ImportJobStatus processing = _$processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const ImportJobStatus completed = _$completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const ImportJobStatus failed = _$failed;

  static Serializer<ImportJobStatus> get serializer => _$importJobStatusSerializer;

  const ImportJobStatus._(String name): super(name);

  static BuiltSet<ImportJobStatus> get values => _$values;
  static ImportJobStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ImportJobStatusMixin = Object with _$ImportJobStatusMixin;

