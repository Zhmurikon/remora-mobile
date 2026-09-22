// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_set_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentSetUpdate extends AgentSetUpdate {
  @override
  final BuiltList<CardWrite>? cards;
  @override
  final String? description;
  @override
  final String? langDefinition;
  @override
  final String? langTerm;
  @override
  final String revision;
  @override
  final String title;

  factory _$AgentSetUpdate([void Function(AgentSetUpdateBuilder)? updates]) =>
      (AgentSetUpdateBuilder()..update(updates))._build();

  _$AgentSetUpdate._(
      {this.cards,
      this.description,
      this.langDefinition,
      this.langTerm,
      required this.revision,
      required this.title})
      : super._();
  @override
  AgentSetUpdate rebuild(void Function(AgentSetUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentSetUpdateBuilder toBuilder() => AgentSetUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentSetUpdate &&
        cards == other.cards &&
        description == other.description &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        revision == other.revision &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cards.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, revision.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentSetUpdate')
          ..add('cards', cards)
          ..add('description', description)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('revision', revision)
          ..add('title', title))
        .toString();
  }
}

class AgentSetUpdateBuilder
    implements Builder<AgentSetUpdate, AgentSetUpdateBuilder> {
  _$AgentSetUpdate? _$v;

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

  String? _revision;
  String? get revision => _$this._revision;
  set revision(String? revision) => _$this._revision = revision;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentSetUpdateBuilder() {
    AgentSetUpdate._defaults(this);
  }

  AgentSetUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards?.toBuilder();
      _description = $v.description;
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _revision = $v.revision;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentSetUpdate other) {
    _$v = other as _$AgentSetUpdate;
  }

  @override
  void update(void Function(AgentSetUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentSetUpdate build() => _build();

  _$AgentSetUpdate _build() {
    _$AgentSetUpdate _$result;
    try {
      _$result = _$v ??
          _$AgentSetUpdate._(
            cards: _cards?.build(),
            description: description,
            langDefinition: langDefinition,
            langTerm: langTerm,
            revision: BuiltValueNullFieldError.checkNotNull(
                revision, r'AgentSetUpdate', 'revision'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentSetUpdate', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        _cards?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentSetUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
