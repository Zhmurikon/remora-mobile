// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseSectionPublic extends CourseSectionPublic {
  @override
  final BuiltList<CourseArticlePublic> articles;
  @override
  final String id;
  @override
  final int position;
  @override
  final String title;

  factory _$CourseSectionPublic(
          [void Function(CourseSectionPublicBuilder)? updates]) =>
      (CourseSectionPublicBuilder()..update(updates))._build();

  _$CourseSectionPublic._(
      {required this.articles,
      required this.id,
      required this.position,
      required this.title})
      : super._();
  @override
  CourseSectionPublic rebuild(
          void Function(CourseSectionPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseSectionPublicBuilder toBuilder() =>
      CourseSectionPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseSectionPublic &&
        articles == other.articles &&
        id == other.id &&
        position == other.position &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseSectionPublic')
          ..add('articles', articles)
          ..add('id', id)
          ..add('position', position)
          ..add('title', title))
        .toString();
  }
}

class CourseSectionPublicBuilder
    implements Builder<CourseSectionPublic, CourseSectionPublicBuilder> {
  _$CourseSectionPublic? _$v;

  ListBuilder<CourseArticlePublic>? _articles;
  ListBuilder<CourseArticlePublic> get articles =>
      _$this._articles ??= ListBuilder<CourseArticlePublic>();
  set articles(ListBuilder<CourseArticlePublic>? articles) =>
      _$this._articles = articles;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  CourseSectionPublicBuilder() {
    CourseSectionPublic._defaults(this);
  }

  CourseSectionPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articles = $v.articles.toBuilder();
      _id = $v.id;
      _position = $v.position;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseSectionPublic other) {
    _$v = other as _$CourseSectionPublic;
  }

  @override
  void update(void Function(CourseSectionPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseSectionPublic build() => _build();

  _$CourseSectionPublic _build() {
    _$CourseSectionPublic _$result;
    try {
      _$result = _$v ??
          _$CourseSectionPublic._(
            articles: articles.build(),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CourseSectionPublic', 'id'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'CourseSectionPublic', 'position'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseSectionPublic', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseSectionPublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
