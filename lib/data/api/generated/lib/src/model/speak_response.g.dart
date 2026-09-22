// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speak_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SpeakResponse extends SpeakResponse {
  @override
  final String audioUrl;
  @override
  final bool cached;
  @override
  final String lang;
  @override
  final String voice;

  factory _$SpeakResponse([void Function(SpeakResponseBuilder)? updates]) =>
      (SpeakResponseBuilder()..update(updates))._build();

  _$SpeakResponse._(
      {required this.audioUrl,
      required this.cached,
      required this.lang,
      required this.voice})
      : super._();
  @override
  SpeakResponse rebuild(void Function(SpeakResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpeakResponseBuilder toBuilder() => SpeakResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpeakResponse &&
        audioUrl == other.audioUrl &&
        cached == other.cached &&
        lang == other.lang &&
        voice == other.voice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, audioUrl.hashCode);
    _$hash = $jc(_$hash, cached.hashCode);
    _$hash = $jc(_$hash, lang.hashCode);
    _$hash = $jc(_$hash, voice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpeakResponse')
          ..add('audioUrl', audioUrl)
          ..add('cached', cached)
          ..add('lang', lang)
          ..add('voice', voice))
        .toString();
  }
}

class SpeakResponseBuilder
    implements Builder<SpeakResponse, SpeakResponseBuilder> {
  _$SpeakResponse? _$v;

  String? _audioUrl;
  String? get audioUrl => _$this._audioUrl;
  set audioUrl(String? audioUrl) => _$this._audioUrl = audioUrl;

  bool? _cached;
  bool? get cached => _$this._cached;
  set cached(bool? cached) => _$this._cached = cached;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  String? _voice;
  String? get voice => _$this._voice;
  set voice(String? voice) => _$this._voice = voice;

  SpeakResponseBuilder() {
    SpeakResponse._defaults(this);
  }

  SpeakResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _audioUrl = $v.audioUrl;
      _cached = $v.cached;
      _lang = $v.lang;
      _voice = $v.voice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpeakResponse other) {
    _$v = other as _$SpeakResponse;
  }

  @override
  void update(void Function(SpeakResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpeakResponse build() => _build();

  _$SpeakResponse _build() {
    final _$result = _$v ??
        _$SpeakResponse._(
          audioUrl: BuiltValueNullFieldError.checkNotNull(
              audioUrl, r'SpeakResponse', 'audioUrl'),
          cached: BuiltValueNullFieldError.checkNotNull(
              cached, r'SpeakResponse', 'cached'),
          lang: BuiltValueNullFieldError.checkNotNull(
              lang, r'SpeakResponse', 'lang'),
          voice: BuiltValueNullFieldError.checkNotNull(
              voice, r'SpeakResponse', 'voice'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
