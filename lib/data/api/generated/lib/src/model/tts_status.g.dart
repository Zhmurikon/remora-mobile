// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tts_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TtsStatus extends TtsStatus {
  @override
  final bool available;
  @override
  final int charsUsedThisMonth;
  @override
  final BuiltMap<String, String> voices;

  factory _$TtsStatus([void Function(TtsStatusBuilder)? updates]) =>
      (TtsStatusBuilder()..update(updates))._build();

  _$TtsStatus._(
      {required this.available,
      required this.charsUsedThisMonth,
      required this.voices})
      : super._();
  @override
  TtsStatus rebuild(void Function(TtsStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TtsStatusBuilder toBuilder() => TtsStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TtsStatus &&
        available == other.available &&
        charsUsedThisMonth == other.charsUsedThisMonth &&
        voices == other.voices;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, available.hashCode);
    _$hash = $jc(_$hash, charsUsedThisMonth.hashCode);
    _$hash = $jc(_$hash, voices.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TtsStatus')
          ..add('available', available)
          ..add('charsUsedThisMonth', charsUsedThisMonth)
          ..add('voices', voices))
        .toString();
  }
}

class TtsStatusBuilder implements Builder<TtsStatus, TtsStatusBuilder> {
  _$TtsStatus? _$v;

  bool? _available;
  bool? get available => _$this._available;
  set available(bool? available) => _$this._available = available;

  int? _charsUsedThisMonth;
  int? get charsUsedThisMonth => _$this._charsUsedThisMonth;
  set charsUsedThisMonth(int? charsUsedThisMonth) =>
      _$this._charsUsedThisMonth = charsUsedThisMonth;

  MapBuilder<String, String>? _voices;
  MapBuilder<String, String> get voices =>
      _$this._voices ??= MapBuilder<String, String>();
  set voices(MapBuilder<String, String>? voices) => _$this._voices = voices;

  TtsStatusBuilder() {
    TtsStatus._defaults(this);
  }

  TtsStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _available = $v.available;
      _charsUsedThisMonth = $v.charsUsedThisMonth;
      _voices = $v.voices.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TtsStatus other) {
    _$v = other as _$TtsStatus;
  }

  @override
  void update(void Function(TtsStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TtsStatus build() => _build();

  _$TtsStatus _build() {
    _$TtsStatus _$result;
    try {
      _$result = _$v ??
          _$TtsStatus._(
            available: BuiltValueNullFieldError.checkNotNull(
                available, r'TtsStatus', 'available'),
            charsUsedThisMonth: BuiltValueNullFieldError.checkNotNull(
                charsUsedThisMonth, r'TtsStatus', 'charsUsedThisMonth'),
            voices: voices.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'voices';
        voices.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TtsStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
