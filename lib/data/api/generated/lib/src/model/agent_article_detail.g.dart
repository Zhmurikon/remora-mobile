// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_article_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentArticleDetail extends AgentArticleDetail {
  @override
  final String body;
  @override
  final String id;
  @override
  final AgentSetDetail material;
  @override
  final int position;
  @override
  final String title;

  factory _$AgentArticleDetail(
          [void Function(AgentArticleDetailBuilder)? updates]) =>
      (AgentArticleDetailBuilder()..update(updates))._build();

  _$AgentArticleDetail._(
      {required this.body,
      required this.id,
      required this.material,
      required this.position,
      required this.title})
      : super._();
  @override
  AgentArticleDetail rebuild(
          void Function(AgentArticleDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentArticleDetailBuilder toBuilder() =>
      AgentArticleDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentArticleDetail &&
        body == other.body &&
        id == other.id &&
        material == other.material &&
        position == other.position &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, material.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentArticleDetail')
          ..add('body', body)
          ..add('id', id)
          ..add('material', material)
          ..add('position', position)
          ..add('title', title))
        .toString();
  }
}

class AgentArticleDetailBuilder
    implements Builder<AgentArticleDetail, AgentArticleDetailBuilder> {
  _$AgentArticleDetail? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  AgentSetDetailBuilder? _material;
  AgentSetDetailBuilder get material =>
      _$this._material ??= AgentSetDetailBuilder();
  set material(AgentSetDetailBuilder? material) => _$this._material = material;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentArticleDetailBuilder() {
    AgentArticleDetail._defaults(this);
  }

  AgentArticleDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _id = $v.id;
      _material = $v.material.toBuilder();
      _position = $v.position;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentArticleDetail other) {
    _$v = other as _$AgentArticleDetail;
  }

  @override
  void update(void Function(AgentArticleDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentArticleDetail build() => _build();

  _$AgentArticleDetail _build() {
    _$AgentArticleDetail _$result;
    try {
      _$result = _$v ??
          _$AgentArticleDetail._(
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'AgentArticleDetail', 'body'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AgentArticleDetail', 'id'),
            material: material.build(),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'AgentArticleDetail', 'position'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentArticleDetail', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'material';
        material.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentArticleDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
