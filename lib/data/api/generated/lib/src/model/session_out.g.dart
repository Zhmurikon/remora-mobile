// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_out.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SessionOut extends SessionOut {
  @override
  final int cardsCorrect;
  @override
  final int cardsSeen;
  @override
  final BuiltMap<String, JsonObject?> config;
  @override
  final DateTime? endedAt;
  @override
  final String id;
  @override
  final StudyMode mode;
  @override
  final String setId;
  @override
  final DateTime startedAt;
  @override
  final SessionStatus status;

  factory _$SessionOut([void Function(SessionOutBuilder)? updates]) =>
      (SessionOutBuilder()..update(updates))._build();

  _$SessionOut._(
      {required this.cardsCorrect,
      required this.cardsSeen,
      required this.config,
      this.endedAt,
      required this.id,
      required this.mode,
      required this.setId,
      required this.startedAt,
      required this.status})
      : super._();
  @override
  SessionOut rebuild(void Function(SessionOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionOutBuilder toBuilder() => SessionOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionOut &&
        cardsCorrect == other.cardsCorrect &&
        cardsSeen == other.cardsSeen &&
        config == other.config &&
        endedAt == other.endedAt &&
        id == other.id &&
        mode == other.mode &&
        setId == other.setId &&
        startedAt == other.startedAt &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardsCorrect.hashCode);
    _$hash = $jc(_$hash, cardsSeen.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, endedAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SessionOut')
          ..add('cardsCorrect', cardsCorrect)
          ..add('cardsSeen', cardsSeen)
          ..add('config', config)
          ..add('endedAt', endedAt)
          ..add('id', id)
          ..add('mode', mode)
          ..add('setId', setId)
          ..add('startedAt', startedAt)
          ..add('status', status))
        .toString();
  }
}

class SessionOutBuilder implements Builder<SessionOut, SessionOutBuilder> {
  _$SessionOut? _$v;

  int? _cardsCorrect;
  int? get cardsCorrect => _$this._cardsCorrect;
  set cardsCorrect(int? cardsCorrect) => _$this._cardsCorrect = cardsCorrect;

  int? _cardsSeen;
  int? get cardsSeen => _$this._cardsSeen;
  set cardsSeen(int? cardsSeen) => _$this._cardsSeen = cardsSeen;

  MapBuilder<String, JsonObject?>? _config;
  MapBuilder<String, JsonObject?> get config =>
      _$this._config ??= MapBuilder<String, JsonObject?>();
  set config(MapBuilder<String, JsonObject?>? config) =>
      _$this._config = config;

  DateTime? _endedAt;
  DateTime? get endedAt => _$this._endedAt;
  set endedAt(DateTime? endedAt) => _$this._endedAt = endedAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  StudyMode? _mode;
  StudyMode? get mode => _$this._mode;
  set mode(StudyMode? mode) => _$this._mode = mode;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  DateTime? _startedAt;
  DateTime? get startedAt => _$this._startedAt;
  set startedAt(DateTime? startedAt) => _$this._startedAt = startedAt;

  SessionStatus? _status;
  SessionStatus? get status => _$this._status;
  set status(SessionStatus? status) => _$this._status = status;

  SessionOutBuilder() {
    SessionOut._defaults(this);
  }

  SessionOutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardsCorrect = $v.cardsCorrect;
      _cardsSeen = $v.cardsSeen;
      _config = $v.config.toBuilder();
      _endedAt = $v.endedAt;
      _id = $v.id;
      _mode = $v.mode;
      _setId = $v.setId;
      _startedAt = $v.startedAt;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionOut other) {
    _$v = other as _$SessionOut;
  }

  @override
  void update(void Function(SessionOutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionOut build() => _build();

  _$SessionOut _build() {
    _$SessionOut _$result;
    try {
      _$result = _$v ??
          _$SessionOut._(
            cardsCorrect: BuiltValueNullFieldError.checkNotNull(
                cardsCorrect, r'SessionOut', 'cardsCorrect'),
            cardsSeen: BuiltValueNullFieldError.checkNotNull(
                cardsSeen, r'SessionOut', 'cardsSeen'),
            config: config.build(),
            endedAt: endedAt,
            id: BuiltValueNullFieldError.checkNotNull(id, r'SessionOut', 'id'),
            mode: BuiltValueNullFieldError.checkNotNull(
                mode, r'SessionOut', 'mode'),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'SessionOut', 'setId'),
            startedAt: BuiltValueNullFieldError.checkNotNull(
                startedAt, r'SessionOut', 'startedAt'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'SessionOut', 'status'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'config';
        config.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SessionOut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
