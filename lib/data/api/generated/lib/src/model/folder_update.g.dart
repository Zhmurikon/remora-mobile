// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FolderUpdate extends FolderUpdate {
  @override
  final String? color;
  @override
  final String? parentId;
  @override
  final int? position;
  @override
  final String? title;

  factory _$FolderUpdate([void Function(FolderUpdateBuilder)? updates]) =>
      (FolderUpdateBuilder()..update(updates))._build();

  _$FolderUpdate._({this.color, this.parentId, this.position, this.title})
      : super._();
  @override
  FolderUpdate rebuild(void Function(FolderUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FolderUpdateBuilder toBuilder() => FolderUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FolderUpdate &&
        color == other.color &&
        parentId == other.parentId &&
        position == other.position &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FolderUpdate')
          ..add('color', color)
          ..add('parentId', parentId)
          ..add('position', position)
          ..add('title', title))
        .toString();
  }
}

class FolderUpdateBuilder
    implements Builder<FolderUpdate, FolderUpdateBuilder> {
  _$FolderUpdate? _$v;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  FolderUpdateBuilder() {
    FolderUpdate._defaults(this);
  }

  FolderUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color;
      _parentId = $v.parentId;
      _position = $v.position;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FolderUpdate other) {
    _$v = other as _$FolderUpdate;
  }

  @override
  void update(void Function(FolderUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FolderUpdate build() => _build();

  _$FolderUpdate _build() {
    final _$result = _$v ??
        _$FolderUpdate._(
          color: color,
          parentId: parentId,
          position: position,
          title: title,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
