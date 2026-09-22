// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForecastDay extends ForecastDay {
  @override
  final int count;
  @override
  final String date;

  factory _$ForecastDay([void Function(ForecastDayBuilder)? updates]) =>
      (ForecastDayBuilder()..update(updates))._build();

  _$ForecastDay._({required this.count, required this.date}) : super._();
  @override
  ForecastDay rebuild(void Function(ForecastDayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastDayBuilder toBuilder() => ForecastDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastDay && count == other.count && date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastDay')
          ..add('count', count)
          ..add('date', date))
        .toString();
  }
}

class ForecastDayBuilder implements Builder<ForecastDay, ForecastDayBuilder> {
  _$ForecastDay? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ForecastDayBuilder() {
    ForecastDay._defaults(this);
  }

  ForecastDayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastDay other) {
    _$v = other as _$ForecastDay;
  }

  @override
  void update(void Function(ForecastDayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastDay build() => _build();

  _$ForecastDay _build() {
    final _$result = _$v ??
        _$ForecastDay._(
          count: BuiltValueNullFieldError.checkNotNull(
              count, r'ForecastDay', 'count'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'ForecastDay', 'date'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
