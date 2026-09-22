// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speak_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SpeakRequest extends SpeakRequest {
  @override
  final String cardId;
  @override
  final StudyDirection? direction;
  @override
  final String? side;
  @override
  final num? speed;
  @override
  final String? voice;

  factory _$SpeakRequest([void Function(SpeakRequestBuilder)? updates]) =>
      (SpeakRequestBuilder()..update(updates))._build();

  _$SpeakRequest._(
      {required this.cardId, this.direction, this.side, this.speed, this.voice})
      : super._();
  @override
  SpeakRequest rebuild(void Function(SpeakRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpeakRequestBuilder toBuilder() => SpeakRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpeakRequest &&
        cardId == other.cardId &&
        direction == other.direction &&
        side == other.side &&
        speed == other.speed &&
        voice == other.voice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardId.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, side.hashCode);
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, voice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpeakRequest')
          ..add('cardId', cardId)
          ..add('direction', direction)
          ..add('side', side)
          ..add('speed', speed)
          ..add('voice', voice))
        .toString();
  }
}

class SpeakRequestBuilder
    implements Builder<SpeakRequest, SpeakRequestBuilder> {
  _$SpeakRequest? _$v;

  String? _cardId;
  String? get cardId => _$this._cardId;
  set cardId(String? cardId) => _$this._cardId = cardId;

  StudyDirection? _direction;
  StudyDirection? get direction => _$this._direction;
  set direction(StudyDirection? direction) => _$this._direction = direction;

  String? _side;
  String? get side => _$this._side;
  set side(String? side) => _$this._side = side;

  num? _speed;
  num? get speed => _$this._speed;
  set speed(num? speed) => _$this._speed = speed;

  String? _voice;
  String? get voice => _$this._voice;
  set voice(String? voice) => _$this._voice = voice;

  SpeakRequestBuilder() {
    SpeakRequest._defaults(this);
  }

  SpeakRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardId = $v.cardId;
      _direction = $v.direction;
      _side = $v.side;
      _speed = $v.speed;
      _voice = $v.voice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpeakRequest other) {
    _$v = other as _$SpeakRequest;
  }

  @override
  void update(void Function(SpeakRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpeakRequest build() => _build();

  _$SpeakRequest _build() {
    final _$result = _$v ??
        _$SpeakRequest._(
          cardId: BuiltValueNullFieldError.checkNotNull(
              cardId, r'SpeakRequest', 'cardId'),
          direction: direction,
          side: side,
          speed: speed,
          voice: voice,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
