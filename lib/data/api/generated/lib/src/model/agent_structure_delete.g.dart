// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_structure_delete.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AgentStructureDeleteConfirmEnum _$agentStructureDeleteConfirmEnum_true_ =
    const AgentStructureDeleteConfirmEnum._('true_');

AgentStructureDeleteConfirmEnum _$agentStructureDeleteConfirmEnumValueOf(
    String name) {
  switch (name) {
    case 'true_':
      return _$agentStructureDeleteConfirmEnum_true_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AgentStructureDeleteConfirmEnum>
    _$agentStructureDeleteConfirmEnumValues = BuiltSet<
        AgentStructureDeleteConfirmEnum>(const <AgentStructureDeleteConfirmEnum>[
  _$agentStructureDeleteConfirmEnum_true_,
]);

Serializer<AgentStructureDeleteConfirmEnum>
    _$agentStructureDeleteConfirmEnumSerializer =
    _$AgentStructureDeleteConfirmEnumSerializer();

class _$AgentStructureDeleteConfirmEnumSerializer
    implements PrimitiveSerializer<AgentStructureDeleteConfirmEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'true_': 'true',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'true': 'true_',
  };

  @override
  final Iterable<Type> types = const <Type>[AgentStructureDeleteConfirmEnum];
  @override
  final String wireName = 'AgentStructureDeleteConfirmEnum';

  @override
  Object serialize(
          Serializers serializers, AgentStructureDeleteConfirmEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AgentStructureDeleteConfirmEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AgentStructureDeleteConfirmEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AgentStructureDelete extends AgentStructureDelete {
  @override
  final AgentStructureDeleteConfirmEnum confirm;
  @override
  final String revision;

  factory _$AgentStructureDelete(
          [void Function(AgentStructureDeleteBuilder)? updates]) =>
      (AgentStructureDeleteBuilder()..update(updates))._build();

  _$AgentStructureDelete._({required this.confirm, required this.revision})
      : super._();
  @override
  AgentStructureDelete rebuild(
          void Function(AgentStructureDeleteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentStructureDeleteBuilder toBuilder() =>
      AgentStructureDeleteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgentStructureDelete &&
        confirm == other.confirm &&
        revision == other.revision;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, confirm.hashCode);
    _$hash = $jc(_$hash, revision.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgentStructureDelete')
          ..add('confirm', confirm)
          ..add('revision', revision))
        .toString();
  }
}

class AgentStructureDeleteBuilder
    implements Builder<AgentStructureDelete, AgentStructureDeleteBuilder> {
  _$AgentStructureDelete? _$v;

  AgentStructureDeleteConfirmEnum? _confirm;
  AgentStructureDeleteConfirmEnum? get confirm => _$this._confirm;
  set confirm(AgentStructureDeleteConfirmEnum? confirm) =>
      _$this._confirm = confirm;

  String? _revision;
  String? get revision => _$this._revision;
  set revision(String? revision) => _$this._revision = revision;

  AgentStructureDeleteBuilder() {
    AgentStructureDelete._defaults(this);
  }

  AgentStructureDeleteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _confirm = $v.confirm;
      _revision = $v.revision;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgentStructureDelete other) {
    _$v = other as _$AgentStructureDelete;
  }

  @override
  void update(void Function(AgentStructureDeleteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgentStructureDelete build() => _build();

  _$AgentStructureDelete _build() {
    final _$result = _$v ??
        _$AgentStructureDelete._(
          confirm: BuiltValueNullFieldError.checkNotNull(
              confirm, r'AgentStructureDelete', 'confirm'),
          revision: BuiltValueNullFieldError.checkNotNull(
              revision, r'AgentStructureDelete', 'revision'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
