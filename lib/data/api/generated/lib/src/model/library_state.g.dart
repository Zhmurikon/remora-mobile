// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LibraryState extends LibraryState {
  @override
  final bool courseSaved;
  @override
  final BuiltList<String> savedArticleIds;
  @override
  final BuiltList<String> savedSetIds;

  factory _$LibraryState([void Function(LibraryStateBuilder)? updates]) =>
      (LibraryStateBuilder()..update(updates))._build();

  _$LibraryState._(
      {required this.courseSaved,
      required this.savedArticleIds,
      required this.savedSetIds})
      : super._();
  @override
  LibraryState rebuild(void Function(LibraryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryStateBuilder toBuilder() => LibraryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryState &&
        courseSaved == other.courseSaved &&
        savedArticleIds == other.savedArticleIds &&
        savedSetIds == other.savedSetIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, courseSaved.hashCode);
    _$hash = $jc(_$hash, savedArticleIds.hashCode);
    _$hash = $jc(_$hash, savedSetIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LibraryState')
          ..add('courseSaved', courseSaved)
          ..add('savedArticleIds', savedArticleIds)
          ..add('savedSetIds', savedSetIds))
        .toString();
  }
}

class LibraryStateBuilder
    implements Builder<LibraryState, LibraryStateBuilder> {
  _$LibraryState? _$v;

  bool? _courseSaved;
  bool? get courseSaved => _$this._courseSaved;
  set courseSaved(bool? courseSaved) => _$this._courseSaved = courseSaved;

  ListBuilder<String>? _savedArticleIds;
  ListBuilder<String> get savedArticleIds =>
      _$this._savedArticleIds ??= ListBuilder<String>();
  set savedArticleIds(ListBuilder<String>? savedArticleIds) =>
      _$this._savedArticleIds = savedArticleIds;

  ListBuilder<String>? _savedSetIds;
  ListBuilder<String> get savedSetIds =>
      _$this._savedSetIds ??= ListBuilder<String>();
  set savedSetIds(ListBuilder<String>? savedSetIds) =>
      _$this._savedSetIds = savedSetIds;

  LibraryStateBuilder() {
    LibraryState._defaults(this);
  }

  LibraryStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _courseSaved = $v.courseSaved;
      _savedArticleIds = $v.savedArticleIds.toBuilder();
      _savedSetIds = $v.savedSetIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryState other) {
    _$v = other as _$LibraryState;
  }

  @override
  void update(void Function(LibraryStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LibraryState build() => _build();

  _$LibraryState _build() {
    _$LibraryState _$result;
    try {
      _$result = _$v ??
          _$LibraryState._(
            courseSaved: BuiltValueNullFieldError.checkNotNull(
                courseSaved, r'LibraryState', 'courseSaved'),
            savedArticleIds: savedArticleIds.build(),
            savedSetIds: savedSetIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'savedArticleIds';
        savedArticleIds.build();
        _$failedField = 'savedSetIds';
        savedSetIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'LibraryState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
