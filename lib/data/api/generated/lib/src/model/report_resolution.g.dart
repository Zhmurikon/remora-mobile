// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_resolution.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReportResolutionOutcomeEnum _$reportResolutionOutcomeEnum_accepted =
    const ReportResolutionOutcomeEnum._('accepted');
const ReportResolutionOutcomeEnum _$reportResolutionOutcomeEnum_rejected =
    const ReportResolutionOutcomeEnum._('rejected');

ReportResolutionOutcomeEnum _$reportResolutionOutcomeEnumValueOf(String name) {
  switch (name) {
    case 'accepted':
      return _$reportResolutionOutcomeEnum_accepted;
    case 'rejected':
      return _$reportResolutionOutcomeEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReportResolutionOutcomeEnum>
    _$reportResolutionOutcomeEnumValues =
    BuiltSet<ReportResolutionOutcomeEnum>(const <ReportResolutionOutcomeEnum>[
  _$reportResolutionOutcomeEnum_accepted,
  _$reportResolutionOutcomeEnum_rejected,
]);

Serializer<ReportResolutionOutcomeEnum>
    _$reportResolutionOutcomeEnumSerializer =
    _$ReportResolutionOutcomeEnumSerializer();

class _$ReportResolutionOutcomeEnumSerializer
    implements PrimitiveSerializer<ReportResolutionOutcomeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'accepted': 'accepted',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'accepted': 'accepted',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[ReportResolutionOutcomeEnum];
  @override
  final String wireName = 'ReportResolutionOutcomeEnum';

  @override
  Object serialize(Serializers serializers, ReportResolutionOutcomeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReportResolutionOutcomeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReportResolutionOutcomeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ReportResolution extends ReportResolution {
  @override
  final ReportResolutionOutcomeEnum outcome;

  factory _$ReportResolution(
          [void Function(ReportResolutionBuilder)? updates]) =>
      (ReportResolutionBuilder()..update(updates))._build();

  _$ReportResolution._({required this.outcome}) : super._();
  @override
  ReportResolution rebuild(void Function(ReportResolutionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportResolutionBuilder toBuilder() =>
      ReportResolutionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportResolution && outcome == other.outcome;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, outcome.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportResolution')
          ..add('outcome', outcome))
        .toString();
  }
}

class ReportResolutionBuilder
    implements Builder<ReportResolution, ReportResolutionBuilder> {
  _$ReportResolution? _$v;

  ReportResolutionOutcomeEnum? _outcome;
  ReportResolutionOutcomeEnum? get outcome => _$this._outcome;
  set outcome(ReportResolutionOutcomeEnum? outcome) =>
      _$this._outcome = outcome;

  ReportResolutionBuilder() {
    ReportResolution._defaults(this);
  }

  ReportResolutionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _outcome = $v.outcome;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportResolution other) {
    _$v = other as _$ReportResolution;
  }

  @override
  void update(void Function(ReportResolutionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportResolution build() => _build();

  _$ReportResolution _build() {
    final _$result = _$v ??
        _$ReportResolution._(
          outcome: BuiltValueNullFieldError.checkNotNull(
              outcome, r'ReportResolution', 'outcome'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
