// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_submitted.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportSubmitted extends ReportSubmitted {
  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final ReportReason reason;
  @override
  final ReportStatus status;

  factory _$ReportSubmitted([void Function(ReportSubmittedBuilder)? updates]) =>
      (ReportSubmittedBuilder()..update(updates))._build();

  _$ReportSubmitted._(
      {required this.createdAt,
      required this.id,
      required this.reason,
      required this.status})
      : super._();
  @override
  ReportSubmitted rebuild(void Function(ReportSubmittedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportSubmittedBuilder toBuilder() => ReportSubmittedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportSubmitted &&
        createdAt == other.createdAt &&
        id == other.id &&
        reason == other.reason &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportSubmitted')
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('reason', reason)
          ..add('status', status))
        .toString();
  }
}

class ReportSubmittedBuilder
    implements Builder<ReportSubmitted, ReportSubmittedBuilder> {
  _$ReportSubmitted? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ReportReason? _reason;
  ReportReason? get reason => _$this._reason;
  set reason(ReportReason? reason) => _$this._reason = reason;

  ReportStatus? _status;
  ReportStatus? get status => _$this._status;
  set status(ReportStatus? status) => _$this._status = status;

  ReportSubmittedBuilder() {
    ReportSubmitted._defaults(this);
  }

  ReportSubmittedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _id = $v.id;
      _reason = $v.reason;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportSubmitted other) {
    _$v = other as _$ReportSubmitted;
  }

  @override
  void update(void Function(ReportSubmittedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportSubmitted build() => _build();

  _$ReportSubmitted _build() {
    final _$result = _$v ??
        _$ReportSubmitted._(
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ReportSubmitted', 'createdAt'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReportSubmitted', 'id'),
          reason: BuiltValueNullFieldError.checkNotNull(
              reason, r'ReportSubmitted', 'reason'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ReportSubmitted', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
