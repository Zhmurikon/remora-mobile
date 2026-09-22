// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_code_created.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BotCodeCreated extends BotCodeCreated {
  @override
  final String? botUrl;
  @override
  final String code;
  @override
  final DateTime expiresAt;

  factory _$BotCodeCreated([void Function(BotCodeCreatedBuilder)? updates]) =>
      (BotCodeCreatedBuilder()..update(updates))._build();

  _$BotCodeCreated._({this.botUrl, required this.code, required this.expiresAt})
      : super._();
  @override
  BotCodeCreated rebuild(void Function(BotCodeCreatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BotCodeCreatedBuilder toBuilder() => BotCodeCreatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BotCodeCreated &&
        botUrl == other.botUrl &&
        code == other.code &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, botUrl.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BotCodeCreated')
          ..add('botUrl', botUrl)
          ..add('code', code)
          ..add('expiresAt', expiresAt))
        .toString();
  }
}

class BotCodeCreatedBuilder
    implements Builder<BotCodeCreated, BotCodeCreatedBuilder> {
  _$BotCodeCreated? _$v;

  String? _botUrl;
  String? get botUrl => _$this._botUrl;
  set botUrl(String? botUrl) => _$this._botUrl = botUrl;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  BotCodeCreatedBuilder() {
    BotCodeCreated._defaults(this);
  }

  BotCodeCreatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _botUrl = $v.botUrl;
      _code = $v.code;
      _expiresAt = $v.expiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BotCodeCreated other) {
    _$v = other as _$BotCodeCreated;
  }

  @override
  void update(void Function(BotCodeCreatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BotCodeCreated build() => _build();

  _$BotCodeCreated _build() {
    final _$result = _$v ??
        _$BotCodeCreated._(
          botUrl: botUrl,
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'BotCodeCreated', 'code'),
          expiresAt: BuiltValueNullFieldError.checkNotNull(
              expiresAt, r'BotCodeCreated', 'expiresAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
