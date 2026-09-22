//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_reason.g.dart';

/// Причина жалобы; список закрыт, свободный текст идёт в `comment`.
class ReportReason extends EnumClass {

  @BuiltValueEnumConst(wireName: r'spam')
  static const ReportReason spam = _$spam;
  @BuiltValueEnumConst(wireName: r'misleading')
  static const ReportReason misleading = _$misleading;
  @BuiltValueEnumConst(wireName: r'copyright')
  static const ReportReason copyright = _$copyright;
  @BuiltValueEnumConst(wireName: r'offensive')
  static const ReportReason offensive = _$offensive;
  @BuiltValueEnumConst(wireName: r'adult')
  static const ReportReason adult = _$adult;
  @BuiltValueEnumConst(wireName: r'other')
  static const ReportReason other = _$other;

  static Serializer<ReportReason> get serializer => _$reportReasonSerializer;

  const ReportReason._(String name): super(name);

  static BuiltSet<ReportReason> get values => _$values;
  static ReportReason valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ReportReasonMixin = Object with _$ReportReasonMixin;

