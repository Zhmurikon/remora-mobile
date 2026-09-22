// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ArticleWrite extends ArticleWrite {
  @override
  final String? body;
  @override
  final String? id;
  @override
  final String? setId;
  @override
  final String title;

  factory _$ArticleWrite([void Function(ArticleWriteBuilder)? updates]) =>
      (ArticleWriteBuilder()..update(updates))._build();

  _$ArticleWrite._({this.body, this.id, this.setId, required this.title})
      : super._();
  @override
  ArticleWrite rebuild(void Function(ArticleWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleWriteBuilder toBuilder() => ArticleWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticleWrite &&
        body == other.body &&
        id == other.id &&
        setId == other.setId &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArticleWrite')
          ..add('body', body)
          ..add('id', id)
          ..add('setId', setId)
          ..add('title', title))
        .toString();
  }
}

class ArticleWriteBuilder
    implements Builder<ArticleWrite, ArticleWriteBuilder> {
  _$ArticleWrite? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ArticleWriteBuilder() {
    ArticleWrite._defaults(this);
  }

  ArticleWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _id = $v.id;
      _setId = $v.setId;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticleWrite other) {
    _$v = other as _$ArticleWrite;
  }

  @override
  void update(void Function(ArticleWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArticleWrite build() => _build();

  _$ArticleWrite _build() {
    final _$result = _$v ??
        _$ArticleWrite._(
          body: body,
          id: id,
          setId: setId,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ArticleWrite', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
