// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_article_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseArticlePublic extends CourseArticlePublic {
  @override
  final String body;
  @override
  final String id;
  @override
  final BuiltList<ArticleMediaRef>? media;
  @override
  final int position;
  @override
  final String setId;
  @override
  final String title;

  factory _$CourseArticlePublic(
          [void Function(CourseArticlePublicBuilder)? updates]) =>
      (CourseArticlePublicBuilder()..update(updates))._build();

  _$CourseArticlePublic._(
      {required this.body,
      required this.id,
      this.media,
      required this.position,
      required this.setId,
      required this.title})
      : super._();
  @override
  CourseArticlePublic rebuild(
          void Function(CourseArticlePublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseArticlePublicBuilder toBuilder() =>
      CourseArticlePublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseArticlePublic &&
        body == other.body &&
        id == other.id &&
        media == other.media &&
        position == other.position &&
        setId == other.setId &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseArticlePublic')
          ..add('body', body)
          ..add('id', id)
          ..add('media', media)
          ..add('position', position)
          ..add('setId', setId)
          ..add('title', title))
        .toString();
  }
}

class CourseArticlePublicBuilder
    implements Builder<CourseArticlePublic, CourseArticlePublicBuilder> {
  _$CourseArticlePublic? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<ArticleMediaRef>? _media;
  ListBuilder<ArticleMediaRef> get media =>
      _$this._media ??= ListBuilder<ArticleMediaRef>();
  set media(ListBuilder<ArticleMediaRef>? media) => _$this._media = media;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  CourseArticlePublicBuilder() {
    CourseArticlePublic._defaults(this);
  }

  CourseArticlePublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _id = $v.id;
      _media = $v.media?.toBuilder();
      _position = $v.position;
      _setId = $v.setId;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseArticlePublic other) {
    _$v = other as _$CourseArticlePublic;
  }

  @override
  void update(void Function(CourseArticlePublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseArticlePublic build() => _build();

  _$CourseArticlePublic _build() {
    _$CourseArticlePublic _$result;
    try {
      _$result = _$v ??
          _$CourseArticlePublic._(
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'CourseArticlePublic', 'body'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CourseArticlePublic', 'id'),
            media: _media?.build(),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'CourseArticlePublic', 'position'),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'CourseArticlePublic', 'setId'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'CourseArticlePublic', 'title'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseArticlePublic', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
