// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetCreate extends SetCreate {
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

  factory _$SetCreate([void Function(SetCreateBuilder)? updates]) =>
      (SetCreateBuilder()..update(updates))._build();

  _$SetCreate._(
      {this.description,
      this.folderId,
      this.langDefinition,
      this.langTerm,
      required this.title,
      this.visibility})
      : super._();
  @override
  SetCreate rebuild(void Function(SetCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetCreateBuilder toBuilder() => SetCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetCreate &&
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
    return (newBuiltValueToStringHelper(r'SetCreate')
          ..add('description', description)
          ..add('folderId', folderId)
          ..add('langDefinition', langDefinition)
          ..add('langTerm', langTerm)
          ..add('title', title)
          ..add('visibility', visibility))
        .toString();
  }
}

class SetCreateBuilder implements Builder<SetCreate, SetCreateBuilder> {
  _$SetCreate? _$v;

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

  SetCreateBuilder() {
    SetCreate._defaults(this);
  }

  SetCreateBuilder get _$this {
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
  void replace(SetCreate other) {
    _$v = other as _$SetCreate;
  }

  @override
  void update(void Function(SetCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetCreate build() => _build();

  _$SetCreate _build() {
    final _$result = _$v ??
        _$SetCreate._(
          description: description,
          folderId: folderId,
          langDefinition: langDefinition,
          langTerm: langTerm,
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'SetCreate', 'title'),
          visibility: visibility,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
