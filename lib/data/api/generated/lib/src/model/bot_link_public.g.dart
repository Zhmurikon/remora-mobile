// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_link_public.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BotLinkPublic extends BotLinkPublic {
  @override
  final String actorId;
  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final BotPlatform platform;

  factory _$BotLinkPublic([void Function(BotLinkPublicBuilder)? updates]) =>
      (BotLinkPublicBuilder()..update(updates))._build();

  _$BotLinkPublic._(
      {required this.actorId,
      required this.createdAt,
      required this.id,
      required this.platform})
      : super._();
  @override
  BotLinkPublic rebuild(void Function(BotLinkPublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BotLinkPublicBuilder toBuilder() => BotLinkPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BotLinkPublic &&
        actorId == other.actorId &&
        createdAt == other.createdAt &&
        id == other.id &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actorId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BotLinkPublic')
          ..add('actorId', actorId)
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('platform', platform))
        .toString();
  }
}

class BotLinkPublicBuilder
    implements Builder<BotLinkPublic, BotLinkPublicBuilder> {
  _$BotLinkPublic? _$v;

  String? _actorId;
  String? get actorId => _$this._actorId;
  set actorId(String? actorId) => _$this._actorId = actorId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  BotPlatform? _platform;
  BotPlatform? get platform => _$this._platform;
  set platform(BotPlatform? platform) => _$this._platform = platform;

  BotLinkPublicBuilder() {
    BotLinkPublic._defaults(this);
  }

  BotLinkPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actorId = $v.actorId;
      _createdAt = $v.createdAt;
      _id = $v.id;
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BotLinkPublic other) {
    _$v = other as _$BotLinkPublic;
  }

  @override
  void update(void Function(BotLinkPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BotLinkPublic build() => _build();

  _$BotLinkPublic _build() {
    final _$result = _$v ??
        _$BotLinkPublic._(
          actorId: BuiltValueNullFieldError.checkNotNull(
              actorId, r'BotLinkPublic', 'actorId'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'BotLinkPublic', 'createdAt'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'BotLinkPublic', 'id'),
          platform: BuiltValueNullFieldError.checkNotNull(
              platform, r'BotLinkPublic', 'platform'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
