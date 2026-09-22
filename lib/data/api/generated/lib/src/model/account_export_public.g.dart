// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountExportPublic extends AccountExportPublic {
  @override
  final DateTime createdAt;
  @override
  final String? downloadUrl;
  @override
  final String? errorMessage;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? finishedAt;
  @override
  final String id;
  @override
  final int progress;
  @override
  final int? sizeBytes;
  @override
  final AccountExportStatus status;

  factory _$AccountExportPublic(
          [void Function(AccountExportPublicBuilder)? updates]) =>
      (AccountExportPublicBuilder()..update(updates))._build();

  _$AccountExportPublic._(
      {required this.createdAt,
      this.downloadUrl,
      this.errorMessage,
      this.expiresAt,
      this.finishedAt,
      required this.id,
      required this.progress,
      this.sizeBytes,
      required this.status})
      : super._();
  @override
  AccountExportPublic rebuild(
          void Function(AccountExportPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountExportPublicBuilder toBuilder() =>
      AccountExportPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountExportPublic &&
        createdAt == other.createdAt &&
        downloadUrl == other.downloadUrl &&
        errorMessage == other.errorMessage &&
        expiresAt == other.expiresAt &&
        finishedAt == other.finishedAt &&
        id == other.id &&
        progress == other.progress &&
        sizeBytes == other.sizeBytes &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, downloadUrl.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountExportPublic')
          ..add('createdAt', createdAt)
          ..add('downloadUrl', downloadUrl)
          ..add('errorMessage', errorMessage)
          ..add('expiresAt', expiresAt)
          ..add('finishedAt', finishedAt)
          ..add('id', id)
          ..add('progress', progress)
          ..add('sizeBytes', sizeBytes)
          ..add('status', status))
        .toString();
  }
}

class AccountExportPublicBuilder
    implements Builder<AccountExportPublic, AccountExportPublicBuilder> {
  _$AccountExportPublic? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _downloadUrl;
  String? get downloadUrl => _$this._downloadUrl;
  set downloadUrl(String? downloadUrl) => _$this._downloadUrl = downloadUrl;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  AccountExportStatus? _status;
  AccountExportStatus? get status => _$this._status;
  set status(AccountExportStatus? status) => _$this._status = status;

  AccountExportPublicBuilder() {
    AccountExportPublic._defaults(this);
  }

  AccountExportPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _downloadUrl = $v.downloadUrl;
      _errorMessage = $v.errorMessage;
      _expiresAt = $v.expiresAt;
      _finishedAt = $v.finishedAt;
      _id = $v.id;
      _progress = $v.progress;
      _sizeBytes = $v.sizeBytes;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountExportPublic other) {
    _$v = other as _$AccountExportPublic;
  }

  @override
  void update(void Function(AccountExportPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountExportPublic build() => _build();

  _$AccountExportPublic _build() {
    final _$result = _$v ??
        _$AccountExportPublic._(
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'AccountExportPublic', 'createdAt'),
          downloadUrl: downloadUrl,
          errorMessage: errorMessage,
          expiresAt: expiresAt,
          finishedAt: finishedAt,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AccountExportPublic', 'id'),
          progress: BuiltValueNullFieldError.checkNotNull(
              progress, r'AccountExportPublic', 'progress'),
          sizeBytes: sizeBytes,
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AccountExportPublic', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
