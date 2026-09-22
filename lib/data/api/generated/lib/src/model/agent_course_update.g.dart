// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_course_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentCourseUpdate extends AgentCourseUpdate {
  @override
  final String? description;
  @override
  final String revision;
  @override
  final BuiltList<AgentSectionWrite>? sections;
  @override
  final String title;

  factory _$AgentCourseUpdate(
          [void Function(AgentCourseUpdateBuilder)? updates]) =>
      (AgentCourseUpdateBuilder()..update(updates))._build();

  _$AgentCourseUpdate._(
      {this.description,
      required this.revision,
      this.sections,
      required this.title})
      : super._();
  @override
  AgentCourseUpdate rebuild(void Function(AgentCourseUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentCourseUpdateBuilder toBuilder() =>
      AgentCourseUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentCourseUpdate &&
        description == other.description &&
        revision == other.revision &&
        sections == other.sections &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, revision.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentCourseUpdate')
          ..add('description', description)
          ..add('revision', revision)
          ..add('sections', sections)
          ..add('title', title))
        .toString();
  }
}

class AgentCourseUpdateBuilder
    implements Builder<AgentCourseUpdate, AgentCourseUpdateBuilder> {
  _$AgentCourseUpdate? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _revision;
  String? get revision => _$this._revision;
  set revision(String? revision) => _$this._revision = revision;

  ListBuilder<AgentSectionWrite>? _sections;
  ListBuilder<AgentSectionWrite> get sections =>
      _$this._sections ??= ListBuilder<AgentSectionWrite>();
  set sections(ListBuilder<AgentSectionWrite>? sections) =>
      _$this._sections = sections;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentCourseUpdateBuilder() {
    AgentCourseUpdate._defaults(this);
  }

  AgentCourseUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _revision = $v.revision;
      _sections = $v.sections?.toBuilder();
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentCourseUpdate other) {
    _$v = other as _$AgentCourseUpdate;
  }

  @override
  void update(void Function(AgentCourseUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentCourseUpdate build() => _build();

  _$AgentCourseUpdate _build() {
    _$AgentCourseUpdate _$result;
    try {
      _$result = _$v ??
          _$AgentCourseUpdate._(
            description: description,
            revision: BuiltValueNullFieldError.checkNotNull(
                revision, r'AgentCourseUpdate', 'revision'),
            sections: _sections?.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentCourseUpdate', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        _sections?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentCourseUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
