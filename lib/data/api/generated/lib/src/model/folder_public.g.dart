// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FolderPublic extends FolderPublic {
  @override
  final String color;
  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final String? parentId;
  @override
  final int position;
  @override
  final String title;
  @override
  final DateTime updatedAt;

  factory _$FolderPublic([void Function(FolderPublicBuilder)? updates]) =>
      (FolderPublicBuilder()..update(updates))._build();

  _$FolderPublic._(
      {required this.color,
      required this.createdAt,
      required this.id,
      this.parentId,
      required this.position,
      required this.title,
      required this.updatedAt})
      : super._();
  @override
  FolderPublic rebuild(void Function(FolderPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FolderPublicBuilder toBuilder() => FolderPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FolderPublic &&
        color == other.color &&
        createdAt == other.createdAt &&
        id == other.id &&
        parentId == other.parentId &&
        position == other.position &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FolderPublic')
          ..add('color', color)
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('parentId', parentId)
          ..add('position', position)
          ..add('title', title)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class FolderPublicBuilder
    implements Builder<FolderPublic, FolderPublicBuilder> {
  _$FolderPublic? _$v;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  FolderPublicBuilder() {
    FolderPublic._defaults(this);
  }

  FolderPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color;
      _createdAt = $v.createdAt;
      _id = $v.id;
      _parentId = $v.parentId;
      _position = $v.position;
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FolderPublic other) {
    _$v = other as _$FolderPublic;
  }

  @override
  void update(void Function(FolderPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FolderPublic build() => _build();

  _$FolderPublic _build() {
    final _$result = _$v ??
        _$FolderPublic._(
          color: BuiltValueNullFieldError.checkNotNull(
              color, r'FolderPublic', 'color'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'FolderPublic', 'createdAt'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'FolderPublic', 'id'),
          parentId: parentId,
          position: BuiltValueNullFieldError.checkNotNull(
              position, r'FolderPublic', 'position'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'FolderPublic', 'title'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'FolderPublic', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
