//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_export_status.g.dart';

class AccountExportStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'queued')
  static const AccountExportStatus queued = _$queued;
  @BuiltValueEnumConst(wireName: r'processing')
  static const AccountExportStatus processing = _$processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const AccountExportStatus completed = _$completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const AccountExportStatus failed = _$failed;

  static Serializer<AccountExportStatus> get serializer => _$accountExportStatusSerializer;

  const AccountExportStatus._(String name): super(name);

  static BuiltSet<AccountExportStatus> get values => _$values;
  static AccountExportStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AccountExportStatusMixin = Object with _$AccountExportStatusMixin;

