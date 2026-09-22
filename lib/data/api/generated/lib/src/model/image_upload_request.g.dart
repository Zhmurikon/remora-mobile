// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ImageUploadRequest extends ImageUploadRequest {
  @override
  final String filename;
  @override
  final String mime;
  @override
  final int sizeBytes;

  factory _$ImageUploadRequest(
          [void Function(ImageUploadRequestBuilder)? updates]) =>
      (ImageUploadRequestBuilder()..update(updates))._build();

  _$ImageUploadRequest._(
      {required this.filename, required this.mime, required this.sizeBytes})
      : super._();
  @override
  ImageUploadRequest rebuild(
          void Function(ImageUploadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageUploadRequestBuilder toBuilder() =>
      ImageUploadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageUploadRequest &&
        filename == other.filename &&
        mime == other.mime &&
        sizeBytes == other.sizeBytes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, filename.hashCode);
    _$hash = $jc(_$hash, mime.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImageUploadRequest')
          ..add('filename', filename)
          ..add('mime', mime)
          ..add('sizeBytes', sizeBytes))
        .toString();
  }
}

class ImageUploadRequestBuilder
    implements Builder<ImageUploadRequest, ImageUploadRequestBuilder> {
  _$ImageUploadRequest? _$v;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(String? filename) => _$this._filename = filename;

  String? _mime;
  String? get mime => _$this._mime;
  set mime(String? mime) => _$this._mime = mime;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  ImageUploadRequestBuilder() {
    ImageUploadRequest._defaults(this);
  }

  ImageUploadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filename = $v.filename;
      _mime = $v.mime;
      _sizeBytes = $v.sizeBytes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageUploadRequest other) {
    _$v = other as _$ImageUploadRequest;
  }

  @override
  void update(void Function(ImageUploadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImageUploadRequest build() => _build();

  _$ImageUploadRequest _build() {
    final _$result = _$v ??
        _$ImageUploadRequest._(
          filename: BuiltValueNullFieldError.checkNotNull(
              filename, r'ImageUploadRequest', 'filename'),
          mime: BuiltValueNullFieldError.checkNotNull(
              mime, r'ImageUploadRequest', 'mime'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'ImageUploadRequest', 'sizeBytes'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
