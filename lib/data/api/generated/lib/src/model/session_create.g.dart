// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SessionCreate extends SessionCreate {
  @override
  final BuiltMap<String, JsonObject?>? config;
  @override
  final StudyMode mode;
  @override
  final String setId;

  factory _$SessionCreate([void Function(SessionCreateBuilder)? updates]) =>
      (SessionCreateBuilder()..update(updates))._build();

  _$SessionCreate._({this.config, required this.mode, required this.setId})
      : super._();
  @override
  SessionCreate rebuild(void Function(SessionCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionCreateBuilder toBuilder() => SessionCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionCreate &&
        config == other.config &&
        mode == other.mode &&
        setId == other.setId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, setId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SessionCreate')
          ..add('config', config)
          ..add('mode', mode)
          ..add('setId', setId))
        .toString();
  }
}

class SessionCreateBuilder
    implements Builder<SessionCreate, SessionCreateBuilder> {
  _$SessionCreate? _$v;

  MapBuilder<String, JsonObject?>? _config;
  MapBuilder<String, JsonObject?> get config =>
      _$this._config ??= MapBuilder<String, JsonObject?>();
  set config(MapBuilder<String, JsonObject?>? config) =>
      _$this._config = config;

  StudyMode? _mode;
  StudyMode? get mode => _$this._mode;
  set mode(StudyMode? mode) => _$this._mode = mode;

  String? _setId;
  String? get setId => _$this._setId;
  set setId(String? setId) => _$this._setId = setId;

  SessionCreateBuilder() {
    SessionCreate._defaults(this);
  }

  SessionCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _config = $v.config?.toBuilder();
      _mode = $v.mode;
      _setId = $v.setId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionCreate other) {
    _$v = other as _$SessionCreate;
  }

  @override
  void update(void Function(SessionCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionCreate build() => _build();

  _$SessionCreate _build() {
    _$SessionCreate _$result;
    try {
      _$result = _$v ??
          _$SessionCreate._(
            config: _config?.build(),
            mode: BuiltValueNullFieldError.checkNotNull(
                mode, r'SessionCreate', 'mode'),
            setId: BuiltValueNullFieldError.checkNotNull(
                setId, r'SessionCreate', 'setId'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'config';
        _config?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SessionCreate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
