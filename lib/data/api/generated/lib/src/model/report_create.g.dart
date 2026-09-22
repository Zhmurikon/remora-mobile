// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportCreate extends ReportCreate {
  @override
  final String? comment;
  @override
  final ReportReason reason;

  factory _$ReportCreate([void Function(ReportCreateBuilder)? updates]) =>
      (ReportCreateBuilder()..update(updates))._build();

  _$ReportCreate._({this.comment, required this.reason}) : super._();
  @override
  ReportCreate rebuild(void Function(ReportCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportCreateBuilder toBuilder() => ReportCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportCreate &&
        comment == other.comment &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportCreate')
          ..add('comment', comment)
          ..add('reason', reason))
        .toString();
  }
}

class ReportCreateBuilder
    implements Builder<ReportCreate, ReportCreateBuilder> {
  _$ReportCreate? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReportReason? _reason;
  ReportReason? get reason => _$this._reason;
  set reason(ReportReason? reason) => _$this._reason = reason;

  ReportCreateBuilder() {
    ReportCreate._defaults(this);
  }

  ReportCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportCreate other) {
    _$v = other as _$ReportCreate;
  }

  @override
  void update(void Function(ReportCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportCreate build() => _build();

  _$ReportCreate _build() {
    final _$result = _$v ??
        _$ReportCreate._(
          comment: comment,
          reason: BuiltValueNullFieldError.checkNotNull(
              reason, r'ReportCreate', 'reason'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
