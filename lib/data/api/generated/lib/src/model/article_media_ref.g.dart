// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_media_ref.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ArticleMediaRef extends ArticleMediaRef {
  @override
  final int? height;
  @override
  final String id;
  @override
  final String url;
  @override
  final int? width;

  factory _$ArticleMediaRef([void Function(ArticleMediaRefBuilder)? updates]) =>
      (ArticleMediaRefBuilder()..update(updates))._build();

  _$ArticleMediaRef._(
      {this.height, required this.id, required this.url, this.width})
      : super._();
  @override
  ArticleMediaRef rebuild(void Function(ArticleMediaRefBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleMediaRefBuilder toBuilder() => ArticleMediaRefBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticleMediaRef &&
        height == other.height &&
        id == other.id &&
        url == other.url &&
        width == other.width;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArticleMediaRef')
          ..add('height', height)
          ..add('id', id)
          ..add('url', url)
          ..add('width', width))
        .toString();
  }
}

class ArticleMediaRefBuilder
    implements Builder<ArticleMediaRef, ArticleMediaRefBuilder> {
  _$ArticleMediaRef? _$v;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  int? _width;
  int? get width => _$this._width;
  set width(int? width) => _$this._width = width;

  ArticleMediaRefBuilder() {
    ArticleMediaRef._defaults(this);
  }

  ArticleMediaRefBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _height = $v.height;
      _id = $v.id;
      _url = $v.url;
      _width = $v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticleMediaRef other) {
    _$v = other as _$ArticleMediaRef;
  }

  @override
  void update(void Function(ArticleMediaRefBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArticleMediaRef build() => _build();

  _$ArticleMediaRef _build() {
    final _$result = _$v ??
        _$ArticleMediaRef._(
          height: height,
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ArticleMediaRef', 'id'),
          url: BuiltValueNullFieldError.checkNotNull(
              url, r'ArticleMediaRef', 'url'),
          width: width,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
