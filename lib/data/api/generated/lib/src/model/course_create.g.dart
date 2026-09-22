// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseCreate extends CourseCreate {
  @override
  final String? description;
  @override
  final String? setId;
  @override
  final String title;

  factory _$CourseCreate([void Function(CourseCreateBuilder)? updates]) =>
      (CourseCreateBuilder()..update(updates))._build();

  _$CourseCreate._({this.description, this.setId, required this.title})
      : super._();
  @override
  CourseCreate rebuild(void Function(CourseCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseCreateBuilder toBuilder() => CourseCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseCreate &&
        description == other.description &&
        setId == other.setId &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseCreate')
          ..add('description', description)
          ..add('setId', setId)
          ..add('title', title))
        .toString();
  }
}

class CourseCreateBuilder
    implements Builder<CourseCreate, CourseCreateBuilder> {
  _$CourseCreate? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  CourseCreateBuilder() {
    CourseCreate._defaults(this);
  }

  CourseCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _setId = $v.setId;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseCreate other) {
    _$v = other as _$CourseCreate;
  }

  @override
  void update(void Function(CourseCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseCreate build() => _build();

  _$CourseCreate _build() {
    final _$result = _$v ??
        _$CourseCreate._(
          description: description,
          setId: setId,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'CourseCreate', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
