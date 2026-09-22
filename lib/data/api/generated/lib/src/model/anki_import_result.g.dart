// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anki_import_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnkiImportResult extends AnkiImportResult {
  @override
  final BuiltList<ImportErrorItem>? errors;
  @override
  final int importedCards;
  @override
  final int importedImages;
  @override
  final int skippedMedia;
  @override
  final int skippedNotes;
  @override
  final BuiltList<String> warnings;

  factory _$AnkiImportResult(
          [void Function(AnkiImportResultBuilder)? updates]) =>
      (AnkiImportResultBuilder()..update(updates))._build();

  _$AnkiImportResult._(
      {this.errors,
      required this.importedCards,
      required this.importedImages,
      required this.skippedMedia,
      required this.skippedNotes,
      required this.warnings})
      : super._();
  @override
  AnkiImportResult rebuild(void Function(AnkiImportResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnkiImportResultBuilder toBuilder() =>
      AnkiImportResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnkiImportResult &&
        errors == other.errors &&
        importedCards == other.importedCards &&
        importedImages == other.importedImages &&
        skippedMedia == other.skippedMedia &&
        skippedNotes == other.skippedNotes &&
        warnings == other.warnings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, importedCards.hashCode);
    _$hash = $jc(_$hash, importedImages.hashCode);
    _$hash = $jc(_$hash, skippedMedia.hashCode);
    _$hash = $jc(_$hash, skippedNotes.hashCode);
    _$hash = $jc(_$hash, warnings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnkiImportResult')
          ..add('errors', errors)
          ..add('importedCards', importedCards)
          ..add('importedImages', importedImages)
          ..add('skippedMedia', skippedMedia)
          ..add('skippedNotes', skippedNotes)
          ..add('warnings', warnings))
        .toString();
  }
}

class AnkiImportResultBuilder
    implements Builder<AnkiImportResult, AnkiImportResultBuilder> {
  _$AnkiImportResult? _$v;

  ListBuilder<ImportErrorItem>? _errors;
  ListBuilder<ImportErrorItem> get errors =>
      _$this._errors ??= ListBuilder<ImportErrorItem>();
  set errors(ListBuilder<ImportErrorItem>? errors) => _$this._errors = errors;

  int? _importedCards;
  int? get importedCards => _$this._importedCards;
  set importedCards(int? importedCards) =>
      _$this._importedCards = importedCards;

  int? _importedImages;
  int? get importedImages => _$this._importedImages;
  set importedImages(int? importedImages) =>
      _$this._importedImages = importedImages;

  int? _skippedMedia;
  int? get skippedMedia => _$this._skippedMedia;
  set skippedMedia(int? skippedMedia) => _$this._skippedMedia = skippedMedia;

  int? _skippedNotes;
  int? get skippedNotes => _$this._skippedNotes;
  set skippedNotes(int? skippedNotes) => _$this._skippedNotes = skippedNotes;

  ListBuilder<String>? _warnings;
  ListBuilder<String> get warnings =>
      _$this._warnings ??= ListBuilder<String>();
  set warnings(ListBuilder<String>? warnings) => _$this._warnings = warnings;

  AnkiImportResultBuilder() {
    AnkiImportResult._defaults(this);
  }

  AnkiImportResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors?.toBuilder();
      _importedCards = $v.importedCards;
      _importedImages = $v.importedImages;
      _skippedMedia = $v.skippedMedia;
      _skippedNotes = $v.skippedNotes;
      _warnings = $v.warnings.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnkiImportResult other) {
    _$v = other as _$AnkiImportResult;
  }

  @override
  void update(void Function(AnkiImportResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnkiImportResult build() => _build();

  _$AnkiImportResult _build() {
    _$AnkiImportResult _$result;
    try {
      _$result = _$v ??
          _$AnkiImportResult._(
            errors: _errors?.build(),
            importedCards: BuiltValueNullFieldError.checkNotNull(
                importedCards, r'AnkiImportResult', 'importedCards'),
            importedImages: BuiltValueNullFieldError.checkNotNull(
                importedImages, r'AnkiImportResult', 'importedImages'),
            skippedMedia: BuiltValueNullFieldError.checkNotNull(
                skippedMedia, r'AnkiImportResult', 'skippedMedia'),
            skippedNotes: BuiltValueNullFieldError.checkNotNull(
                skippedNotes, r'AnkiImportResult', 'skippedNotes'),
            warnings: warnings.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();

        _$failedField = 'warnings';
        warnings.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnkiImportResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
