// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_save_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LibrarySaveCreateTargetTypeEnum _$librarySaveCreateTargetTypeEnum_course =
    const LibrarySaveCreateTargetTypeEnum._('course');
const LibrarySaveCreateTargetTypeEnum
    _$librarySaveCreateTargetTypeEnum_article =
    const LibrarySaveCreateTargetTypeEnum._('article');
const LibrarySaveCreateTargetTypeEnum _$librarySaveCreateTargetTypeEnum_set_ =
    const LibrarySaveCreateTargetTypeEnum._('set_');

LibrarySaveCreateTargetTypeEnum _$librarySaveCreateTargetTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'course':
      return _$librarySaveCreateTargetTypeEnum_course;
    case 'article':
      return _$librarySaveCreateTargetTypeEnum_article;
    case 'set_':
      return _$librarySaveCreateTargetTypeEnum_set_;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LibrarySaveCreateTargetTypeEnum>
    _$librarySaveCreateTargetTypeEnumValues = BuiltSet<
        LibrarySaveCreateTargetTypeEnum>(const <LibrarySaveCreateTargetTypeEnum>[
  _$librarySaveCreateTargetTypeEnum_course,
  _$librarySaveCreateTargetTypeEnum_article,
  _$librarySaveCreateTargetTypeEnum_set_,
]);

Serializer<LibrarySaveCreateTargetTypeEnum>
    _$librarySaveCreateTargetTypeEnumSerializer =
    _$LibrarySaveCreateTargetTypeEnumSerializer();

class _$LibrarySaveCreateTargetTypeEnumSerializer
    implements PrimitiveSerializer<LibrarySaveCreateTargetTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'course': 'course',
    'article': 'article',
    'set_': 'set',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'course': 'course',
    'article': 'article',
    'set': 'set_',
  };

  @override
  final Iterable<Type> types = const <Type>[LibrarySaveCreateTargetTypeEnum];
  @override
  final String wireName = 'LibrarySaveCreateTargetTypeEnum';

  @override
  Object serialize(
          Serializers serializers, LibrarySaveCreateTargetTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LibrarySaveCreateTargetTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LibrarySaveCreateTargetTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$LibrarySaveCreate extends LibrarySaveCreate {
  @override
  final String targetId;
  @override
  final LibrarySaveCreateTargetTypeEnum targetType;

  factory _$LibrarySaveCreate(
          [void Function(LibrarySaveCreateBuilder)? updates]) =>
      (LibrarySaveCreateBuilder()..update(updates))._build();

  _$LibrarySaveCreate._({required this.targetId, required this.targetType})
      : super._();
  @override
  LibrarySaveCreate rebuild(void Function(LibrarySaveCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibrarySaveCreateBuilder toBuilder() =>
      LibrarySaveCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibrarySaveCreate &&
        targetId == other.targetId &&
        targetType == other.targetType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, targetId.hashCode);
    _$hash = $jc(_$hash, targetType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LibrarySaveCreate')
          ..add('targetId', targetId)
          ..add('targetType', targetType))
        .toString();
  }
}

class LibrarySaveCreateBuilder
    implements Builder<LibrarySaveCreate, LibrarySaveCreateBuilder> {
  _$LibrarySaveCreate? _$v;

  String? _targetId;
  String? get targetId => _$this._targetId;
  set targetId(String? targetId) => _$this._targetId = targetId;

  LibrarySaveCreateTargetTypeEnum? _targetType;
  LibrarySaveCreateTargetTypeEnum? get targetType => _$this._targetType;
  set targetType(LibrarySaveCreateTargetTypeEnum? targetType) =>
      _$this._targetType = targetType;

  LibrarySaveCreateBuilder() {
    LibrarySaveCreate._defaults(this);
  }

  LibrarySaveCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _targetId = $v.targetId;
      _targetType = $v.targetType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibrarySaveCreate other) {
    _$v = other as _$LibrarySaveCreate;
  }

  @override
  void update(void Function(LibrarySaveCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LibrarySaveCreate build() => _build();

  _$LibrarySaveCreate _build() {
    final _$result = _$v ??
        _$LibrarySaveCreate._(
          targetId: BuiltValueNullFieldError.checkNotNull(
              targetId, r'LibrarySaveCreate', 'targetId'),
          targetType: BuiltValueNullFieldError.checkNotNull(
              targetType, r'LibrarySaveCreate', 'targetType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
