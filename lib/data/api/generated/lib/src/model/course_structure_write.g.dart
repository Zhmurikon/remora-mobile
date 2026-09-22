// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_structure_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseStructureWrite extends CourseStructureWrite {
  @override
  final String revision;
  @override
  final BuiltList<SectionWrite> sections;

  factory _$CourseStructureWrite(
          [void Function(CourseStructureWriteBuilder)? updates]) =>
      (CourseStructureWriteBuilder()..update(updates))._build();

  _$CourseStructureWrite._({required this.revision, required this.sections})
      : super._();
  @override
  CourseStructureWrite rebuild(
          void Function(CourseStructureWriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseStructureWriteBuilder toBuilder() =>
      CourseStructureWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseStructureWrite &&
        revision == other.revision &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, revision.hashCode);
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseStructureWrite')
          ..add('revision', revision)
          ..add('sections', sections))
        .toString();
  }
}

class CourseStructureWriteBuilder
    implements Builder<CourseStructureWrite, CourseStructureWriteBuilder> {
  _$CourseStructureWrite? _$v;

  String? _revision;
  String? get revision => _$this._revision;
  set revision(String? revision) => _$this._revision = revision;

  ListBuilder<SectionWrite>? _sections;
  ListBuilder<SectionWrite> get sections =>
      _$this._sections ??= ListBuilder<SectionWrite>();
  set sections(ListBuilder<SectionWrite>? sections) =>
      _$this._sections = sections;

  CourseStructureWriteBuilder() {
    CourseStructureWrite._defaults(this);
  }

  CourseStructureWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _revision = $v.revision;
      _sections = $v.sections.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseStructureWrite other) {
    _$v = other as _$CourseStructureWrite;
  }

  @override
  void update(void Function(CourseStructureWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseStructureWrite build() => _build();

  _$CourseStructureWrite _build() {
    _$CourseStructureWrite _$result;
    try {
      _$result = _$v ??
          _$CourseStructureWrite._(
            revision: BuiltValueNullFieldError.checkNotNull(
                revision, r'CourseStructureWrite', 'revision'),
            sections: sections.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        sections.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseStructureWrite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
