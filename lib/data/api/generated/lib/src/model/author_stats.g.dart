// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_stats.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthorStats extends AuthorStats {
  @override
  final int cardsStudied;
  @override
  final int currentStreakDays;
  @override
  final int likesReceived;
  @override
  final int publications;
  @override
  final int savesReceived;

  factory _$AuthorStats([void Function(AuthorStatsBuilder)? updates]) =>
      (AuthorStatsBuilder()..update(updates))._build();

  _$AuthorStats._(
      {required this.cardsStudied,
      required this.currentStreakDays,
      required this.likesReceived,
      required this.publications,
      required this.savesReceived})
      : super._();
  @override
  AuthorStats rebuild(void Function(AuthorStatsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorStatsBuilder toBuilder() => AuthorStatsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorStats &&
        cardsStudied == other.cardsStudied &&
        currentStreakDays == other.currentStreakDays &&
        likesReceived == other.likesReceived &&
        publications == other.publications &&
        savesReceived == other.savesReceived;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cardsStudied.hashCode);
    _$hash = $jc(_$hash, currentStreakDays.hashCode);
    _$hash = $jc(_$hash, likesReceived.hashCode);
    _$hash = $jc(_$hash, publications.hashCode);
    _$hash = $jc(_$hash, savesReceived.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthorStats')
          ..add('cardsStudied', cardsStudied)
          ..add('currentStreakDays', currentStreakDays)
          ..add('likesReceived', likesReceived)
          ..add('publications', publications)
          ..add('savesReceived', savesReceived))
        .toString();
  }
}

class AuthorStatsBuilder implements Builder<AuthorStats, AuthorStatsBuilder> {
  _$AuthorStats? _$v;

  int? _cardsStudied;
  int? get cardsStudied => _$this._cardsStudied;
  set cardsStudied(int? cardsStudied) => _$this._cardsStudied = cardsStudied;

  int? _currentStreakDays;
  int? get currentStreakDays => _$this._currentStreakDays;
  set currentStreakDays(int? currentStreakDays) =>
      _$this._currentStreakDays = currentStreakDays;

  int? _likesReceived;
  int? get likesReceived => _$this._likesReceived;
  set likesReceived(int? likesReceived) =>
      _$this._likesReceived = likesReceived;

  int? _publications;
  int? get publications => _$this._publications;
  set publications(int? publications) => _$this._publications = publications;

  int? _savesReceived;
  int? get savesReceived => _$this._savesReceived;
  set savesReceived(int? savesReceived) =>
      _$this._savesReceived = savesReceived;

  AuthorStatsBuilder() {
    AuthorStats._defaults(this);
  }

  AuthorStatsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cardsStudied = $v.cardsStudied;
      _currentStreakDays = $v.currentStreakDays;
      _likesReceived = $v.likesReceived;
      _publications = $v.publications;
      _savesReceived = $v.savesReceived;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorStats other) {
    _$v = other as _$AuthorStats;
  }

  @override
  void update(void Function(AuthorStatsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthorStats build() => _build();

  _$AuthorStats _build() {
    final _$result = _$v ??
        _$AuthorStats._(
          cardsStudied: BuiltValueNullFieldError.checkNotNull(
              cardsStudied, r'AuthorStats', 'cardsStudied'),
          currentStreakDays: BuiltValueNullFieldError.checkNotNull(
              currentStreakDays, r'AuthorStats', 'currentStreakDays'),
          likesReceived: BuiltValueNullFieldError.checkNotNull(
              likesReceived, r'AuthorStats', 'likesReceived'),
          publications: BuiltValueNullFieldError.checkNotNull(
              publications, r'AuthorStats', 'publications'),
          savesReceived: BuiltValueNullFieldError.checkNotNull(
              savesReceived, r'AuthorStats', 'savesReceived'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
