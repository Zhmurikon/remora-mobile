// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_job_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ImportJobPublic extends ImportJobPublic {
  @override
  final DateTime createdAt;
  @override
  final String? errorMessage;
  @override
  final BuiltList<ImportErrorItem> errors;
  @override
  final String filename;
  @override
  final DateTime? finishedAt;
  @override
  final String id;
  @override
  final int progress;
  @override
  final BuiltMap<String, JsonObject?>? result;
  @override
  final String setId;
  @override
  final DateTime? startedAt;
  @override
  final ImportJobStatus status;

  factory _$ImportJobPublic([void Function(ImportJobPublicBuilder)? updates]) =>
      (ImportJobPublicBuilder()..update(updates))._build();

  _$ImportJobPublic._(
      {required this.createdAt,
      this.errorMessage,
      required this.errors,
      required this.filename,
      this.finishedAt,
      required this.id,
      required this.progress,
      this.result,
      required this.setId,
      this.startedAt,
      required this.status})
      : super._();
  @override
  ImportJobPublic rebuild(void Function(ImportJobPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportJobPublicBuilder toBuilder() => ImportJobPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportJobPublic &&
        createdAt == other.createdAt &&
        errorMessage == other.errorMessage &&
        errors == other.errors &&
        filename == other.filename &&
        finishedAt == other.finishedAt &&
        id == other.id &&
        progress == other.progress &&
        result == other.result &&
        setId == other.setId &&
        startedAt == other.startedAt &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, filename.hashCode);
    _$hash = $jc(_$hash, finishedAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImportJobPublic')
          ..add('createdAt', createdAt)
          ..add('errorMessage', errorMessage)
          ..add('errors', errors)
          ..add('filename', filename)
          ..add('finishedAt', finishedAt)
          ..add('id', id)
          ..add('progress', progress)
          ..add('result', result)
          ..add('setId', setId)
          ..add('startedAt', startedAt)
          ..add('status', status))
        .toString();
  }
}

class ImportJobPublicBuilder
    implements Builder<ImportJobPublic, ImportJobPublicBuilder> {
  _$ImportJobPublic? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  ListBuilder<ImportErrorItem>? _errors;
  ListBuilder<ImportErrorItem> get errors =>
      _$this._errors ??= ListBuilder<ImportErrorItem>();
  set errors(ListBuilder<ImportErrorItem>? errors) => _$this._errors = errors;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(String? filename) => _$this._filename = filename;

  DateTime? _finishedAt;
  DateTime? get finishedAt => _$this._finishedAt;
  set finishedAt(DateTime? finishedAt) => _$this._finishedAt = finishedAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _progress;
  int? get progress => _$this._progress;
  set progress(int? progress) => _$this._progress = progress;

  MapBuilder<String, JsonObject?>? _result;
  MapBuilder<String, JsonObject?> get result =>
      _$this._result ??= MapBuilder<String, JsonObject?>();
  set result(MapBuilder<String, JsonObject?>? result) =>
      _$this._result = result;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  ImportJobStatus? _status;
  ImportJobStatus? get status => _$this._status;
  set status(ImportJobStatus? status) => _$this._status = status;

  ImportJobPublicBuilder() {
    ImportJobPublic._defaults(this);
  }

  ImportJobPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _errorMessage = $v.errorMessage;
      _errors = $v.errors.toBuilder();
      _filename = $v.filename;
      _finishedAt = $v.finishedAt;
      _id = $v.id;
      _progress = $v.progress;
      _result = $v.result?.toBuilder();
      _setId = $v.setId;
      _startedAt = $v.startedAt;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportJobPublic other) {
    _$v = other as _$ImportJobPublic;
  }

  @override
  void update(void Function(ImportJobPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImportJobPublic build() => _build();

  _$ImportJobPublic _build() {
    _$ImportJobPublic _$result;
    try {
      _$result = _$v ??
          _$ImportJobPublic._(
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ImportJobPublic', 'createdAt'),
            errorMessage: errorMessage,
            errors: errors.build(),
            filename: BuiltValueNullFieldError.checkNotNull(
                filename, r'ImportJobPublic', 'filename'),
            finishedAt: finishedAt,
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ImportJobPublic', 'id'),
            progress: BuiltValueNullFieldError.checkNotNull(
                progress, r'ImportJobPublic', 'progress'),
            result: _result?.build(),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'ImportJobPublic', 'setId'),
            startedAt: startedAt,
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ImportJobPublic', 'status'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        errors.build();

        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ImportJobPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
