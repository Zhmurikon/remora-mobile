// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_metadata.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseMetadata extends CourseMetadata {
  @override
  final String? description;
  @override
  final String title;

  factory _$CourseMetadata([void Function(CourseMetadataBuilder)? updates]) =>
      (CourseMetadataBuilder()..update(updates))._build();

  _$CourseMetadata._({this.description, required this.title}) : super._();
  @override
  CourseMetadata rebuild(void Function(CourseMetadataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseMetadataBuilder toBuilder() => CourseMetadataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseMetadata &&
        description == other.description &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseMetadata')
          ..add('description', description)
          ..add('title', title))
        .toString();
  }
}

class CourseMetadataBuilder
    implements Builder<CourseMetadata, CourseMetadataBuilder> {
  _$CourseMetadata? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  CourseMetadataBuilder() {
    CourseMetadata._defaults(this);
  }

  CourseMetadataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseMetadata other) {
    _$v = other as _$CourseMetadata;
  }

  @override
  void update(void Function(CourseMetadataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseMetadata build() => _build();

  _$CourseMetadata _build() {
    final _$result = _$v ??
        _$CourseMetadata._(
          description: description,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'CourseMetadata', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
