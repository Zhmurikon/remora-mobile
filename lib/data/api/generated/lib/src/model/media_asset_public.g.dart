// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_asset_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaAssetPublic extends MediaAssetPublic {
  @override
  final DateTime createdAt;
  @override
  final String? downloadUrl;
  @override
  final int? height;
  @override
  final String id;
  @override
  final String mime;
  @override
  final int sizeBytes;
  @override
  final MediaStatus status;
  @override
  final int? width;

  factory _$MediaAssetPublic(
          [void Function(MediaAssetPublicBuilder)? updates]) =>
      (MediaAssetPublicBuilder()..update(updates))._build();

  _$MediaAssetPublic._(
      {required this.createdAt,
      this.downloadUrl,
      this.height,
      required this.id,
      required this.mime,
      required this.sizeBytes,
      required this.status,
      this.width})
      : super._();
  @override
  MediaAssetPublic rebuild(void Function(MediaAssetPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaAssetPublicBuilder toBuilder() =>
      MediaAssetPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaAssetPublic &&
        createdAt == other.createdAt &&
        downloadUrl == other.downloadUrl &&
        height == other.height &&
        id == other.id &&
        mime == other.mime &&
        sizeBytes == other.sizeBytes &&
        status == other.status &&
        width == other.width;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, downloadUrl.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, mime.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaAssetPublic')
          ..add('createdAt', createdAt)
          ..add('downloadUrl', downloadUrl)
          ..add('height', height)
          ..add('id', id)
          ..add('mime', mime)
          ..add('sizeBytes', sizeBytes)
          ..add('status', status)
          ..add('width', width))
        .toString();
  }
}

class MediaAssetPublicBuilder
    implements Builder<MediaAssetPublic, MediaAssetPublicBuilder> {
  _$MediaAssetPublic? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _downloadUrl;
  String? get downloadUrl => _$this._downloadUrl;
  set downloadUrl(String? downloadUrl) => _$this._downloadUrl = downloadUrl;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _mime;
  String? get mime => _$this._mime;
  set mime(String? mime) => _$this._mime = mime;

  int? _sizeBytes;
  int? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(int? sizeBytes) => _$this._sizeBytes = sizeBytes;

  MediaStatus? _status;
  MediaStatus? get status => _$this._status;
  set status(MediaStatus? status) => _$this._status = status;

  int? _width;
  int? get width => _$this._width;
  set width(int? width) => _$this._width = width;

  MediaAssetPublicBuilder() {
    MediaAssetPublic._defaults(this);
  }

  MediaAssetPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _downloadUrl = $v.downloadUrl;
      _height = $v.height;
      _id = $v.id;
      _mime = $v.mime;
      _sizeBytes = $v.sizeBytes;
      _status = $v.status;
      _width = $v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaAssetPublic other) {
    _$v = other as _$MediaAssetPublic;
  }

  @override
  void update(void Function(MediaAssetPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaAssetPublic build() => _build();

  _$MediaAssetPublic _build() {
    final _$result = _$v ??
        _$MediaAssetPublic._(
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'MediaAssetPublic', 'createdAt'),
          downloadUrl: downloadUrl,
          height: height,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'MediaAssetPublic', 'id'),
          mime: BuiltValueNullFieldError.checkNotNull(
              mime, r'MediaAssetPublic', 'mime'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'MediaAssetPublic', 'sizeBytes'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'MediaAssetPublic', 'status'),
          width: width,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
