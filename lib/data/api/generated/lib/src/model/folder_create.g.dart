// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FolderCreate extends FolderCreate {
  @override
  final String? color;
  @override
  final String? parentId;
  @override
  final String title;

  factory _$FolderCreate([void Function(FolderCreateBuilder)? updates]) =>
      (FolderCreateBuilder()..update(updates))._build();

  _$FolderCreate._({this.color, this.parentId, required this.title})
      : super._();
  @override
  FolderCreate rebuild(void Function(FolderCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FolderCreateBuilder toBuilder() => FolderCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FolderCreate &&
        color == other.color &&
        parentId == other.parentId &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FolderCreate')
          ..add('color', color)
          ..add('parentId', parentId)
          ..add('title', title))
        .toString();
  }
}

class FolderCreateBuilder
    implements Builder<FolderCreate, FolderCreateBuilder> {
  _$FolderCreate? _$v;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  FolderCreateBuilder() {
    FolderCreate._defaults(this);
  }

  FolderCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color;
      _parentId = $v.parentId;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FolderCreate other) {
    _$v = other as _$FolderCreate;
  }

  @override
  void update(void Function(FolderCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FolderCreate build() => _build();

  _$FolderCreate _build() {
    final _$result = _$v ??
        _$FolderCreate._(
          color: color,
          parentId: parentId,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'FolderCreate', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
