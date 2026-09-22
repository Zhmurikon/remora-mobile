// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LibraryItemTargetTypeEnum _$libraryItemTargetTypeEnum_course =
    const LibraryItemTargetTypeEnum._('course');
const LibraryItemTargetTypeEnum _$libraryItemTargetTypeEnum_article =
    const LibraryItemTargetTypeEnum._('article');
const LibraryItemTargetTypeEnum _$libraryItemTargetTypeEnum_set_ =
    const LibraryItemTargetTypeEnum._('set_');

LibraryItemTargetTypeEnum _$libraryItemTargetTypeEnumValueOf(String name) {
  switch (name) {
    case 'course':
      return _$libraryItemTargetTypeEnum_course;
    case 'article':
      return _$libraryItemTargetTypeEnum_article;
    case 'set_':
      return _$libraryItemTargetTypeEnum_set_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LibraryItemTargetTypeEnum> _$libraryItemTargetTypeEnumValues =
    BuiltSet<LibraryItemTargetTypeEnum>(const <LibraryItemTargetTypeEnum>[
  _$libraryItemTargetTypeEnum_course,
  _$libraryItemTargetTypeEnum_article,
  _$libraryItemTargetTypeEnum_set_,
]);

Serializer<LibraryItemTargetTypeEnum> _$libraryItemTargetTypeEnumSerializer =
    _$LibraryItemTargetTypeEnumSerializer();

class _$LibraryItemTargetTypeEnumSerializer
    implements PrimitiveSerializer<LibraryItemTargetTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'course': 'course',
    'article': 'article',
    'set_': 'set',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'course': 'course',
    'article': 'article',
    'set': 'set_',
  };

  @override
  final Iterable<Type> types = const <Type>[LibraryItemTargetTypeEnum];
  @override
  final String wireName = 'LibraryItemTargetTypeEnum';

  @override
  Object serialize(Serializers serializers, LibraryItemTargetTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LibraryItemTargetTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LibraryItemTargetTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$LibraryItem extends LibraryItem {
  @override
  final DateTime acceptedAt;
  @override
  final String? articleId;
  @override
  final String? articleTitle;
  @override
  final int cardsCount;
  @override
  final String courseId;
  @override
  final String courseSlug;
  @override
  final String courseTitle;
  @override
  final bool hasUpdates;
  @override
  final String id;
  @override
  final DateTime savedAt;
  @override
  final String? setId;
  @override
  final String? setTitle;
  @override
  final String targetId;
  @override
  final LibraryItemTargetTypeEnum targetType;

  factory _$LibraryItem([void Function(LibraryItemBuilder)? updates]) =>
      (LibraryItemBuilder()..update(updates))._build();

  _$LibraryItem._(
      {required this.acceptedAt,
      this.articleId,
      this.articleTitle,
      required this.cardsCount,
      required this.courseId,
      required this.courseSlug,
      required this.courseTitle,
      required this.hasUpdates,
      required this.id,
      required this.savedAt,
      this.setId,
      this.setTitle,
      required this.targetId,
      required this.targetType})
      : super._();
  @override
  LibraryItem rebuild(void Function(LibraryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryItemBuilder toBuilder() => LibraryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryItem &&
        acceptedAt == other.acceptedAt &&
        articleId == other.articleId &&
        articleTitle == other.articleTitle &&
        cardsCount == other.cardsCount &&
        courseId == other.courseId &&
        courseSlug == other.courseSlug &&
        courseTitle == other.courseTitle &&
        hasUpdates == other.hasUpdates &&
        id == other.id &&
        savedAt == other.savedAt &&
        setId == other.setId &&
        setTitle == other.setTitle &&
        targetId == other.targetId &&
        targetType == other.targetType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, acceptedAt.hashCode);
    _$hash = $jc(_$hash, articleId.hashCode);
    _$hash = $jc(_$hash, articleTitle.hashCode);
    _$hash = $jc(_$hash, cardsCount.hashCode);
    _$hash = $jc(_$hash, courseId.hashCode);
    _$hash = $jc(_$hash, courseSlug.hashCode);
    _$hash = $jc(_$hash, courseTitle.hashCode);
    _$hash = $jc(_$hash, hasUpdates.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, savedAt.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, setTitle.hashCode);
    _$hash = $jc(_$hash, targetId.hashCode);
    _$hash = $jc(_$hash, targetType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LibraryItem')
          ..add('acceptedAt', acceptedAt)
          ..add('articleId', articleId)
          ..add('articleTitle', articleTitle)
          ..add('cardsCount', cardsCount)
          ..add('courseId', courseId)
          ..add('courseSlug', courseSlug)
          ..add('courseTitle', courseTitle)
          ..add('hasUpdates', hasUpdates)
          ..add('id', id)
          ..add('savedAt', savedAt)
          ..add('setId', setId)
          ..add('setTitle', setTitle)
          ..add('targetId', targetId)
          ..add('targetType', targetType))
        .toString();
  }
}

class LibraryItemBuilder implements Builder<LibraryItem, LibraryItemBuilder> {
  _$LibraryItem? _$v;

  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _$this._acceptedAt;
  set acceptedAt(DateTime? acceptedAt) => _$this._acceptedAt = acceptedAt;

  String? _articleId;
  String? get articleId => _$this._articleId;
  set articleId(String? articleId) => _$this._articleId = articleId;

  String? _articleTitle;
  String? get articleTitle => _$this._articleTitle;
  set articleTitle(String? articleTitle) => _$this._articleTitle = articleTitle;

  int? _cardsCount;
  int? get cardsCount => _$this._cardsCount;
  set cardsCount(int? cardsCount) => _$this._cardsCount = cardsCount;

  String? _courseId;
  String? get courseId => _$this._courseId;
  set courseId(String? courseId) => _$this._courseId = courseId;

  String? _courseSlug;
  String? get courseSlug => _$this._courseSlug;
  set courseSlug(String? courseSlug) => _$this._courseSlug = courseSlug;

  String? _courseTitle;
  String? get courseTitle => _$this._courseTitle;
  set courseTitle(String? courseTitle) => _$this._courseTitle = courseTitle;

  bool? _hasUpdates;
  bool? get hasUpdates => _$this._hasUpdates;
  set hasUpdates(bool? hasUpdates) => _$this._hasUpdates = hasUpdates;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _savedAt;
  DateTime? get savedAt => _$this._savedAt;
  set savedAt(DateTime? savedAt) => _$this._savedAt = savedAt;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  String? _setTitle;
  String? get setTitle => _$this._setTitle;
  set setTitle(String? setTitle) => _$this._setTitle = setTitle;

  String? _targetId;
  String? get targetId => _$this._targetId;
  set targetId(String? targetId) => _$this._targetId = targetId;

  LibraryItemTargetTypeEnum? _targetType;
  LibraryItemTargetTypeEnum? get targetType => _$this._targetType;
  set targetType(LibraryItemTargetTypeEnum? targetType) =>
      _$this._targetType = targetType;

  LibraryItemBuilder() {
    LibraryItem._defaults(this);
  }

  LibraryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _acceptedAt = $v.acceptedAt;
      _articleId = $v.articleId;
      _articleTitle = $v.articleTitle;
      _cardsCount = $v.cardsCount;
      _courseId = $v.courseId;
      _courseSlug = $v.courseSlug;
      _courseTitle = $v.courseTitle;
      _hasUpdates = $v.hasUpdates;
      _id = $v.id;
      _savedAt = $v.savedAt;
      _setId = $v.setId;
      _setTitle = $v.setTitle;
      _targetId = $v.targetId;
      _targetType = $v.targetType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryItem other) {
    _$v = other as _$LibraryItem;
  }

  @override
  void update(void Function(LibraryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LibraryItem build() => _build();

  _$LibraryItem _build() {
    final _$result = _$v ??
        _$LibraryItem._(
          acceptedAt: BuiltValueNullFieldError.checkNotNull(
              acceptedAt, r'LibraryItem', 'acceptedAt'),
          articleId: articleId,
          articleTitle: articleTitle,
          cardsCount: BuiltValueNullFieldError.checkNotNull(
              cardsCount, r'LibraryItem', 'cardsCount'),
          courseId: BuiltValueNullFieldError.checkNotNull(
              courseId, r'LibraryItem', 'courseId'),
          courseSlug: BuiltValueNullFieldError.checkNotNull(
              courseSlug, r'LibraryItem', 'courseSlug'),
          courseTitle: BuiltValueNullFieldError.checkNotNull(
              courseTitle, r'LibraryItem', 'courseTitle'),
          hasUpdates: BuiltValueNullFieldError.checkNotNull(
              hasUpdates, r'LibraryItem', 'hasUpdates'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'LibraryItem', 'id'),
          savedAt: BuiltValueNullFieldError.checkNotNull(
              savedAt, r'LibraryItem', 'savedAt'),
          setId: setId,
          setTitle: setTitle,
          targetId: BuiltValueNullFieldError.checkNotNull(
              targetId, r'LibraryItem', 'targetId'),
          targetType: BuiltValueNullFieldError.checkNotNull(
              targetType, r'LibraryItem', 'targetType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
