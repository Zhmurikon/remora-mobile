// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetUpdate extends SetUpdate {
  @override
  final String? description;
  @override
  final String? folderId;
  @override
  final String? langDefinition;
  @override
  final String? langTerm;
  @override
  final String title;
  @override
  final SetVisibility? visibility;

  factory _$SetUpdate([void Function(SetUpdateBuilder)? updates]) =>
      (SetUpdateBuilder()..update(updates))._build();

  _$SetUpdate._(
      {this.description,
      this.folderId,
      this.langDefinition,
      this.langTerm,
      required this.title,
      this.visibility})
      : super._();
  @override
  SetUpdate rebuild(void Function(SetUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetUpdateBuilder toBuilder() => SetUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetUpdate &&
        description == other.description &&
        folderId == other.folderId &&
        langDefinition == other.langDefinition &&
        langTerm == other.langTerm &&
        title == other.title &&
        visibility == other.visibility;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, langDefinition.hashCode);
    _$hash = $jc(_$hash, langTerm.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetUpdate')
          ..add('description', description)
          ..add('folderId', folderId)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('title', title)
          ..add('visibility', visibility))
        .toString();
  }
}

class SetUpdateBuilder implements Builder<SetUpdate, SetUpdateBuilder> {
  _$SetUpdate? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _folderId;
  String? get folderId => _$this._folderId;
  set folderId(String? folderId) => _$this._folderId = folderId;

  String? _langDefinition;
  String? get langDefinition => _$this._langDefinition;
  set langDefinition(String? langDefinition) =>
      _$this._langDefinition = langDefinition;

  String? _langTerm;
  String? get langTerm => _$this._langTerm;
  set langTerm(String? langTerm) => _$this._langTerm = langTerm;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  SetVisibility? _visibility;
  SetVisibility? get visibility => _$this._visibility;
  set visibility(SetVisibility? visibility) => _$this._visibility = visibility;

  SetUpdateBuilder() {
    SetUpdate._defaults(this);
  }

  SetUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _folderId = $v.folderId;
      _langDefinition = $v.langDefinition;
      _langTerm = $v.langTerm;
      _title = $v.title;
      _visibility = $v.visibility;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetUpdate other) {
    _$v = other as _$SetUpdate;
  }

  @override
  void update(void Function(SetUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetUpdate build() => _build();

  _$SetUpdate _build() {
    final _$result = _$v ??
        _$SetUpdate._(
          description: description,
          folderId: folderId,
          langDefinition: langDefinition,
          langTerm: langTerm,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'SetUpdate', 'title'),
          visibility: visibility,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
