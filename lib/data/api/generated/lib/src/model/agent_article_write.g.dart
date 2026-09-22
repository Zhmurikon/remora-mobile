// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_article_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentArticleWrite extends AgentArticleWrite {
  @override
  final String? body;
  @override
  final String? id;
  @override
  final AgentSetWrite material;
  @override
  final String title;

  factory _$AgentArticleWrite(
          [void Function(AgentArticleWriteBuilder)? updates]) =>
      (AgentArticleWriteBuilder()..update(updates))._build();

  _$AgentArticleWrite._(
      {this.body, this.id, required this.material, required this.title})
      : super._();
  @override
  AgentArticleWrite rebuild(void Function(AgentArticleWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentArticleWriteBuilder toBuilder() =>
      AgentArticleWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentArticleWrite &&
        body == other.body &&
        id == other.id &&
        material == other.material &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, material.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentArticleWrite')
          ..add('body', body)
          ..add('id', id)
          ..add('material', material)
          ..add('title', title))
        .toString();
  }
}

class AgentArticleWriteBuilder
    implements Builder<AgentArticleWrite, AgentArticleWriteBuilder> {
  _$AgentArticleWrite? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  AgentSetWriteBuilder? _material;
  AgentSetWriteBuilder get material =>
      _$this._material ??= AgentSetWriteBuilder();
  set material(AgentSetWriteBuilder? material) => _$this._material = material;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentArticleWriteBuilder() {
    AgentArticleWrite._defaults(this);
  }

  AgentArticleWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _id = $v.id;
      _material = $v.material.toBuilder();
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentArticleWrite other) {
    _$v = other as _$AgentArticleWrite;
  }

  @override
  void update(void Function(AgentArticleWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentArticleWrite build() => _build();

  _$AgentArticleWrite _build() {
    _$AgentArticleWrite _$result;
    try {
      _$result = _$v ??
          _$AgentArticleWrite._(
            body: body,
            id: id,
            material: material.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentArticleWrite', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'material';
        material.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentArticleWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
