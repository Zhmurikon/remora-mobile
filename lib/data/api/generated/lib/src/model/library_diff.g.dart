// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_diff.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LibraryDiff extends LibraryDiff {
  @override
  final DateTime acceptedAt;
  @override
  final int? articlesAdded;
  @override
  final int? articlesChanged;
  @override
  final int? articlesRemoved;
  @override
  final int? cardsAdded;
  @override
  final int? cardsChanged;
  @override
  final int? cardsRemoved;
  @override
  final bool hasUpdates;
  @override
  final String saveId;
  @override
  final BuiltList<String> summary;

  factory _$LibraryDiff([void Function(LibraryDiffBuilder)? updates]) =>
      (LibraryDiffBuilder()..update(updates))._build();

  _$LibraryDiff._(
      {required this.acceptedAt,
      this.articlesAdded,
      this.articlesChanged,
      this.articlesRemoved,
      this.cardsAdded,
      this.cardsChanged,
      this.cardsRemoved,
      required this.hasUpdates,
      required this.saveId,
      required this.summary})
      : super._();
  @override
  LibraryDiff rebuild(void Function(LibraryDiffBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryDiffBuilder toBuilder() => LibraryDiffBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryDiff &&
        acceptedAt == other.acceptedAt &&
        articlesAdded == other.articlesAdded &&
        articlesChanged == other.articlesChanged &&
        articlesRemoved == other.articlesRemoved &&
        cardsAdded == other.cardsAdded &&
        cardsChanged == other.cardsChanged &&
        cardsRemoved == other.cardsRemoved &&
        hasUpdates == other.hasUpdates &&
        saveId == other.saveId &&
        summary == other.summary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, acceptedAt.hashCode);
    _$hash = $jc(_$hash, articlesAdded.hashCode);
    _$hash = $jc(_$hash, articlesChanged.hashCode);
    _$hash = $jc(_$hash, articlesRemoved.hashCode);
    _$hash = $jc(_$hash, cardsAdded.hashCode);
    _$hash = $jc(_$hash, cardsChanged.hashCode);
    _$hash = $jc(_$hash, cardsRemoved.hashCode);
    _$hash = $jc(_$hash, hasUpdates.hashCode);
    _$hash = $jc(_$hash, saveId.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LibraryDiff')
          ..add('acceptedAt', acceptedAt)
          ..add('articlesAdded', articlesAdded)
          ..add('articlesChanged', articlesChanged)
          ..add('articlesRemoved', articlesRemoved)
          ..add('cardsAdded', cardsAdded)
          ..add('cardsChanged', cardsChanged)
          ..add('cardsRemoved', cardsRemoved)
          ..add('hasUpdates', hasUpdates)
          ..add('saveId', saveId)
          ..add('summary', summary))
        .toString();
  }
}

class LibraryDiffBuilder implements Builder<LibraryDiff, LibraryDiffBuilder> {
  _$LibraryDiff? _$v;

  DateTime? _acceptedAt;
  DateTime? get acceptedAt => _$this._acceptedAt;
  set acceptedAt(DateTime? acceptedAt) => _$this._acceptedAt = acceptedAt;

  int? _articlesAdded;
  int? get articlesAdded => _$this._articlesAdded;
  set articlesAdded(int? articlesAdded) =>
      _$this._articlesAdded = articlesAdded;

  int? _articlesChanged;
  int? get articlesChanged => _$this._articlesChanged;
  set articlesChanged(int? articlesChanged) =>
      _$this._articlesChanged = articlesChanged;

  int? _articlesRemoved;
  int? get articlesRemoved => _$this._articlesRemoved;
  set articlesRemoved(int? articlesRemoved) =>
      _$this._articlesRemoved = articlesRemoved;

  int? _cardsAdded;
  int? get cardsAdded => _$this._cardsAdded;
  set cardsAdded(int? cardsAdded) => _$this._cardsAdded = cardsAdded;

  int? _cardsChanged;
  int? get cardsChanged => _$this._cardsChanged;
  set cardsChanged(int? cardsChanged) => _$this._cardsChanged = cardsChanged;

  int? _cardsRemoved;
  int? get cardsRemoved => _$this._cardsRemoved;
  set cardsRemoved(int? cardsRemoved) => _$this._cardsRemoved = cardsRemoved;

  bool? _hasUpdates;
  bool? get hasUpdates => _$this._hasUpdates;
  set hasUpdates(bool? hasUpdates) => _$this._hasUpdates = hasUpdates;

  String? _saveId;
  String? get saveId => _$this._saveId;
  set saveId(String? saveId) => _$this._saveId = saveId;

  ListBuilder<String>? _summary;
  ListBuilder<String> get summary => _$this._summary ??= ListBuilder<String>();
  set summary(ListBuilder<String>? summary) => _$this._summary = summary;

  LibraryDiffBuilder() {
    LibraryDiff._defaults(this);
  }

  LibraryDiffBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _acceptedAt = $v.acceptedAt;
      _articlesAdded = $v.articlesAdded;
      _articlesChanged = $v.articlesChanged;
      _articlesRemoved = $v.articlesRemoved;
      _cardsAdded = $v.cardsAdded;
      _cardsChanged = $v.cardsChanged;
      _cardsRemoved = $v.cardsRemoved;
      _hasUpdates = $v.hasUpdates;
      _saveId = $v.saveId;
      _summary = $v.summary.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryDiff other) {
    _$v = other as _$LibraryDiff;
  }

  @override
  void update(void Function(LibraryDiffBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LibraryDiff build() => _build();

  _$LibraryDiff _build() {
    _$LibraryDiff _$result;
    try {
      _$result = _$v ??
          _$LibraryDiff._(
            acceptedAt: BuiltValueNullFieldError.checkNotNull(
                acceptedAt, r'LibraryDiff', 'acceptedAt'),
            articlesAdded: articlesAdded,
            articlesChanged: articlesChanged,
            articlesRemoved: articlesRemoved,
            cardsAdded: cardsAdded,
            cardsChanged: cardsChanged,
            cardsRemoved: cardsRemoved,
            hasUpdates: BuiltValueNullFieldError.checkNotNull(
                hasUpdates, r'LibraryDiff', 'hasUpdates'),
            saveId: BuiltValueNullFieldError.checkNotNull(
                saveId, r'LibraryDiff', 'saveId'),
            summary: summary.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'LibraryDiff', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
