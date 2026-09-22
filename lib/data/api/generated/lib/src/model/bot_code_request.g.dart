// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_code_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BotCodeRequest extends BotCodeRequest {
  @override
  final BotPlatform platform;

  factory _$BotCodeRequest([void Function(BotCodeRequestBuilder)? updates]) =>
      (BotCodeRequestBuilder()..update(updates))._build();

  _$BotCodeRequest._({required this.platform}) : super._();
  @override
  BotCodeRequest rebuild(void Function(BotCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BotCodeRequestBuilder toBuilder() => BotCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BotCodeRequest && platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BotCodeRequest')
          ..add('platform', platform))
        .toString();
  }
}

class BotCodeRequestBuilder
    implements Builder<BotCodeRequest, BotCodeRequestBuilder> {
  _$BotCodeRequest? _$v;

  BotPlatform? _platform;
  BotPlatform? get platform => _$this._platform;
  set platform(BotPlatform? platform) => _$this._platform = platform;

  BotCodeRequestBuilder() {
    BotCodeRequest._defaults(this);
  }

  BotCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BotCodeRequest other) {
    _$v = other as _$BotCodeRequest;
  }

  @override
  void update(void Function(BotCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BotCodeRequest build() => _build();

  _$BotCodeRequest _build() {
    final _$result = _$v ??
        _$BotCodeRequest._(
          platform: BuiltValueNullFieldError.checkNotNull(
              platform, r'BotCodeRequest', 'platform'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
