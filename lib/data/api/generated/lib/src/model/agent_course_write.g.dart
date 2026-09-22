// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_course_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AgentCourseWrite extends AgentCourseWrite {
  @override
  final String? description;
  @override
  final BuiltList<AgentSectionWrite>? sections;
  @override
  final String title;

  factory _$AgentCourseWrite(
          [void Function(AgentCourseWriteBuilder)? updates]) =>
      (AgentCourseWriteBuilder()..update(updates))._build();

  _$AgentCourseWrite._({this.description, this.sections, required this.title})
      : super._();
  @override
  AgentCourseWrite rebuild(void Function(AgentCourseWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentCourseWriteBuilder toBuilder() =>
      AgentCourseWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentCourseWrite &&
        description == other.description &&
        sections == other.sections &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentCourseWrite')
          ..add('description', description)
          ..add('sections', sections)
          ..add('title', title))
        .toString();
  }
}

class AgentCourseWriteBuilder
    implements Builder<AgentCourseWrite, AgentCourseWriteBuilder> {
  _$AgentCourseWrite? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<AgentSectionWrite>? _sections;
  ListBuilder<AgentSectionWrite> get sections =>
      _$this._sections ??= ListBuilder<AgentSectionWrite>();
  set sections(ListBuilder<AgentSectionWrite>? sections) =>
      _$this._sections = sections;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AgentCourseWriteBuilder() {
    AgentCourseWrite._defaults(this);
  }

  AgentCourseWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _sections = $v.sections?.toBuilder();
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentCourseWrite other) {
    _$v = other as _$AgentCourseWrite;
  }

  @override
  void update(void Function(AgentCourseWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentCourseWrite build() => _build();

  _$AgentCourseWrite _build() {
    _$AgentCourseWrite _$result;
    try {
      _$result = _$v ??
          _$AgentCourseWrite._(
            description: description,
            sections: _sections?.build(),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AgentCourseWrite', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        _sections?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AgentCourseWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
