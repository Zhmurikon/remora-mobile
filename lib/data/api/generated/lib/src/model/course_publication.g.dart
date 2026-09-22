// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_publication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CoursePublication extends CoursePublication {
  @override
  final BuiltList<String>? tags;

  factory _$CoursePublication(
          [void Function(CoursePublicationBuilder)? updates]) =>
      (CoursePublicationBuilder()..update(updates))._build();

  _$CoursePublication._({this.tags}) : super._();
  @override
  CoursePublication rebuild(void Function(CoursePublicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoursePublicationBuilder toBuilder() =>
      CoursePublicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoursePublication && tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoursePublication')
          ..add('tags', tags))
        .toString();
  }
}

class CoursePublicationBuilder
    implements Builder<CoursePublication, CoursePublicationBuilder> {
  _$CoursePublication? _$v;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  CoursePublicationBuilder() {
    CoursePublication._defaults(this);
  }

  CoursePublicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tags = $v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoursePublication other) {
    _$v = other as _$CoursePublication;
  }

  @override
  void update(void Function(CoursePublicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoursePublication build() => _build();

  _$CoursePublication _build() {
    _$CoursePublication _$result;
    try {
      _$result = _$v ??
          _$CoursePublication._(
            tags: _tags?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CoursePublication', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
