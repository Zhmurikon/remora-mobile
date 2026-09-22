// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_section_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentSectionDetail extends AgentSectionDetail {
  @override
  final BuiltList<AgentArticleDetail> articles;
  @override
  final String id;
  @override
  final int position;
  @override
  final String title;

  factory _$AgentSectionDetail(
          [void Function(AgentSectionDetailBuilder)? updates]) =>
      (AgentSectionDetailBuilder()..update(updates))._build();

  _$AgentSectionDetail._(
      {required this.articles,
      required this.id,
      required this.position,
      required this.title})
      : super._();
  @override
  AgentSectionDetail rebuild(
          void Function(AgentSectionDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentSectionDetailBuilder toBuilder() =>
      AgentSectionDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentSectionDetail &&
        articles == other.articles &&
        id == other.id &&
        position == other.position &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentSectionDetail')
          ..add('articles', articles)
          ..add('id', id)
          ..add('position', position)
          ..add('title', title))
        .toString();
  }
}

class AgentSectionDetailBuilder
    implements Builder<AgentSectionDetail, AgentSectionDetailBuilder> {
  _$AgentSectionDetail? _$v;

  ListBuilder<AgentArticleDetail>? _articles;
  ListBuilder<AgentArticleDetail> get articles =>
      _$this._articles ??= ListBuilder<AgentArticleDetail>();
  set articles(ListBuilder<AgentArticleDetail>? articles) =>
      _$this._articles = articles;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentSectionDetailBuilder() {
    AgentSectionDetail._defaults(this);
  }

  AgentSectionDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articles = $v.articles.toBuilder();
      _id = $v.id;
      _position = $v.position;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentSectionDetail other) {
    _$v = other as _$AgentSectionDetail;
  }

  @override
  void update(void Function(AgentSectionDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentSectionDetail build() => _build();

  _$AgentSectionDetail _build() {
    _$AgentSectionDetail _$result;
    try {
      _$result = _$v ??
          _$AgentSectionDetail._(
            articles: articles.build(),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AgentSectionDetail', 'id'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'AgentSectionDetail', 'position'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentSectionDetail', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentSectionDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
