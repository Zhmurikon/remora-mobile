// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_section_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentSectionWrite extends AgentSectionWrite {
  @override
  final BuiltList<AgentArticleWrite>? articles;
  @override
  final String? id;
  @override
  final String title;

  factory _$AgentSectionWrite(
          [void Function(AgentSectionWriteBuilder)? updates]) =>
      (AgentSectionWriteBuilder()..update(updates))._build();

  _$AgentSectionWrite._({this.articles, this.id, required this.title})
      : super._();
  @override
  AgentSectionWrite rebuild(void Function(AgentSectionWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentSectionWriteBuilder toBuilder() =>
      AgentSectionWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentSectionWrite &&
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
    return (newBuiltValueToStringHelper(r'AgentSectionWrite')
          ..add('articles', articles)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class AgentSectionWriteBuilder
    implements Builder<AgentSectionWrite, AgentSectionWriteBuilder> {
  _$AgentSectionWrite? _$v;

  ListBuilder<AgentArticleWrite>? _articles;
  ListBuilder<AgentArticleWrite> get articles =>
      _$this._articles ??= ListBuilder<AgentArticleWrite>();
  set articles(ListBuilder<AgentArticleWrite>? articles) =>
      _$this._articles = articles;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentSectionWriteBuilder() {
    AgentSectionWrite._defaults(this);
  }

  AgentSectionWriteBuilder get _$this {
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
  void replace(AgentSectionWrite other) {
    _$v = other as _$AgentSectionWrite;
  }

  @override
  void update(void Function(AgentSectionWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentSectionWrite build() => _build();

  _$AgentSectionWrite _build() {
    _$AgentSectionWrite _$result;
    try {
      _$result = _$v ??
          _$AgentSectionWrite._(
            articles: _articles?.build(),
            id: id,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentSectionWrite', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        _articles?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentSectionWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
