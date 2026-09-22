// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetSummary extends SetSummary {
  @override
  final int cardsCount;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final String? folderId;
  @override
  final String id;
  @override
  final String slug;
  @override
  final String title;
  @override
  final DateTime updatedAt;
  @override
  final SetVisibility visibility;

  factory _$SetSummary([void Function(SetSummaryBuilder)? updates]) =>
      (SetSummaryBuilder()..update(updates))._build();

  _$SetSummary._(
      {required this.cardsCount,
      required this.createdAt,
      required this.description,
      this.folderId,
      required this.id,
      required this.slug,
      required this.title,
      required this.updatedAt,
      required this.visibility})
      : super._();
  @override
  SetSummary rebuild(void Function(SetSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetSummaryBuilder toBuilder() => SetSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetSummary &&
        cardsCount == other.cardsCount &&
        createdAt == other.createdAt &&
        description == other.description &&
        folderId == other.folderId &&
        id == other.id &&
        slug == other.slug &&
        title == other.title &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetSummary')
          ..add('cardsCount', cardsCount)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('folderId', folderId)
          ..add('id', id)
          ..add('slug', slug)
          ..add('title', title)
          ..add('updatedAt', updatedAt)
          ..add('visibility', visibility))
        .toString();
  }
}

class SetSummaryBuilder implements Builder<SetSummary, SetSummaryBuilder> {
  _$SetSummary? _$v;

  int? _cardsCount;
  int? get cardsCount => _$this._cardsCount;
  set cardsCount(int? cardsCount) => _$this._cardsCount = cardsCount;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  SetVisibility? _visibility;
  SetVisibility? get visibility => _$this._visibility;
  set visibility(SetVisibility? visibility) => _$this._visibility = visibility;

  SetSummaryBuilder() {
    SetSummary._defaults(this);
  }

  SetSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardsCount = $v.cardsCount;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _folderId = $v.folderId;
      _id = $v.id;
      _slug = $v.slug;
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetSummary other) {
    _$v = other as _$SetSummary;
  }

  @override
  void update(void Function(SetSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetSummary build() => _build();

  _$SetSummary _build() {
    final _$result = _$v ??
        _$SetSummary._(
          cardsCount: BuiltValueNullFieldError.checkNotNull(
              cardsCount, r'SetSummary', 'cardsCount'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'SetSummary', 'createdAt'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'SetSummary', 'description'),
          folderId: folderId,
          id: BuiltValueNullFieldError.checkNotNull(id, r'SetSummary', 'id'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'SetSummary', 'slug'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'SetSummary', 'title'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'SetSummary', 'updatedAt'),
          visibility: BuiltValueNullFieldError.checkNotNull(
              visibility, r'SetSummary', 'visibility'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
