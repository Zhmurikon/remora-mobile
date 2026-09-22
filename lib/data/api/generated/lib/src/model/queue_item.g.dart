// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QueueItem extends QueueItem {
  @override
  final QueueCard card;
  @override
  final StudyDirection direction;
  @override
  final BuiltList<RatingPreviewOut> previews;
  @override
  final CardStateOut state;

  factory _$QueueItem([void Function(QueueItemBuilder)? updates]) =>
      (QueueItemBuilder()..update(updates))._build();

  _$QueueItem._(
      {required this.card,
      required this.direction,
      required this.previews,
      required this.state})
      : super._();
  @override
  QueueItem rebuild(void Function(QueueItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueueItemBuilder toBuilder() => QueueItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QueueItem &&
        card == other.card &&
        direction == other.direction &&
        previews == other.previews &&
        state == other.state;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, card.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, previews.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QueueItem')
          ..add('card', card)
          ..add('direction', direction)
          ..add('previews', previews)
          ..add('state', state))
        .toString();
  }
}

class QueueItemBuilder implements Builder<QueueItem, QueueItemBuilder> {
  _$QueueItem? _$v;

  QueueCardBuilder? _card;
  QueueCardBuilder get card => _$this._card ??= QueueCardBuilder();
  set card(QueueCardBuilder? card) => _$this._card = card;

  StudyDirection? _direction;
  StudyDirection? get direction => _$this._direction;
  set direction(StudyDirection? direction) => _$this._direction = direction;

  ListBuilder<RatingPreviewOut>? _previews;
  ListBuilder<RatingPreviewOut> get previews =>
      _$this._previews ??= ListBuilder<RatingPreviewOut>();
  set previews(ListBuilder<RatingPreviewOut>? previews) =>
      _$this._previews = previews;

  CardStateOutBuilder? _state;
  CardStateOutBuilder get state => _$this._state ??= CardStateOutBuilder();
  set state(CardStateOutBuilder? state) => _$this._state = state;

  QueueItemBuilder() {
    QueueItem._defaults(this);
  }

  QueueItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _card = $v.card.toBuilder();
      _direction = $v.direction;
      _previews = $v.previews.toBuilder();
      _state = $v.state.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QueueItem other) {
    _$v = other as _$QueueItem;
  }

  @override
  void update(void Function(QueueItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QueueItem build() => _build();

  _$QueueItem _build() {
    _$QueueItem _$result;
    try {
      _$result = _$v ??
          _$QueueItem._(
            card: card.build(),
            direction: BuiltValueNullFieldError.checkNotNull(
                direction, r'QueueItem', 'direction'),
            previews: previews.build(),
            state: state.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'card';
        card.build();

        _$failedField = 'previews';
        previews.build();
        _$failedField = 'state';
        state.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'QueueItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
