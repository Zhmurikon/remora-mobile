// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportItem extends ReportItem {
  @override
  final String comment;
  @override
  final String courseId;
  @override
  final bool courseIsPublished;
  @override
  final String courseModerationStatus;
  @override
  final String courseSlug;
  @override
  final String courseTitle;
  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final ReportReason reason;
  @override
  final String reporterUsername;
  @override
  final DateTime? resolvedAt;
  @override
  final ReportStatus status;

  factory _$ReportItem([void Function(ReportItemBuilder)? updates]) =>
      (ReportItemBuilder()..update(updates))._build();

  _$ReportItem._(
      {required this.comment,
      required this.courseId,
      required this.courseIsPublished,
      required this.courseModerationStatus,
      required this.courseSlug,
      required this.courseTitle,
      required this.createdAt,
      required this.id,
      required this.reason,
      required this.reporterUsername,
      this.resolvedAt,
      required this.status})
      : super._();
  @override
  ReportItem rebuild(void Function(ReportItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportItemBuilder toBuilder() => ReportItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportItem &&
        comment == other.comment &&
        courseId == other.courseId &&
        courseIsPublished == other.courseIsPublished &&
        courseModerationStatus == other.courseModerationStatus &&
        courseSlug == other.courseSlug &&
        courseTitle == other.courseTitle &&
        createdAt == other.createdAt &&
        id == other.id &&
        reason == other.reason &&
        reporterUsername == other.reporterUsername &&
        resolvedAt == other.resolvedAt &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, courseId.hashCode);
    _$hash = $jc(_$hash, courseIsPublished.hashCode);
    _$hash = $jc(_$hash, courseModerationStatus.hashCode);
    _$hash = $jc(_$hash, courseSlug.hashCode);
    _$hash = $jc(_$hash, courseTitle.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, reporterUsername.hashCode);
    _$hash = $jc(_$hash, resolvedAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportItem')
          ..add('comment', comment)
          ..add('courseId', courseId)
          ..add('courseIsPublished', courseIsPublished)
          ..add('courseModerationStatus', courseModerationStatus)
          ..add('courseSlug', courseSlug)
          ..add('courseTitle', courseTitle)
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('reason', reason)
          ..add('reporterUsername', reporterUsername)
          ..add('resolvedAt', resolvedAt)
          ..add('status', status))
        .toString();
  }
}

class ReportItemBuilder implements Builder<ReportItem, ReportItemBuilder> {
  _$ReportItem? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _courseId;
  String? get courseId => _$this._courseId;
  set courseId(String? courseId) => _$this._courseId = courseId;

  bool? _courseIsPublished;
  bool? get courseIsPublished => _$this._courseIsPublished;
  set courseIsPublished(bool? courseIsPublished) =>
      _$this._courseIsPublished = courseIsPublished;

  String? _courseModerationStatus;
  String? get courseModerationStatus => _$this._courseModerationStatus;
  set courseModerationStatus(String? courseModerationStatus) =>
      _$this._courseModerationStatus = courseModerationStatus;

  String? _courseSlug;
  String? get courseSlug => _$this._courseSlug;
  set courseSlug(String? courseSlug) => _$this._courseSlug = courseSlug;

  String? _courseTitle;
  String? get courseTitle => _$this._courseTitle;
  set courseTitle(String? courseTitle) => _$this._courseTitle = courseTitle;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ReportReason? _reason;
  ReportReason? get reason => _$this._reason;
  set reason(ReportReason? reason) => _$this._reason = reason;

  String? _reporterUsername;
  String? get reporterUsername => _$this._reporterUsername;
  set reporterUsername(String? reporterUsername) =>
      _$this._reporterUsername = reporterUsername;

  DateTime? _resolvedAt;
  DateTime? get resolvedAt => _$this._resolvedAt;
  set resolvedAt(DateTime? resolvedAt) => _$this._resolvedAt = resolvedAt;

  ReportStatus? _status;
  ReportStatus? get status => _$this._status;
  set status(ReportStatus? status) => _$this._status = status;

  ReportItemBuilder() {
    ReportItem._defaults(this);
  }

  ReportItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _courseId = $v.courseId;
      _courseIsPublished = $v.courseIsPublished;
      _courseModerationStatus = $v.courseModerationStatus;
      _courseSlug = $v.courseSlug;
      _courseTitle = $v.courseTitle;
      _createdAt = $v.createdAt;
      _id = $v.id;
      _reason = $v.reason;
      _reporterUsername = $v.reporterUsername;
      _resolvedAt = $v.resolvedAt;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportItem other) {
    _$v = other as _$ReportItem;
  }

  @override
  void update(void Function(ReportItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportItem build() => _build();

  _$ReportItem _build() {
    final _$result = _$v ??
        _$ReportItem._(
          comment: BuiltValueNullFieldError.checkNotNull(
              comment, r'ReportItem', 'comment'),
          courseId: BuiltValueNullFieldError.checkNotNull(
              courseId, r'ReportItem', 'courseId'),
          courseIsPublished: BuiltValueNullFieldError.checkNotNull(
              courseIsPublished, r'ReportItem', 'courseIsPublished'),
          courseModerationStatus: BuiltValueNullFieldError.checkNotNull(
              courseModerationStatus, r'ReportItem', 'courseModerationStatus'),
          courseSlug: BuiltValueNullFieldError.checkNotNull(
              courseSlug, r'ReportItem', 'courseSlug'),
          courseTitle: BuiltValueNullFieldError.checkNotNull(
              courseTitle, r'ReportItem', 'courseTitle'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ReportItem', 'createdAt'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'ReportItem', 'id'),
          reason: BuiltValueNullFieldError.checkNotNull(
              reason, r'ReportItem', 'reason'),
          reporterUsername: BuiltValueNullFieldError.checkNotNull(
              reporterUsername, r'ReportItem', 'reporterUsername'),
          resolvedAt: resolvedAt,
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ReportItem', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
