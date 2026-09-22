// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_error_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ImportErrorItem extends ImportErrorItem {
  @override
  final String message;
  @override
  final int? row;

  factory _$ImportErrorItem([void Function(ImportErrorItemBuilder)? updates]) =>
      (ImportErrorItemBuilder()..update(updates))._build();

  _$ImportErrorItem._({required this.message, this.row}) : super._();
  @override
  ImportErrorItem rebuild(void Function(ImportErrorItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportErrorItemBuilder toBuilder() => ImportErrorItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportErrorItem &&
        message == other.message &&
        row == other.row;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, row.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImportErrorItem')
          ..add('message', message)
          ..add('row', row))
        .toString();
  }
}

class ImportErrorItemBuilder
    implements Builder<ImportErrorItem, ImportErrorItemBuilder> {
  _$ImportErrorItem? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _row;
  int? get row => _$this._row;
  set row(int? row) => _$this._row = row;

  ImportErrorItemBuilder() {
    ImportErrorItem._defaults(this);
  }

  ImportErrorItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _row = $v.row;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportErrorItem other) {
    _$v = other as _$ImportErrorItem;
  }

  @override
  void update(void Function(ImportErrorItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImportErrorItem build() => _build();

  _$ImportErrorItem _build() {
    final _$result = _$v ??
        _$ImportErrorItem._(
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ImportErrorItem', 'message'),
          row: row,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
