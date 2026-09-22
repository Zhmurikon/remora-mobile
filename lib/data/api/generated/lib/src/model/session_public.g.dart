// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SessionPublic extends SessionPublic {
  @override
  final bool current;
  @override
  final DateTime expiresAt;
  @override
  final String id;
  @override
  final String? ip;
  @override
  final String? userAgent;

  factory _$SessionPublic([void Function(SessionPublicBuilder)? updates]) =>
      (SessionPublicBuilder()..update(updates))._build();

  _$SessionPublic._(
      {required this.current,
      required this.expiresAt,
      required this.id,
      this.ip,
      this.userAgent})
      : super._();
  @override
  SessionPublic rebuild(void Function(SessionPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionPublicBuilder toBuilder() => SessionPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionPublic &&
        current == other.current &&
        expiresAt == other.expiresAt &&
        id == other.id &&
        ip == other.ip &&
        userAgent == other.userAgent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, current.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ip.hashCode);
    _$hash = $jc(_$hash, userAgent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SessionPublic')
          ..add('current', current)
          ..add('expiresAt', expiresAt)
          ..add('id', id)
          ..add('ip', ip)
          ..add('userAgent', userAgent))
        .toString();
  }
}

class SessionPublicBuilder
    implements Builder<SessionPublic, SessionPublicBuilder> {
  _$SessionPublic? _$v;

  bool? _current;
  bool? get current => _$this._current;
  set current(bool? current) => _$this._current = current;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _ip;
  String? get ip => _$this._ip;
  set ip(String? ip) => _$this._ip = ip;

  String? _userAgent;
  String? get userAgent => _$this._userAgent;
  set userAgent(String? userAgent) => _$this._userAgent = userAgent;

  SessionPublicBuilder() {
    SessionPublic._defaults(this);
  }

  SessionPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _current = $v.current;
      _expiresAt = $v.expiresAt;
      _id = $v.id;
      _ip = $v.ip;
      _userAgent = $v.userAgent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionPublic other) {
    _$v = other as _$SessionPublic;
  }

  @override
  void update(void Function(SessionPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionPublic build() => _build();

  _$SessionPublic _build() {
    final _$result = _$v ??
        _$SessionPublic._(
          current: BuiltValueNullFieldError.checkNotNull(
              current, r'SessionPublic', 'current'),
          expiresAt: BuiltValueNullFieldError.checkNotNull(
              expiresAt, r'SessionPublic', 'expiresAt'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'SessionPublic', 'id'),
          ip: ip,
          userAgent: userAgent,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
