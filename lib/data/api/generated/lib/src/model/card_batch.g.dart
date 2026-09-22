// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_batch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardBatch extends CardBatch {
  @override
  final BuiltList<CardWrite> cards;

  factory _$CardBatch([void Function(CardBatchBuilder)? updates]) =>
      (CardBatchBuilder()..update(updates))._build();

  _$CardBatch._({required this.cards}) : super._();
  @override
  CardBatch rebuild(void Function(CardBatchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardBatchBuilder toBuilder() => CardBatchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardBatch && cards == other.cards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardBatch')..add('cards', cards))
        .toString();
  }
}

class CardBatchBuilder implements Builder<CardBatch, CardBatchBuilder> {
  _$CardBatch? _$v;

  ListBuilder<CardWrite>? _cards;
  ListBuilder<CardWrite> get cards =>
      _$this._cards ??= ListBuilder<CardWrite>();
  set cards(ListBuilder<CardWrite>? cards) => _$this._cards = cards;

  CardBatchBuilder() {
    CardBatch._defaults(this);
  }

  CardBatchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardBatch other) {
    _$v = other as _$CardBatch;
  }

  @override
  void update(void Function(CardBatchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardBatch build() => _build();

  _$CardBatch _build() {
    _$CardBatch _$result;
    try {
      _$result = _$v ??
          _$CardBatch._(
            cards: cards.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        cards.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CardBatch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
