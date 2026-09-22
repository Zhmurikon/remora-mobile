// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_copy_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseCopyRequest extends CourseCopyRequest {
  @override
  final String? articleId;

  factory _$CourseCopyRequest(
          [void Function(CourseCopyRequestBuilder)? updates]) =>
      (CourseCopyRequestBuilder()..update(updates))._build();

  _$CourseCopyRequest._({this.articleId}) : super._();
  @override
  CourseCopyRequest rebuild(void Function(CourseCopyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseCopyRequestBuilder toBuilder() =>
      CourseCopyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseCopyRequest && articleId == other.articleId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articleId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseCopyRequest')
          ..add('articleId', articleId))
        .toString();
  }
}

class CourseCopyRequestBuilder
    implements Builder<CourseCopyRequest, CourseCopyRequestBuilder> {
  _$CourseCopyRequest? _$v;

  String? _articleId;
  String? get articleId => _$this._articleId;
  set articleId(String? articleId) => _$this._articleId = articleId;

  CourseCopyRequestBuilder() {
    CourseCopyRequest._defaults(this);
  }

  CourseCopyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articleId = $v.articleId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseCopyRequest other) {
    _$v = other as _$CourseCopyRequest;
  }

  @override
  void update(void Function(CourseCopyRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseCopyRequest build() => _build();

  _$CourseCopyRequest _build() {
    final _$result = _$v ??
        _$CourseCopyRequest._(
          articleId: articleId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
