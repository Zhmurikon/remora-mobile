// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_ticket.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ImageUploadTicket extends ImageUploadTicket {
  @override
  final int expiresIn;
  @override
  final BuiltMap<String, String> headers;
  @override
  final String id;
  @override
  final String? method;
  @override
  final String uploadUrl;

  factory _$ImageUploadTicket(
          [void Function(ImageUploadTicketBuilder)? updates]) =>
      (ImageUploadTicketBuilder()..update(updates))._build();

  _$ImageUploadTicket._(
      {required this.expiresIn,
      required this.headers,
      required this.id,
      this.method,
      required this.uploadUrl})
      : super._();
  @override
  ImageUploadTicket rebuild(void Function(ImageUploadTicketBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageUploadTicketBuilder toBuilder() =>
      ImageUploadTicketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageUploadTicket &&
        expiresIn == other.expiresIn &&
        headers == other.headers &&
        id == other.id &&
        method == other.method &&
        uploadUrl == other.uploadUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, uploadUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImageUploadTicket')
          ..add('expiresIn', expiresIn)
          ..add('headers', headers)
          ..add('id', id)
          ..add('method', method)
          ..add('uploadUrl', uploadUrl))
        .toString();
  }
}

class ImageUploadTicketBuilder
    implements Builder<ImageUploadTicket, ImageUploadTicketBuilder> {
  _$ImageUploadTicket? _$v;

  int? _expiresIn;
  int? get expiresIn => _$this._expiresIn;
  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  MapBuilder<String, String>? _headers;
  MapBuilder<String, String> get headers =>
      _$this._headers ??= MapBuilder<String, String>();
  set headers(MapBuilder<String, String>? headers) => _$this._headers = headers;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _uploadUrl;
  String? get uploadUrl => _$this._uploadUrl;
  set uploadUrl(String? uploadUrl) => _$this._uploadUrl = uploadUrl;

  ImageUploadTicketBuilder() {
    ImageUploadTicket._defaults(this);
  }

  ImageUploadTicketBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expiresIn = $v.expiresIn;
      _headers = $v.headers.toBuilder();
      _id = $v.id;
      _method = $v.method;
      _uploadUrl = $v.uploadUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageUploadTicket other) {
    _$v = other as _$ImageUploadTicket;
  }

  @override
  void update(void Function(ImageUploadTicketBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImageUploadTicket build() => _build();

  _$ImageUploadTicket _build() {
    _$ImageUploadTicket _$result;
    try {
      _$result = _$v ??
          _$ImageUploadTicket._(
            expiresIn: BuiltValueNullFieldError.checkNotNull(
                expiresIn, r'ImageUploadTicket', 'expiresIn'),
            headers: headers.build(),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ImageUploadTicket', 'id'),
            method: method,
            uploadUrl: BuiltValueNullFieldError.checkNotNull(
                uploadUrl, r'ImageUploadTicket', 'uploadUrl'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ImageUploadTicket', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
