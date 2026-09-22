// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_search_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CourseSearchResult extends CourseSearchResult {
  @override
  final BuiltList<CourseSearchItem> items;
  @override
  final int? nextCursor;

  factory _$CourseSearchResult(
          [void Function(CourseSearchResultBuilder)? updates]) =>
      (CourseSearchResultBuilder()..update(updates))._build();

  _$CourseSearchResult._({required this.items, this.nextCursor}) : super._();
  @override
  CourseSearchResult rebuild(
          void Function(CourseSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseSearchResultBuilder toBuilder() =>
      CourseSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CourseSearchResult &&
        items == other.items &&
        nextCursor == other.nextCursor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextCursor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CourseSearchResult')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class CourseSearchResultBuilder
    implements Builder<CourseSearchResult, CourseSearchResultBuilder> {
  _$CourseSearchResult? _$v;

  ListBuilder<CourseSearchItem>? _items;
  ListBuilder<CourseSearchItem> get items =>
      _$this._items ??= ListBuilder<CourseSearchItem>();
  set items(ListBuilder<CourseSearchItem>? items) => _$this._items = items;

  int? _nextCursor;
  int? get nextCursor => _$this._nextCursor;
  set nextCursor(int? nextCursor) => _$this._nextCursor = nextCursor;

  CourseSearchResultBuilder() {
    CourseSearchResult._defaults(this);
  }

  CourseSearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CourseSearchResult other) {
    _$v = other as _$CourseSearchResult;
  }

  @override
  void update(void Function(CourseSearchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CourseSearchResult build() => _build();

  _$CourseSearchResult _build() {
    _$CourseSearchResult _$result;
    try {
      _$result = _$v ??
          _$CourseSearchResult._(
            items: items.build(),
            nextCursor: nextCursor,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CourseSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
