// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SectionWrite extends SectionWrite {
  @override
  final BuiltList<ArticleWrite>? articles;
  @override
  final String? id;
  @override
  final String title;

  factory _$SectionWrite([void Function(SectionWriteBuilder)? updates]) =>
      (SectionWriteBuilder()..update(updates))._build();

  _$SectionWrite._({this.articles, this.id, required this.title}) : super._();
  @override
  SectionWrite rebuild(void Function(SectionWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectionWriteBuilder toBuilder() => SectionWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SectionWrite &&
        articles == other.articles &&
        id == other.id &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SectionWrite')
          ..add('articles', articles)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class SectionWriteBuilder
    implements Builder<SectionWrite, SectionWriteBuilder> {
  _$SectionWrite? _$v;

  ListBuilder<ArticleWrite>? _articles;
  ListBuilder<ArticleWrite> get articles =>
      _$this._articles ??= ListBuilder<ArticleWrite>();
  set articles(ListBuilder<ArticleWrite>? articles) =>
      _$this._articles = articles;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  SectionWriteBuilder() {
    SectionWrite._defaults(this);
  }

  SectionWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articles = $v.articles?.toBuilder();
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SectionWrite other) {
    _$v = other as _$SectionWrite;
  }

  @override
  void update(void Function(SectionWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SectionWrite build() => _build();

  _$SectionWrite _build() {
    _$SectionWrite _$result;
    try {
      _$result = _$v ??
          _$SectionWrite._(
            articles: _articles?.build(),
            id: id,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'SectionWrite', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        _articles?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SectionWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
