//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:remora_api/src/model/report_reason.dart';
import 'package:remora_api/src/model/report_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_item.g.dart';

/// Строка очереди модератора.
///
/// Properties:
/// * [comment] 
/// * [courseId] 
/// * [courseIsPublished] 
/// * [courseModerationStatus] 
/// * [courseSlug] 
/// * [courseTitle] 
/// * [createdAt] 
/// * [id] 
/// * [reason] 
/// * [reporterUsername] 
/// * [resolvedAt] 
/// * [status] 
@BuiltValue()
abstract class ReportItem implements Built<ReportItem, ReportItemBuilder> {
  @BuiltValueField(wireName: r'comment')
  String get comment;

  @BuiltValueField(wireName: r'course_id')
  String get courseId;

  @BuiltValueField(wireName: r'course_is_published')
  bool get courseIsPublished;

  @BuiltValueField(wireName: r'course_moderation_status')
  String get courseModerationStatus;

  @BuiltValueField(wireName: r'course_slug')
  String get courseSlug;

  @BuiltValueField(wireName: r'course_title')
  String get courseTitle;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'reason')
  ReportReason get reason;
  // enum reasonEnum {  spam,  misleading,  copyright,  offensive,  adult,  other,  };

  @BuiltValueField(wireName: r'reporter_username')
  String get reporterUsername;

  @BuiltValueField(wireName: r'resolved_at')
  DateTime? get resolvedAt;

  @BuiltValueField(wireName: r'status')
  ReportStatus get status;
  // enum statusEnum {  open,  accepted,  rejected,  };

  ReportItem._();

  factory ReportItem([void updates(ReportItemBuilder b)]) = _$ReportItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportItem> get serializer => _$ReportItemSerializer();
}

class _$ReportItemSerializer implements PrimitiveSerializer<ReportItem> {
  @override
  final Iterable<Type> types = const [ReportItem, _$ReportItem];

  @override
  final String wireName = r'ReportItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'comment';
    yield serializers.serialize(
      object.comment,
      specifiedType: const FullType(String),
    );
    yield r'course_id';
    yield serializers.serialize(
      object.courseId,
      specifiedType: const FullType(String),
    );
    yield r'course_is_published';
    yield serializers.serialize(
      object.courseIsPublished,
      specifiedType: const FullType(bool),
    );
    yield r'course_moderation_status';
    yield serializers.serialize(
      object.courseModerationStatus,
      specifiedType: const FullType(String),
    );
    yield r'course_slug';
    yield serializers.serialize(
      object.courseSlug,
      specifiedType: const FullType(String),
    );
    yield r'course_title';
    yield serializers.serialize(
      object.courseTitle,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ReportReason),
    );
    yield r'reporter_username';
    yield serializers.serialize(
      object.reporterUsername,
      specifiedType: const FullType(String),
    );
    yield r'resolved_at';
    yield object.resolvedAt == null ? null : serializers.serialize(
      object.resolvedAt,
      specifiedType: const FullType.nullable(DateTime),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ReportStatus),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'course_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseId = valueDes;
          break;
        case r'course_is_published':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.courseIsPublished = valueDes;
          break;
        case r'course_moderation_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseModerationStatus = valueDes;
          break;
        case r'course_slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseSlug = valueDes;
          break;
        case r'course_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.courseTitle = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportReason),
          ) as ReportReason;
          result.reason = valueDes;
          break;
        case r'reporter_username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reporterUsername = valueDes;
          break;
        case r'resolved_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.resolvedAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportStatus),
          ) as ReportStatus;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportItemBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}


