// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_set_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentSetWrite extends AgentSetWrite {
  @override
  final BuiltList<CardWrite>? cards;
  @override
  final String? description;
  @override
  final String? langDefinition;
  @override
  final String? langTerm;
  @override
  final String title;

  factory _$AgentSetWrite([void Function(AgentSetWriteBuilder)? updates]) =>
      (AgentSetWriteBuilder()..update(updates))._build();

  _$AgentSetWrite._(
      {this.cards,
      this.description,
      this.langDefinition,
      this.langTerm,
      required this.title})
      : super._();
  @override
  AgentSetWrite rebuild(void Function(AgentSetWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentSetWriteBuilder toBuilder() => AgentSetWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentSetWrite &&
        cards == other.cards &&
        description == other.description &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cards.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentSetWrite')
          ..add('cards', cards)
          ..add('description', description)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('title', title))
        .toString();
  }
}

class AgentSetWriteBuilder
    implements Builder<AgentSetWrite, AgentSetWriteBuilder> {
  _$AgentSetWrite? _$v;

  ListBuilder<CardWrite>? _cards;
  ListBuilder<CardWrite> get cards =>
      _$this._cards ??= ListBuilder<CardWrite>();
  set cards(ListBuilder<CardWrite>? cards) => _$this._cards = cards;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _langDefinition;
  String? get langDefinition => _$this._langDefinition;
  set langDefinition(String? langDefinition) =>
      _$this._langDefinition = langDefinition;

  String? _langTerm;
  String? get langTerm => _$this._langTerm;
  set langTerm(String? langTerm) => _$this._langTerm = langTerm;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentSetWriteBuilder() {
    AgentSetWrite._defaults(this);
  }

  AgentSetWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards?.toBuilder();
      _description = $v.description;
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentSetWrite other) {
    _$v = other as _$AgentSetWrite;
  }

  @override
  void update(void Function(AgentSetWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentSetWrite build() => _build();

  _$AgentSetWrite _build() {
    _$AgentSetWrite _$result;
    try {
      _$result = _$v ??
          _$AgentSetWrite._(
            cards: _cards?.build(),
            description: description,
            langDefinition: langDefinition,
            langTerm: langTerm,
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentSetWrite', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        _cards?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentSetWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
