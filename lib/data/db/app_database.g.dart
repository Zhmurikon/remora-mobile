// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SetsTable extends Sets with TableInfo<$SetsTable, SetRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _visibilityMeta = const VerificationMeta(
    'visibility',
  );
  @override
  late final GeneratedColumn<String> visibility = GeneratedColumn<String>(
    'visibility',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardsCountMeta = const VerificationMeta(
    'cardsCount',
  );
  @override
  late final GeneratedColumn<int> cardsCount = GeneratedColumn<int>(
    'cards_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _langTermMeta = const VerificationMeta(
    'langTerm',
  );
  @override
  late final GeneratedColumn<String> langTerm = GeneratedColumn<String>(
    'lang_term',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ru'),
  );
  static const VerificationMeta _langDefinitionMeta = const VerificationMeta(
    'langDefinition',
  );
  @override
  late final GeneratedColumn<String> langDefinition = GeneratedColumn<String>(
    'lang_definition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ru'),
  );
  static const VerificationMeta _folderIdMeta = const VerificationMeta(
    'folderId',
  );
  @override
  late final GeneratedColumn<String> folderId = GeneratedColumn<String>(
    'folder_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    visibility,
    slug,
    cardsCount,
    langTerm,
    langDefinition,
    folderId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('visibility')) {
      context.handle(
        _visibilityMeta,
        visibility.isAcceptableOrUnknown(data['visibility']!, _visibilityMeta),
      );
    } else if (isInserting) {
      context.missing(_visibilityMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('cards_count')) {
      context.handle(
        _cardsCountMeta,
        cardsCount.isAcceptableOrUnknown(data['cards_count']!, _cardsCountMeta),
      );
    } else if (isInserting) {
      context.missing(_cardsCountMeta);
    }
    if (data.containsKey('lang_term')) {
      context.handle(
        _langTermMeta,
        langTerm.isAcceptableOrUnknown(data['lang_term']!, _langTermMeta),
      );
    }
    if (data.containsKey('lang_definition')) {
      context.handle(
        _langDefinitionMeta,
        langDefinition.isAcceptableOrUnknown(
          data['lang_definition']!,
          _langDefinitionMeta,
        ),
      );
    }
    if (data.containsKey('folder_id')) {
      context.handle(
        _folderIdMeta,
        folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      visibility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visibility'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      cardsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cards_count'],
      )!,
      langTerm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lang_term'],
      )!,
      langDefinition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lang_definition'],
      )!,
      folderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}folder_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SetsTable createAlias(String alias) {
    return $SetsTable(attachedDatabase, alias);
  }
}

class SetRecord extends DataClass implements Insertable<SetRecord> {
  final String id;
  final String title;
  final String description;
  final String visibility;
  final String slug;
  final int cardsCount;
  final String langTerm;
  final String langDefinition;
  final String? folderId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SetRecord({
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    required this.slug,
    required this.cardsCount,
    required this.langTerm,
    required this.langDefinition,
    this.folderId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['visibility'] = Variable<String>(visibility);
    map['slug'] = Variable<String>(slug);
    map['cards_count'] = Variable<int>(cardsCount);
    map['lang_term'] = Variable<String>(langTerm);
    map['lang_definition'] = Variable<String>(langDefinition);
    if (!nullToAbsent || folderId != null) {
      map['folder_id'] = Variable<String>(folderId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SetsCompanion toCompanion(bool nullToAbsent) {
    return SetsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      visibility: Value(visibility),
      slug: Value(slug),
      cardsCount: Value(cardsCount),
      langTerm: Value(langTerm),
      langDefinition: Value(langDefinition),
      folderId: folderId == null && nullToAbsent
          ? const Value.absent()
          : Value(folderId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SetRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetRecord(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      visibility: serializer.fromJson<String>(json['visibility']),
      slug: serializer.fromJson<String>(json['slug']),
      cardsCount: serializer.fromJson<int>(json['cardsCount']),
      langTerm: serializer.fromJson<String>(json['langTerm']),
      langDefinition: serializer.fromJson<String>(json['langDefinition']),
      folderId: serializer.fromJson<String?>(json['folderId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'visibility': serializer.toJson<String>(visibility),
      'slug': serializer.toJson<String>(slug),
      'cardsCount': serializer.toJson<int>(cardsCount),
      'langTerm': serializer.toJson<String>(langTerm),
      'langDefinition': serializer.toJson<String>(langDefinition),
      'folderId': serializer.toJson<String?>(folderId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SetRecord copyWith({
    String? id,
    String? title,
    String? description,
    String? visibility,
    String? slug,
    int? cardsCount,
    String? langTerm,
    String? langDefinition,
    Value<String?> folderId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SetRecord(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    visibility: visibility ?? this.visibility,
    slug: slug ?? this.slug,
    cardsCount: cardsCount ?? this.cardsCount,
    langTerm: langTerm ?? this.langTerm,
    langDefinition: langDefinition ?? this.langDefinition,
    folderId: folderId.present ? folderId.value : this.folderId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SetRecord copyWithCompanion(SetsCompanion data) {
    return SetRecord(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      visibility: data.visibility.present
          ? data.visibility.value
          : this.visibility,
      slug: data.slug.present ? data.slug.value : this.slug,
      cardsCount: data.cardsCount.present
          ? data.cardsCount.value
          : this.cardsCount,
      langTerm: data.langTerm.present ? data.langTerm.value : this.langTerm,
      langDefinition: data.langDefinition.present
          ? data.langDefinition.value
          : this.langDefinition,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetRecord(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('visibility: $visibility, ')
          ..write('slug: $slug, ')
          ..write('cardsCount: $cardsCount, ')
          ..write('langTerm: $langTerm, ')
          ..write('langDefinition: $langDefinition, ')
          ..write('folderId: $folderId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    visibility,
    slug,
    cardsCount,
    langTerm,
    langDefinition,
    folderId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetRecord &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.visibility == this.visibility &&
          other.slug == this.slug &&
          other.cardsCount == this.cardsCount &&
          other.langTerm == this.langTerm &&
          other.langDefinition == this.langDefinition &&
          other.folderId == this.folderId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SetsCompanion extends UpdateCompanion<SetRecord> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> visibility;
  final Value<String> slug;
  final Value<int> cardsCount;
  final Value<String> langTerm;
  final Value<String> langDefinition;
  final Value<String?> folderId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SetsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.visibility = const Value.absent(),
    this.slug = const Value.absent(),
    this.cardsCount = const Value.absent(),
    this.langTerm = const Value.absent(),
    this.langDefinition = const Value.absent(),
    this.folderId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required String visibility,
    required String slug,
    required int cardsCount,
    this.langTerm = const Value.absent(),
    this.langDefinition = const Value.absent(),
    this.folderId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       visibility = Value(visibility),
       slug = Value(slug),
       cardsCount = Value(cardsCount),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SetRecord> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? visibility,
    Expression<String>? slug,
    Expression<int>? cardsCount,
    Expression<String>? langTerm,
    Expression<String>? langDefinition,
    Expression<String>? folderId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (visibility != null) 'visibility': visibility,
      if (slug != null) 'slug': slug,
      if (cardsCount != null) 'cards_count': cardsCount,
      if (langTerm != null) 'lang_term': langTerm,
      if (langDefinition != null) 'lang_definition': langDefinition,
      if (folderId != null) 'folder_id': folderId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? visibility,
    Value<String>? slug,
    Value<int>? cardsCount,
    Value<String>? langTerm,
    Value<String>? langDefinition,
    Value<String?>? folderId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SetsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      visibility: visibility ?? this.visibility,
      slug: slug ?? this.slug,
      cardsCount: cardsCount ?? this.cardsCount,
      langTerm: langTerm ?? this.langTerm,
      langDefinition: langDefinition ?? this.langDefinition,
      folderId: folderId ?? this.folderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<String>(visibility.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (cardsCount.present) {
      map['cards_count'] = Variable<int>(cardsCount.value);
    }
    if (langTerm.present) {
      map['lang_term'] = Variable<String>(langTerm.value);
    }
    if (langDefinition.present) {
      map['lang_definition'] = Variable<String>(langDefinition.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<String>(folderId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('visibility: $visibility, ')
          ..write('slug: $slug, ')
          ..write('cardsCount: $cardsCount, ')
          ..write('langTerm: $langTerm, ')
          ..write('langDefinition: $langDefinition, ')
          ..write('folderId: $folderId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<String> setId = GeneratedColumn<String>(
    'set_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sets (id)',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _termMeta = const VerificationMeta('term');
  @override
  late final GeneratedColumn<String> term = GeneratedColumn<String>(
    'term',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _termTranscriptionMeta = const VerificationMeta(
    'termTranscription',
  );
  @override
  late final GeneratedColumn<String> termTranscription =
      GeneratedColumn<String>(
        'term_transcription',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _definitionTranscriptionMeta =
      const VerificationMeta('definitionTranscription');
  @override
  late final GeneratedColumn<String> definitionTranscription =
      GeneratedColumn<String>(
        'definition_transcription',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _hintMeta = const VerificationMeta('hint');
  @override
  late final GeneratedColumn<String> hint = GeneratedColumn<String>(
    'hint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('text'),
  );
  static const VerificationMeta _codeLanguageMeta = const VerificationMeta(
    'codeLanguage',
  );
  @override
  late final GeneratedColumn<String> codeLanguage = GeneratedColumn<String>(
    'code_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _altAnswersMeta = const VerificationMeta(
    'altAnswers',
  );
  @override
  late final GeneratedColumn<String> altAnswers = GeneratedColumn<String>(
    'alt_answers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _wrongTermAnswersMeta = const VerificationMeta(
    'wrongTermAnswers',
  );
  @override
  late final GeneratedColumn<String> wrongTermAnswers = GeneratedColumn<String>(
    'wrong_term_answers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _wrongDefinitionAnswersMeta =
      const VerificationMeta('wrongDefinitionAnswers');
  @override
  late final GeneratedColumn<String> wrongDefinitionAnswers =
      GeneratedColumn<String>(
        'wrong_definition_answers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('[]'),
      );
  static const VerificationMeta _termImageUrlMeta = const VerificationMeta(
    'termImageUrl',
  );
  @override
  late final GeneratedColumn<String> termImageUrl = GeneratedColumn<String>(
    'term_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _definitionImageUrlMeta =
      const VerificationMeta('definitionImageUrl');
  @override
  late final GeneratedColumn<String> definitionImageUrl =
      GeneratedColumn<String>(
        'definition_image_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    setId,
    position,
    term,
    definition,
    termTranscription,
    definitionTranscription,
    hint,
    contentType,
    codeLanguage,
    altAnswers,
    wrongTermAnswers,
    wrongDefinitionAnswers,
    termImageUrl,
    definitionImageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<Card> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('set_id')) {
      context.handle(
        _setIdMeta,
        setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta),
      );
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('term')) {
      context.handle(
        _termMeta,
        term.isAcceptableOrUnknown(data['term']!, _termMeta),
      );
    } else if (isInserting) {
      context.missing(_termMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('term_transcription')) {
      context.handle(
        _termTranscriptionMeta,
        termTranscription.isAcceptableOrUnknown(
          data['term_transcription']!,
          _termTranscriptionMeta,
        ),
      );
    }
    if (data.containsKey('definition_transcription')) {
      context.handle(
        _definitionTranscriptionMeta,
        definitionTranscription.isAcceptableOrUnknown(
          data['definition_transcription']!,
          _definitionTranscriptionMeta,
        ),
      );
    }
    if (data.containsKey('hint')) {
      context.handle(
        _hintMeta,
        hint.isAcceptableOrUnknown(data['hint']!, _hintMeta),
      );
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('code_language')) {
      context.handle(
        _codeLanguageMeta,
        codeLanguage.isAcceptableOrUnknown(
          data['code_language']!,
          _codeLanguageMeta,
        ),
      );
    }
    if (data.containsKey('alt_answers')) {
      context.handle(
        _altAnswersMeta,
        altAnswers.isAcceptableOrUnknown(data['alt_answers']!, _altAnswersMeta),
      );
    }
    if (data.containsKey('wrong_term_answers')) {
      context.handle(
        _wrongTermAnswersMeta,
        wrongTermAnswers.isAcceptableOrUnknown(
          data['wrong_term_answers']!,
          _wrongTermAnswersMeta,
        ),
      );
    }
    if (data.containsKey('wrong_definition_answers')) {
      context.handle(
        _wrongDefinitionAnswersMeta,
        wrongDefinitionAnswers.isAcceptableOrUnknown(
          data['wrong_definition_answers']!,
          _wrongDefinitionAnswersMeta,
        ),
      );
    }
    if (data.containsKey('term_image_url')) {
      context.handle(
        _termImageUrlMeta,
        termImageUrl.isAcceptableOrUnknown(
          data['term_image_url']!,
          _termImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('definition_image_url')) {
      context.handle(
        _definitionImageUrlMeta,
        definitionImageUrl.isAcceptableOrUnknown(
          data['definition_image_url']!,
          _definitionImageUrlMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      setId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}set_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      term: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term'],
      )!,
      definition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definition'],
      )!,
      termTranscription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term_transcription'],
      ),
      definitionTranscription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definition_transcription'],
      ),
      hint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hint'],
      ),
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      )!,
      codeLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_language'],
      ),
      altAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alt_answers'],
      )!,
      wrongTermAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wrong_term_answers'],
      )!,
      wrongDefinitionAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wrong_definition_answers'],
      )!,
      termImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term_image_url'],
      ),
      definitionImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definition_image_url'],
      ),
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final String id;
  final String setId;
  final int position;
  final String term;
  final String definition;
  final String? termTranscription;
  final String? definitionTranscription;
  final String? hint;
  final String contentType;
  final String? codeLanguage;
  final String altAnswers;
  final String wrongTermAnswers;
  final String wrongDefinitionAnswers;
  final String? termImageUrl;
  final String? definitionImageUrl;
  const Card({
    required this.id,
    required this.setId,
    required this.position,
    required this.term,
    required this.definition,
    this.termTranscription,
    this.definitionTranscription,
    this.hint,
    required this.contentType,
    this.codeLanguage,
    required this.altAnswers,
    required this.wrongTermAnswers,
    required this.wrongDefinitionAnswers,
    this.termImageUrl,
    this.definitionImageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['set_id'] = Variable<String>(setId);
    map['position'] = Variable<int>(position);
    map['term'] = Variable<String>(term);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || termTranscription != null) {
      map['term_transcription'] = Variable<String>(termTranscription);
    }
    if (!nullToAbsent || definitionTranscription != null) {
      map['definition_transcription'] = Variable<String>(
        definitionTranscription,
      );
    }
    if (!nullToAbsent || hint != null) {
      map['hint'] = Variable<String>(hint);
    }
    map['content_type'] = Variable<String>(contentType);
    if (!nullToAbsent || codeLanguage != null) {
      map['code_language'] = Variable<String>(codeLanguage);
    }
    map['alt_answers'] = Variable<String>(altAnswers);
    map['wrong_term_answers'] = Variable<String>(wrongTermAnswers);
    map['wrong_definition_answers'] = Variable<String>(wrongDefinitionAnswers);
    if (!nullToAbsent || termImageUrl != null) {
      map['term_image_url'] = Variable<String>(termImageUrl);
    }
    if (!nullToAbsent || definitionImageUrl != null) {
      map['definition_image_url'] = Variable<String>(definitionImageUrl);
    }
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      setId: Value(setId),
      position: Value(position),
      term: Value(term),
      definition: Value(definition),
      termTranscription: termTranscription == null && nullToAbsent
          ? const Value.absent()
          : Value(termTranscription),
      definitionTranscription: definitionTranscription == null && nullToAbsent
          ? const Value.absent()
          : Value(definitionTranscription),
      hint: hint == null && nullToAbsent ? const Value.absent() : Value(hint),
      contentType: Value(contentType),
      codeLanguage: codeLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(codeLanguage),
      altAnswers: Value(altAnswers),
      wrongTermAnswers: Value(wrongTermAnswers),
      wrongDefinitionAnswers: Value(wrongDefinitionAnswers),
      termImageUrl: termImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(termImageUrl),
      definitionImageUrl: definitionImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(definitionImageUrl),
    );
  }

  factory Card.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<String>(json['id']),
      setId: serializer.fromJson<String>(json['setId']),
      position: serializer.fromJson<int>(json['position']),
      term: serializer.fromJson<String>(json['term']),
      definition: serializer.fromJson<String>(json['definition']),
      termTranscription: serializer.fromJson<String?>(
        json['termTranscription'],
      ),
      definitionTranscription: serializer.fromJson<String?>(
        json['definitionTranscription'],
      ),
      hint: serializer.fromJson<String?>(json['hint']),
      contentType: serializer.fromJson<String>(json['contentType']),
      codeLanguage: serializer.fromJson<String?>(json['codeLanguage']),
      altAnswers: serializer.fromJson<String>(json['altAnswers']),
      wrongTermAnswers: serializer.fromJson<String>(json['wrongTermAnswers']),
      wrongDefinitionAnswers: serializer.fromJson<String>(
        json['wrongDefinitionAnswers'],
      ),
      termImageUrl: serializer.fromJson<String?>(json['termImageUrl']),
      definitionImageUrl: serializer.fromJson<String?>(
        json['definitionImageUrl'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'setId': serializer.toJson<String>(setId),
      'position': serializer.toJson<int>(position),
      'term': serializer.toJson<String>(term),
      'definition': serializer.toJson<String>(definition),
      'termTranscription': serializer.toJson<String?>(termTranscription),
      'definitionTranscription': serializer.toJson<String?>(
        definitionTranscription,
      ),
      'hint': serializer.toJson<String?>(hint),
      'contentType': serializer.toJson<String>(contentType),
      'codeLanguage': serializer.toJson<String?>(codeLanguage),
      'altAnswers': serializer.toJson<String>(altAnswers),
      'wrongTermAnswers': serializer.toJson<String>(wrongTermAnswers),
      'wrongDefinitionAnswers': serializer.toJson<String>(
        wrongDefinitionAnswers,
      ),
      'termImageUrl': serializer.toJson<String?>(termImageUrl),
      'definitionImageUrl': serializer.toJson<String?>(definitionImageUrl),
    };
  }

  Card copyWith({
    String? id,
    String? setId,
    int? position,
    String? term,
    String? definition,
    Value<String?> termTranscription = const Value.absent(),
    Value<String?> definitionTranscription = const Value.absent(),
    Value<String?> hint = const Value.absent(),
    String? contentType,
    Value<String?> codeLanguage = const Value.absent(),
    String? altAnswers,
    String? wrongTermAnswers,
    String? wrongDefinitionAnswers,
    Value<String?> termImageUrl = const Value.absent(),
    Value<String?> definitionImageUrl = const Value.absent(),
  }) => Card(
    id: id ?? this.id,
    setId: setId ?? this.setId,
    position: position ?? this.position,
    term: term ?? this.term,
    definition: definition ?? this.definition,
    termTranscription: termTranscription.present
        ? termTranscription.value
        : this.termTranscription,
    definitionTranscription: definitionTranscription.present
        ? definitionTranscription.value
        : this.definitionTranscription,
    hint: hint.present ? hint.value : this.hint,
    contentType: contentType ?? this.contentType,
    codeLanguage: codeLanguage.present ? codeLanguage.value : this.codeLanguage,
    altAnswers: altAnswers ?? this.altAnswers,
    wrongTermAnswers: wrongTermAnswers ?? this.wrongTermAnswers,
    wrongDefinitionAnswers:
        wrongDefinitionAnswers ?? this.wrongDefinitionAnswers,
    termImageUrl: termImageUrl.present ? termImageUrl.value : this.termImageUrl,
    definitionImageUrl: definitionImageUrl.present
        ? definitionImageUrl.value
        : this.definitionImageUrl,
  );
  Card copyWithCompanion(CardsCompanion data) {
    return Card(
      id: data.id.present ? data.id.value : this.id,
      setId: data.setId.present ? data.setId.value : this.setId,
      position: data.position.present ? data.position.value : this.position,
      term: data.term.present ? data.term.value : this.term,
      definition: data.definition.present
          ? data.definition.value
          : this.definition,
      termTranscription: data.termTranscription.present
          ? data.termTranscription.value
          : this.termTranscription,
      definitionTranscription: data.definitionTranscription.present
          ? data.definitionTranscription.value
          : this.definitionTranscription,
      hint: data.hint.present ? data.hint.value : this.hint,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      codeLanguage: data.codeLanguage.present
          ? data.codeLanguage.value
          : this.codeLanguage,
      altAnswers: data.altAnswers.present
          ? data.altAnswers.value
          : this.altAnswers,
      wrongTermAnswers: data.wrongTermAnswers.present
          ? data.wrongTermAnswers.value
          : this.wrongTermAnswers,
      wrongDefinitionAnswers: data.wrongDefinitionAnswers.present
          ? data.wrongDefinitionAnswers.value
          : this.wrongDefinitionAnswers,
      termImageUrl: data.termImageUrl.present
          ? data.termImageUrl.value
          : this.termImageUrl,
      definitionImageUrl: data.definitionImageUrl.present
          ? data.definitionImageUrl.value
          : this.definitionImageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('setId: $setId, ')
          ..write('position: $position, ')
          ..write('term: $term, ')
          ..write('definition: $definition, ')
          ..write('termTranscription: $termTranscription, ')
          ..write('definitionTranscription: $definitionTranscription, ')
          ..write('hint: $hint, ')
          ..write('contentType: $contentType, ')
          ..write('codeLanguage: $codeLanguage, ')
          ..write('altAnswers: $altAnswers, ')
          ..write('wrongTermAnswers: $wrongTermAnswers, ')
          ..write('wrongDefinitionAnswers: $wrongDefinitionAnswers, ')
          ..write('termImageUrl: $termImageUrl, ')
          ..write('definitionImageUrl: $definitionImageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    setId,
    position,
    term,
    definition,
    termTranscription,
    definitionTranscription,
    hint,
    contentType,
    codeLanguage,
    altAnswers,
    wrongTermAnswers,
    wrongDefinitionAnswers,
    termImageUrl,
    definitionImageUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.setId == this.setId &&
          other.position == this.position &&
          other.term == this.term &&
          other.definition == this.definition &&
          other.termTranscription == this.termTranscription &&
          other.definitionTranscription == this.definitionTranscription &&
          other.hint == this.hint &&
          other.contentType == this.contentType &&
          other.codeLanguage == this.codeLanguage &&
          other.altAnswers == this.altAnswers &&
          other.wrongTermAnswers == this.wrongTermAnswers &&
          other.wrongDefinitionAnswers == this.wrongDefinitionAnswers &&
          other.termImageUrl == this.termImageUrl &&
          other.definitionImageUrl == this.definitionImageUrl);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<String> id;
  final Value<String> setId;
  final Value<int> position;
  final Value<String> term;
  final Value<String> definition;
  final Value<String?> termTranscription;
  final Value<String?> definitionTranscription;
  final Value<String?> hint;
  final Value<String> contentType;
  final Value<String?> codeLanguage;
  final Value<String> altAnswers;
  final Value<String> wrongTermAnswers;
  final Value<String> wrongDefinitionAnswers;
  final Value<String?> termImageUrl;
  final Value<String?> definitionImageUrl;
  final Value<int> rowid;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.setId = const Value.absent(),
    this.position = const Value.absent(),
    this.term = const Value.absent(),
    this.definition = const Value.absent(),
    this.termTranscription = const Value.absent(),
    this.definitionTranscription = const Value.absent(),
    this.hint = const Value.absent(),
    this.contentType = const Value.absent(),
    this.codeLanguage = const Value.absent(),
    this.altAnswers = const Value.absent(),
    this.wrongTermAnswers = const Value.absent(),
    this.wrongDefinitionAnswers = const Value.absent(),
    this.termImageUrl = const Value.absent(),
    this.definitionImageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardsCompanion.insert({
    required String id,
    required String setId,
    required int position,
    required String term,
    required String definition,
    this.termTranscription = const Value.absent(),
    this.definitionTranscription = const Value.absent(),
    this.hint = const Value.absent(),
    this.contentType = const Value.absent(),
    this.codeLanguage = const Value.absent(),
    this.altAnswers = const Value.absent(),
    this.wrongTermAnswers = const Value.absent(),
    this.wrongDefinitionAnswers = const Value.absent(),
    this.termImageUrl = const Value.absent(),
    this.definitionImageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       setId = Value(setId),
       position = Value(position),
       term = Value(term),
       definition = Value(definition);
  static Insertable<Card> custom({
    Expression<String>? id,
    Expression<String>? setId,
    Expression<int>? position,
    Expression<String>? term,
    Expression<String>? definition,
    Expression<String>? termTranscription,
    Expression<String>? definitionTranscription,
    Expression<String>? hint,
    Expression<String>? contentType,
    Expression<String>? codeLanguage,
    Expression<String>? altAnswers,
    Expression<String>? wrongTermAnswers,
    Expression<String>? wrongDefinitionAnswers,
    Expression<String>? termImageUrl,
    Expression<String>? definitionImageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (setId != null) 'set_id': setId,
      if (position != null) 'position': position,
      if (term != null) 'term': term,
      if (definition != null) 'definition': definition,
      if (termTranscription != null) 'term_transcription': termTranscription,
      if (definitionTranscription != null)
        'definition_transcription': definitionTranscription,
      if (hint != null) 'hint': hint,
      if (contentType != null) 'content_type': contentType,
      if (codeLanguage != null) 'code_language': codeLanguage,
      if (altAnswers != null) 'alt_answers': altAnswers,
      if (wrongTermAnswers != null) 'wrong_term_answers': wrongTermAnswers,
      if (wrongDefinitionAnswers != null)
        'wrong_definition_answers': wrongDefinitionAnswers,
      if (termImageUrl != null) 'term_image_url': termImageUrl,
      if (definitionImageUrl != null)
        'definition_image_url': definitionImageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardsCompanion copyWith({
    Value<String>? id,
    Value<String>? setId,
    Value<int>? position,
    Value<String>? term,
    Value<String>? definition,
    Value<String?>? termTranscription,
    Value<String?>? definitionTranscription,
    Value<String?>? hint,
    Value<String>? contentType,
    Value<String?>? codeLanguage,
    Value<String>? altAnswers,
    Value<String>? wrongTermAnswers,
    Value<String>? wrongDefinitionAnswers,
    Value<String?>? termImageUrl,
    Value<String?>? definitionImageUrl,
    Value<int>? rowid,
  }) {
    return CardsCompanion(
      id: id ?? this.id,
      setId: setId ?? this.setId,
      position: position ?? this.position,
      term: term ?? this.term,
      definition: definition ?? this.definition,
      termTranscription: termTranscription ?? this.termTranscription,
      definitionTranscription:
          definitionTranscription ?? this.definitionTranscription,
      hint: hint ?? this.hint,
      contentType: contentType ?? this.contentType,
      codeLanguage: codeLanguage ?? this.codeLanguage,
      altAnswers: altAnswers ?? this.altAnswers,
      wrongTermAnswers: wrongTermAnswers ?? this.wrongTermAnswers,
      wrongDefinitionAnswers:
          wrongDefinitionAnswers ?? this.wrongDefinitionAnswers,
      termImageUrl: termImageUrl ?? this.termImageUrl,
      definitionImageUrl: definitionImageUrl ?? this.definitionImageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<String>(setId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (term.present) {
      map['term'] = Variable<String>(term.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (termTranscription.present) {
      map['term_transcription'] = Variable<String>(termTranscription.value);
    }
    if (definitionTranscription.present) {
      map['definition_transcription'] = Variable<String>(
        definitionTranscription.value,
      );
    }
    if (hint.present) {
      map['hint'] = Variable<String>(hint.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (codeLanguage.present) {
      map['code_language'] = Variable<String>(codeLanguage.value);
    }
    if (altAnswers.present) {
      map['alt_answers'] = Variable<String>(altAnswers.value);
    }
    if (wrongTermAnswers.present) {
      map['wrong_term_answers'] = Variable<String>(wrongTermAnswers.value);
    }
    if (wrongDefinitionAnswers.present) {
      map['wrong_definition_answers'] = Variable<String>(
        wrongDefinitionAnswers.value,
      );
    }
    if (termImageUrl.present) {
      map['term_image_url'] = Variable<String>(termImageUrl.value);
    }
    if (definitionImageUrl.present) {
      map['definition_image_url'] = Variable<String>(definitionImageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('setId: $setId, ')
          ..write('position: $position, ')
          ..write('term: $term, ')
          ..write('definition: $definition, ')
          ..write('termTranscription: $termTranscription, ')
          ..write('definitionTranscription: $definitionTranscription, ')
          ..write('hint: $hint, ')
          ..write('contentType: $contentType, ')
          ..write('codeLanguage: $codeLanguage, ')
          ..write('altAnswers: $altAnswers, ')
          ..write('wrongTermAnswers: $wrongTermAnswers, ')
          ..write('wrongDefinitionAnswers: $wrongDefinitionAnswers, ')
          ..write('termImageUrl: $termImageUrl, ')
          ..write('definitionImageUrl: $definitionImageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardStatesTable extends CardStates
    with TableInfo<$CardStatesTable, CardState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cards (id)',
    ),
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stabilityMeta = const VerificationMeta(
    'stability',
  );
  @override
  late final GeneratedColumn<double> stability = GeneratedColumn<double>(
    'stability',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<double> difficulty = GeneratedColumn<double>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepMeta = const VerificationMeta('step');
  @override
  late final GeneratedColumn<int> step = GeneratedColumn<int>(
    'step',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    cardId,
    direction,
    state,
    stability,
    difficulty,
    step,
    dueAt,
    lastReviewedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('stability')) {
      context.handle(
        _stabilityMeta,
        stability.isAcceptableOrUnknown(data['stability']!, _stabilityMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('step')) {
      context.handle(
        _stepMeta,
        step.isAcceptableOrUnknown(data['step']!, _stepMeta),
      );
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cardId, direction};
  @override
  CardState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardState(
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      stability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stability'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}difficulty'],
      ),
      step: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step'],
      ),
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      )!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
    );
  }

  @override
  $CardStatesTable createAlias(String alias) {
    return $CardStatesTable(attachedDatabase, alias);
  }
}

class CardState extends DataClass implements Insertable<CardState> {
  final String cardId;
  final String direction;
  final String state;
  final double? stability;
  final double? difficulty;
  final int? step;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
  const CardState({
    required this.cardId,
    required this.direction,
    required this.state,
    this.stability,
    this.difficulty,
    this.step,
    required this.dueAt,
    this.lastReviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<String>(cardId);
    map['direction'] = Variable<String>(direction);
    map['state'] = Variable<String>(state);
    if (!nullToAbsent || stability != null) {
      map['stability'] = Variable<double>(stability);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<double>(difficulty);
    }
    if (!nullToAbsent || step != null) {
      map['step'] = Variable<int>(step);
    }
    map['due_at'] = Variable<DateTime>(dueAt);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    return map;
  }

  CardStatesCompanion toCompanion(bool nullToAbsent) {
    return CardStatesCompanion(
      cardId: Value(cardId),
      direction: Value(direction),
      state: Value(state),
      stability: stability == null && nullToAbsent
          ? const Value.absent()
          : Value(stability),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      step: step == null && nullToAbsent ? const Value.absent() : Value(step),
      dueAt: Value(dueAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
    );
  }

  factory CardState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardState(
      cardId: serializer.fromJson<String>(json['cardId']),
      direction: serializer.fromJson<String>(json['direction']),
      state: serializer.fromJson<String>(json['state']),
      stability: serializer.fromJson<double?>(json['stability']),
      difficulty: serializer.fromJson<double?>(json['difficulty']),
      step: serializer.fromJson<int?>(json['step']),
      dueAt: serializer.fromJson<DateTime>(json['dueAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<String>(cardId),
      'direction': serializer.toJson<String>(direction),
      'state': serializer.toJson<String>(state),
      'stability': serializer.toJson<double?>(stability),
      'difficulty': serializer.toJson<double?>(difficulty),
      'step': serializer.toJson<int?>(step),
      'dueAt': serializer.toJson<DateTime>(dueAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
    };
  }

  CardState copyWith({
    String? cardId,
    String? direction,
    String? state,
    Value<double?> stability = const Value.absent(),
    Value<double?> difficulty = const Value.absent(),
    Value<int?> step = const Value.absent(),
    DateTime? dueAt,
    Value<DateTime?> lastReviewedAt = const Value.absent(),
  }) => CardState(
    cardId: cardId ?? this.cardId,
    direction: direction ?? this.direction,
    state: state ?? this.state,
    stability: stability.present ? stability.value : this.stability,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    step: step.present ? step.value : this.step,
    dueAt: dueAt ?? this.dueAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
  );
  CardState copyWithCompanion(CardStatesCompanion data) {
    return CardState(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      direction: data.direction.present ? data.direction.value : this.direction,
      state: data.state.present ? data.state.value : this.state,
      stability: data.stability.present ? data.stability.value : this.stability,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      step: data.step.present ? data.step.value : this.step,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardState(')
          ..write('cardId: $cardId, ')
          ..write('direction: $direction, ')
          ..write('state: $state, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('step: $step, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cardId,
    direction,
    state,
    stability,
    difficulty,
    step,
    dueAt,
    lastReviewedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardState &&
          other.cardId == this.cardId &&
          other.direction == this.direction &&
          other.state == this.state &&
          other.stability == this.stability &&
          other.difficulty == this.difficulty &&
          other.step == this.step &&
          other.dueAt == this.dueAt &&
          other.lastReviewedAt == this.lastReviewedAt);
}

class CardStatesCompanion extends UpdateCompanion<CardState> {
  final Value<String> cardId;
  final Value<String> direction;
  final Value<String> state;
  final Value<double?> stability;
  final Value<double?> difficulty;
  final Value<int?> step;
  final Value<DateTime> dueAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<int> rowid;
  const CardStatesCompanion({
    this.cardId = const Value.absent(),
    this.direction = const Value.absent(),
    this.state = const Value.absent(),
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.step = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardStatesCompanion.insert({
    required String cardId,
    required String direction,
    required String state,
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.step = const Value.absent(),
    required DateTime dueAt,
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardId = Value(cardId),
       direction = Value(direction),
       state = Value(state),
       dueAt = Value(dueAt);
  static Insertable<CardState> custom({
    Expression<String>? cardId,
    Expression<String>? direction,
    Expression<String>? state,
    Expression<double>? stability,
    Expression<double>? difficulty,
    Expression<int>? step,
    Expression<DateTime>? dueAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (direction != null) 'direction': direction,
      if (state != null) 'state': state,
      if (stability != null) 'stability': stability,
      if (difficulty != null) 'difficulty': difficulty,
      if (step != null) 'step': step,
      if (dueAt != null) 'due_at': dueAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardStatesCompanion copyWith({
    Value<String>? cardId,
    Value<String>? direction,
    Value<String>? state,
    Value<double?>? stability,
    Value<double?>? difficulty,
    Value<int?>? step,
    Value<DateTime>? dueAt,
    Value<DateTime?>? lastReviewedAt,
    Value<int>? rowid,
  }) {
    return CardStatesCompanion(
      cardId: cardId ?? this.cardId,
      direction: direction ?? this.direction,
      state: state ?? this.state,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      step: step ?? this.step,
      dueAt: dueAt ?? this.dueAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (stability.present) {
      map['stability'] = Variable<double>(stability.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<double>(difficulty.value);
    }
    if (step.present) {
      map['step'] = Variable<int>(step.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardStatesCompanion(')
          ..write('cardId: $cardId, ')
          ..write('direction: $direction, ')
          ..write('state: $state, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('step: $step, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTable extends SyncMeta
    with TableInfo<$SyncMetaTable, SyncMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _revisionMeta = const VerificationMeta(
    'revision',
  );
  @override
  late final GeneratedColumn<String> revision = GeneratedColumn<String>(
    'revision',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    entityType,
    entityId,
    lastSyncedAt,
    revision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    if (data.containsKey('revision')) {
      context.handle(
        _revisionMeta,
        revision.isAcceptableOrUnknown(data['revision']!, _revisionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entityType, entityId};
  @override
  SyncMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaData(
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      )!,
      revision: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revision'],
      ),
    );
  }

  @override
  $SyncMetaTable createAlias(String alias) {
    return $SyncMetaTable(attachedDatabase, alias);
  }
}

class SyncMetaData extends DataClass implements Insertable<SyncMetaData> {
  final String entityType;
  final String entityId;
  final DateTime lastSyncedAt;
  final String? revision;
  const SyncMetaData({
    required this.entityType,
    required this.entityId,
    required this.lastSyncedAt,
    this.revision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    if (!nullToAbsent || revision != null) {
      map['revision'] = Variable<String>(revision);
    }
    return map;
  }

  SyncMetaCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaCompanion(
      entityType: Value(entityType),
      entityId: Value(entityId),
      lastSyncedAt: Value(lastSyncedAt),
      revision: revision == null && nullToAbsent
          ? const Value.absent()
          : Value(revision),
    );
  }

  factory SyncMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaData(
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
      revision: serializer.fromJson<String?>(json['revision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
      'revision': serializer.toJson<String?>(revision),
    };
  }

  SyncMetaData copyWith({
    String? entityType,
    String? entityId,
    DateTime? lastSyncedAt,
    Value<String?> revision = const Value.absent(),
  }) => SyncMetaData(
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    revision: revision.present ? revision.value : this.revision,
  );
  SyncMetaData copyWithCompanion(SyncMetaCompanion data) {
    return SyncMetaData(
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      revision: data.revision.present ? data.revision.value : this.revision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaData(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('revision: $revision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(entityType, entityId, lastSyncedAt, revision);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaData &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.revision == this.revision);
}

class SyncMetaCompanion extends UpdateCompanion<SyncMetaData> {
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<DateTime> lastSyncedAt;
  final Value<String?> revision;
  final Value<int> rowid;
  const SyncMetaCompanion({
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.revision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetaCompanion.insert({
    required String entityType,
    required String entityId,
    required DateTime lastSyncedAt,
    this.revision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       lastSyncedAt = Value(lastSyncedAt);
  static Insertable<SyncMetaData> custom({
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? revision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (revision != null) 'revision': revision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetaCompanion copyWith({
    Value<String>? entityType,
    Value<String>? entityId,
    Value<DateTime>? lastSyncedAt,
    Value<String?>? revision,
    Value<int>? rowid,
  }) {
    return SyncMetaCompanion(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      revision: revision ?? this.revision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (revision.present) {
      map['revision'] = Variable<String>(revision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaCompanion(')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('revision: $revision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewOutboxTable extends ReviewOutbox
    with TableInfo<$ReviewOutboxTable, ReviewOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientReviewIdMeta = const VerificationMeta(
    'clientReviewId',
  );
  @override
  late final GeneratedColumn<String> clientReviewId = GeneratedColumn<String>(
    'client_review_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerCorrectMeta = const VerificationMeta(
    'answerCorrect',
  );
  @override
  late final GeneratedColumn<bool> answerCorrect = GeneratedColumn<bool>(
    'answer_correct',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("answer_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reviewedAtMeta = const VerificationMeta(
    'reviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reviewedAt = GeneratedColumn<DateTime>(
    'reviewed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    clientReviewId,
    cardId,
    direction,
    mode,
    rating,
    answerCorrect,
    durationMs,
    reviewedAt,
    sessionId,
    attempts,
    lastAttemptAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewOutboxData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_review_id')) {
      context.handle(
        _clientReviewIdMeta,
        clientReviewId.isAcceptableOrUnknown(
          data['client_review_id']!,
          _clientReviewIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientReviewIdMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('answer_correct')) {
      context.handle(
        _answerCorrectMeta,
        answerCorrect.isAcceptableOrUnknown(
          data['answer_correct']!,
          _answerCorrectMeta,
        ),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
        _reviewedAtMeta,
        reviewedAt.isAcceptableOrUnknown(data['reviewed_at']!, _reviewedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewedAtMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientReviewId};
  @override
  ReviewOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewOutboxData(
      clientReviewId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_review_id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      )!,
      answerCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}answer_correct'],
      ),
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      ),
      reviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reviewed_at'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
    );
  }

  @override
  $ReviewOutboxTable createAlias(String alias) {
    return $ReviewOutboxTable(attachedDatabase, alias);
  }
}

class ReviewOutboxData extends DataClass
    implements Insertable<ReviewOutboxData> {
  final String clientReviewId;
  final String cardId;
  final String direction;
  final String mode;
  final int rating;
  final bool? answerCorrect;
  final int? durationMs;
  final DateTime reviewedAt;
  final String? sessionId;
  final int attempts;
  final DateTime? lastAttemptAt;
  const ReviewOutboxData({
    required this.clientReviewId,
    required this.cardId,
    required this.direction,
    required this.mode,
    required this.rating,
    this.answerCorrect,
    this.durationMs,
    required this.reviewedAt,
    this.sessionId,
    required this.attempts,
    this.lastAttemptAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_review_id'] = Variable<String>(clientReviewId);
    map['card_id'] = Variable<String>(cardId);
    map['direction'] = Variable<String>(direction);
    map['mode'] = Variable<String>(mode);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || answerCorrect != null) {
      map['answer_correct'] = Variable<bool>(answerCorrect);
    }
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    map['reviewed_at'] = Variable<DateTime>(reviewedAt);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  ReviewOutboxCompanion toCompanion(bool nullToAbsent) {
    return ReviewOutboxCompanion(
      clientReviewId: Value(clientReviewId),
      cardId: Value(cardId),
      direction: Value(direction),
      mode: Value(mode),
      rating: Value(rating),
      answerCorrect: answerCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(answerCorrect),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
      reviewedAt: Value(reviewedAt),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      attempts: Value(attempts),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory ReviewOutboxData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewOutboxData(
      clientReviewId: serializer.fromJson<String>(json['clientReviewId']),
      cardId: serializer.fromJson<String>(json['cardId']),
      direction: serializer.fromJson<String>(json['direction']),
      mode: serializer.fromJson<String>(json['mode']),
      rating: serializer.fromJson<int>(json['rating']),
      answerCorrect: serializer.fromJson<bool?>(json['answerCorrect']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
      reviewedAt: serializer.fromJson<DateTime>(json['reviewedAt']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientReviewId': serializer.toJson<String>(clientReviewId),
      'cardId': serializer.toJson<String>(cardId),
      'direction': serializer.toJson<String>(direction),
      'mode': serializer.toJson<String>(mode),
      'rating': serializer.toJson<int>(rating),
      'answerCorrect': serializer.toJson<bool?>(answerCorrect),
      'durationMs': serializer.toJson<int?>(durationMs),
      'reviewedAt': serializer.toJson<DateTime>(reviewedAt),
      'sessionId': serializer.toJson<String?>(sessionId),
      'attempts': serializer.toJson<int>(attempts),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  ReviewOutboxData copyWith({
    String? clientReviewId,
    String? cardId,
    String? direction,
    String? mode,
    int? rating,
    Value<bool?> answerCorrect = const Value.absent(),
    Value<int?> durationMs = const Value.absent(),
    DateTime? reviewedAt,
    Value<String?> sessionId = const Value.absent(),
    int? attempts,
    Value<DateTime?> lastAttemptAt = const Value.absent(),
  }) => ReviewOutboxData(
    clientReviewId: clientReviewId ?? this.clientReviewId,
    cardId: cardId ?? this.cardId,
    direction: direction ?? this.direction,
    mode: mode ?? this.mode,
    rating: rating ?? this.rating,
    answerCorrect: answerCorrect.present
        ? answerCorrect.value
        : this.answerCorrect,
    durationMs: durationMs.present ? durationMs.value : this.durationMs,
    reviewedAt: reviewedAt ?? this.reviewedAt,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    attempts: attempts ?? this.attempts,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
  );
  ReviewOutboxData copyWithCompanion(ReviewOutboxCompanion data) {
    return ReviewOutboxData(
      clientReviewId: data.clientReviewId.present
          ? data.clientReviewId.value
          : this.clientReviewId,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      direction: data.direction.present ? data.direction.value : this.direction,
      mode: data.mode.present ? data.mode.value : this.mode,
      rating: data.rating.present ? data.rating.value : this.rating,
      answerCorrect: data.answerCorrect.present
          ? data.answerCorrect.value
          : this.answerCorrect,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      reviewedAt: data.reviewedAt.present
          ? data.reviewedAt.value
          : this.reviewedAt,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewOutboxData(')
          ..write('clientReviewId: $clientReviewId, ')
          ..write('cardId: $cardId, ')
          ..write('direction: $direction, ')
          ..write('mode: $mode, ')
          ..write('rating: $rating, ')
          ..write('answerCorrect: $answerCorrect, ')
          ..write('durationMs: $durationMs, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('sessionId: $sessionId, ')
          ..write('attempts: $attempts, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientReviewId,
    cardId,
    direction,
    mode,
    rating,
    answerCorrect,
    durationMs,
    reviewedAt,
    sessionId,
    attempts,
    lastAttemptAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewOutboxData &&
          other.clientReviewId == this.clientReviewId &&
          other.cardId == this.cardId &&
          other.direction == this.direction &&
          other.mode == this.mode &&
          other.rating == this.rating &&
          other.answerCorrect == this.answerCorrect &&
          other.durationMs == this.durationMs &&
          other.reviewedAt == this.reviewedAt &&
          other.sessionId == this.sessionId &&
          other.attempts == this.attempts &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class ReviewOutboxCompanion extends UpdateCompanion<ReviewOutboxData> {
  final Value<String> clientReviewId;
  final Value<String> cardId;
  final Value<String> direction;
  final Value<String> mode;
  final Value<int> rating;
  final Value<bool?> answerCorrect;
  final Value<int?> durationMs;
  final Value<DateTime> reviewedAt;
  final Value<String?> sessionId;
  final Value<int> attempts;
  final Value<DateTime?> lastAttemptAt;
  final Value<int> rowid;
  const ReviewOutboxCompanion({
    this.clientReviewId = const Value.absent(),
    this.cardId = const Value.absent(),
    this.direction = const Value.absent(),
    this.mode = const Value.absent(),
    this.rating = const Value.absent(),
    this.answerCorrect = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.reviewedAt = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewOutboxCompanion.insert({
    required String clientReviewId,
    required String cardId,
    required String direction,
    required String mode,
    required int rating,
    this.answerCorrect = const Value.absent(),
    this.durationMs = const Value.absent(),
    required DateTime reviewedAt,
    this.sessionId = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientReviewId = Value(clientReviewId),
       cardId = Value(cardId),
       direction = Value(direction),
       mode = Value(mode),
       rating = Value(rating),
       reviewedAt = Value(reviewedAt);
  static Insertable<ReviewOutboxData> custom({
    Expression<String>? clientReviewId,
    Expression<String>? cardId,
    Expression<String>? direction,
    Expression<String>? mode,
    Expression<int>? rating,
    Expression<bool>? answerCorrect,
    Expression<int>? durationMs,
    Expression<DateTime>? reviewedAt,
    Expression<String>? sessionId,
    Expression<int>? attempts,
    Expression<DateTime>? lastAttemptAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientReviewId != null) 'client_review_id': clientReviewId,
      if (cardId != null) 'card_id': cardId,
      if (direction != null) 'direction': direction,
      if (mode != null) 'mode': mode,
      if (rating != null) 'rating': rating,
      if (answerCorrect != null) 'answer_correct': answerCorrect,
      if (durationMs != null) 'duration_ms': durationMs,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
      if (sessionId != null) 'session_id': sessionId,
      if (attempts != null) 'attempts': attempts,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewOutboxCompanion copyWith({
    Value<String>? clientReviewId,
    Value<String>? cardId,
    Value<String>? direction,
    Value<String>? mode,
    Value<int>? rating,
    Value<bool?>? answerCorrect,
    Value<int?>? durationMs,
    Value<DateTime>? reviewedAt,
    Value<String?>? sessionId,
    Value<int>? attempts,
    Value<DateTime?>? lastAttemptAt,
    Value<int>? rowid,
  }) {
    return ReviewOutboxCompanion(
      clientReviewId: clientReviewId ?? this.clientReviewId,
      cardId: cardId ?? this.cardId,
      direction: direction ?? this.direction,
      mode: mode ?? this.mode,
      rating: rating ?? this.rating,
      answerCorrect: answerCorrect ?? this.answerCorrect,
      durationMs: durationMs ?? this.durationMs,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      sessionId: sessionId ?? this.sessionId,
      attempts: attempts ?? this.attempts,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientReviewId.present) {
      map['client_review_id'] = Variable<String>(clientReviewId.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (answerCorrect.present) {
      map['answer_correct'] = Variable<bool>(answerCorrect.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewOutboxCompanion(')
          ..write('clientReviewId: $clientReviewId, ')
          ..write('cardId: $cardId, ')
          ..write('direction: $direction, ')
          ..write('mode: $mode, ')
          ..write('rating: $rating, ')
          ..write('answerCorrect: $answerCorrect, ')
          ..write('durationMs: $durationMs, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('sessionId: $sessionId, ')
          ..write('attempts: $attempts, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SetsTable sets = $SetsTable(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $CardStatesTable cardStates = $CardStatesTable(this);
  late final $SyncMetaTable syncMeta = $SyncMetaTable(this);
  late final $ReviewOutboxTable reviewOutbox = $ReviewOutboxTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sets,
    cards,
    cardStates,
    syncMeta,
    reviewOutbox,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SetsTableCreateCompanionBuilder =
    SetsCompanion Function({
      required String id,
      required String title,
      Value<String> description,
      required String visibility,
      required String slug,
      required int cardsCount,
      Value<String> langTerm,
      Value<String> langDefinition,
      Value<String?> folderId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SetsTableUpdateCompanionBuilder =
    SetsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<String> visibility,
      Value<String> slug,
      Value<int> cardsCount,
      Value<String> langTerm,
      Value<String> langDefinition,
      Value<String?> folderId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SetsTableReferences
    extends BaseReferences<_$AppDatabase, $SetsTable, SetRecord> {
  $$SetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CardsTable, List<Card>> _cardsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.cards,
    aliasName: 'sets__id__cards__set_id',
  );

  $$CardsTableProcessedTableManager get cardsRefs {
    final manager = $$CardsTableTableManager(
      $_db,
      $_db.cards,
    ).filter((f) => f.setId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cardsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SetsTableFilterComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cardsCount => $composableBuilder(
    column: $table.cardsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get langTerm => $composableBuilder(
    column: $table.langTerm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get langDefinition => $composableBuilder(
    column: $table.langDefinition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get folderId => $composableBuilder(
    column: $table.folderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cardsRefs(
    Expression<bool> Function($$CardsTableFilterComposer f) f,
  ) {
    final $$CardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.setId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableFilterComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SetsTableOrderingComposer extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cardsCount => $composableBuilder(
    column: $table.cardsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get langTerm => $composableBuilder(
    column: $table.langTerm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get langDefinition => $composableBuilder(
    column: $table.langDefinition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get folderId => $composableBuilder(
    column: $table.folderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetsTable> {
  $$SetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => column,
  );

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<int> get cardsCount => $composableBuilder(
    column: $table.cardsCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get langTerm =>
      $composableBuilder(column: $table.langTerm, builder: (column) => column);

  GeneratedColumn<String> get langDefinition => $composableBuilder(
    column: $table.langDefinition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get folderId =>
      $composableBuilder(column: $table.folderId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> cardsRefs<T extends Object>(
    Expression<T> Function($$CardsTableAnnotationComposer a) f,
  ) {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.setId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableAnnotationComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetsTable,
          SetRecord,
          $$SetsTableFilterComposer,
          $$SetsTableOrderingComposer,
          $$SetsTableAnnotationComposer,
          $$SetsTableCreateCompanionBuilder,
          $$SetsTableUpdateCompanionBuilder,
          (SetRecord, $$SetsTableReferences),
          SetRecord,
          PrefetchHooks Function({bool cardsRefs})
        > {
  $$SetsTableTableManager(_$AppDatabase db, $SetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> visibility = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<int> cardsCount = const Value.absent(),
                Value<String> langTerm = const Value.absent(),
                Value<String> langDefinition = const Value.absent(),
                Value<String?> folderId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetsCompanion(
                id: id,
                title: title,
                description: description,
                visibility: visibility,
                slug: slug,
                cardsCount: cardsCount,
                langTerm: langTerm,
                langDefinition: langDefinition,
                folderId: folderId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String> description = const Value.absent(),
                required String visibility,
                required String slug,
                required int cardsCount,
                Value<String> langTerm = const Value.absent(),
                Value<String> langDefinition = const Value.absent(),
                Value<String?> folderId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SetsCompanion.insert(
                id: id,
                title: title,
                description: description,
                visibility: visibility,
                slug: slug,
                cardsCount: cardsCount,
                langTerm: langTerm,
                langDefinition: langDefinition,
                folderId: folderId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SetsTable, SetRecord>(table),
                  $$SetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cardsRefs) db.cards],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardsRefs)
                    await $_getPrefetchedData<SetRecord, $SetsTable, Card>(
                      currentTable: table,
                      referencedTable: $$SetsTableReferences._cardsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$SetsTableReferences(db, table, p0).cardsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.setId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetsTable,
      SetRecord,
      $$SetsTableFilterComposer,
      $$SetsTableOrderingComposer,
      $$SetsTableAnnotationComposer,
      $$SetsTableCreateCompanionBuilder,
      $$SetsTableUpdateCompanionBuilder,
      (SetRecord, $$SetsTableReferences),
      SetRecord,
      PrefetchHooks Function({bool cardsRefs})
    >;
typedef $$CardsTableCreateCompanionBuilder =
    CardsCompanion Function({
      required String id,
      required String setId,
      required int position,
      required String term,
      required String definition,
      Value<String?> termTranscription,
      Value<String?> definitionTranscription,
      Value<String?> hint,
      Value<String> contentType,
      Value<String?> codeLanguage,
      Value<String> altAnswers,
      Value<String> wrongTermAnswers,
      Value<String> wrongDefinitionAnswers,
      Value<String?> termImageUrl,
      Value<String?> definitionImageUrl,
      Value<int> rowid,
    });
typedef $$CardsTableUpdateCompanionBuilder =
    CardsCompanion Function({
      Value<String> id,
      Value<String> setId,
      Value<int> position,
      Value<String> term,
      Value<String> definition,
      Value<String?> termTranscription,
      Value<String?> definitionTranscription,
      Value<String?> hint,
      Value<String> contentType,
      Value<String?> codeLanguage,
      Value<String> altAnswers,
      Value<String> wrongTermAnswers,
      Value<String> wrongDefinitionAnswers,
      Value<String?> termImageUrl,
      Value<String?> definitionImageUrl,
      Value<int> rowid,
    });

final class $$CardsTableReferences
    extends BaseReferences<_$AppDatabase, $CardsTable, Card> {
  $$CardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SetsTable _setIdTable(_$AppDatabase db) =>
      db.sets.createAlias('cards__set_id__sets__id');

  $$SetsTableProcessedTableManager get setId {
    final $_column = $_itemColumn<String>('set_id')!;

    final manager = $$SetsTableTableManager(
      $_db,
      $_db.sets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_setIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CardStatesTable, List<CardState>>
  _cardStatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cardStates,
    aliasName: 'cards__id__card_states__card_id',
  );

  $$CardStatesTableProcessedTableManager get cardStatesRefs {
    final manager = $$CardStatesTableTableManager(
      $_db,
      $_db.cardStates,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cardStatesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get term => $composableBuilder(
    column: $table.term,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termTranscription => $composableBuilder(
    column: $table.termTranscription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definitionTranscription => $composableBuilder(
    column: $table.definitionTranscription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hint => $composableBuilder(
    column: $table.hint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codeLanguage => $composableBuilder(
    column: $table.codeLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get altAnswers => $composableBuilder(
    column: $table.altAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wrongTermAnswers => $composableBuilder(
    column: $table.wrongTermAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wrongDefinitionAnswers => $composableBuilder(
    column: $table.wrongDefinitionAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termImageUrl => $composableBuilder(
    column: $table.termImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definitionImageUrl => $composableBuilder(
    column: $table.definitionImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$SetsTableFilterComposer get setId {
    final $$SetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.setId,
      referencedTable: $db.sets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetsTableFilterComposer(
            $db: $db,
            $table: $db.sets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cardStatesRefs(
    Expression<bool> Function($$CardStatesTableFilterComposer f) f,
  ) {
    final $$CardStatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cardStates,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardStatesTableFilterComposer(
            $db: $db,
            $table: $db.cardStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get term => $composableBuilder(
    column: $table.term,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termTranscription => $composableBuilder(
    column: $table.termTranscription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definitionTranscription => $composableBuilder(
    column: $table.definitionTranscription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hint => $composableBuilder(
    column: $table.hint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codeLanguage => $composableBuilder(
    column: $table.codeLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get altAnswers => $composableBuilder(
    column: $table.altAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wrongTermAnswers => $composableBuilder(
    column: $table.wrongTermAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wrongDefinitionAnswers => $composableBuilder(
    column: $table.wrongDefinitionAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termImageUrl => $composableBuilder(
    column: $table.termImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definitionImageUrl => $composableBuilder(
    column: $table.definitionImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$SetsTableOrderingComposer get setId {
    final $$SetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.setId,
      referencedTable: $db.sets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetsTableOrderingComposer(
            $db: $db,
            $table: $db.sets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get term =>
      $composableBuilder(column: $table.term, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get termTranscription => $composableBuilder(
    column: $table.termTranscription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get definitionTranscription => $composableBuilder(
    column: $table.definitionTranscription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hint =>
      $composableBuilder(column: $table.hint, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codeLanguage => $composableBuilder(
    column: $table.codeLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get altAnswers => $composableBuilder(
    column: $table.altAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wrongTermAnswers => $composableBuilder(
    column: $table.wrongTermAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wrongDefinitionAnswers => $composableBuilder(
    column: $table.wrongDefinitionAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get termImageUrl => $composableBuilder(
    column: $table.termImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get definitionImageUrl => $composableBuilder(
    column: $table.definitionImageUrl,
    builder: (column) => column,
  );

  $$SetsTableAnnotationComposer get setId {
    final $$SetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.setId,
      referencedTable: $db.sets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetsTableAnnotationComposer(
            $db: $db,
            $table: $db.sets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cardStatesRefs<T extends Object>(
    Expression<T> Function($$CardStatesTableAnnotationComposer a) f,
  ) {
    final $$CardStatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cardStates,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardStatesTableAnnotationComposer(
            $db: $db,
            $table: $db.cardStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardsTable,
          Card,
          $$CardsTableFilterComposer,
          $$CardsTableOrderingComposer,
          $$CardsTableAnnotationComposer,
          $$CardsTableCreateCompanionBuilder,
          $$CardsTableUpdateCompanionBuilder,
          (Card, $$CardsTableReferences),
          Card,
          PrefetchHooks Function({bool setId, bool cardStatesRefs})
        > {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> setId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> term = const Value.absent(),
                Value<String> definition = const Value.absent(),
                Value<String?> termTranscription = const Value.absent(),
                Value<String?> definitionTranscription = const Value.absent(),
                Value<String?> hint = const Value.absent(),
                Value<String> contentType = const Value.absent(),
                Value<String?> codeLanguage = const Value.absent(),
                Value<String> altAnswers = const Value.absent(),
                Value<String> wrongTermAnswers = const Value.absent(),
                Value<String> wrongDefinitionAnswers = const Value.absent(),
                Value<String?> termImageUrl = const Value.absent(),
                Value<String?> definitionImageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardsCompanion(
                id: id,
                setId: setId,
                position: position,
                term: term,
                definition: definition,
                termTranscription: termTranscription,
                definitionTranscription: definitionTranscription,
                hint: hint,
                contentType: contentType,
                codeLanguage: codeLanguage,
                altAnswers: altAnswers,
                wrongTermAnswers: wrongTermAnswers,
                wrongDefinitionAnswers: wrongDefinitionAnswers,
                termImageUrl: termImageUrl,
                definitionImageUrl: definitionImageUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String setId,
                required int position,
                required String term,
                required String definition,
                Value<String?> termTranscription = const Value.absent(),
                Value<String?> definitionTranscription = const Value.absent(),
                Value<String?> hint = const Value.absent(),
                Value<String> contentType = const Value.absent(),
                Value<String?> codeLanguage = const Value.absent(),
                Value<String> altAnswers = const Value.absent(),
                Value<String> wrongTermAnswers = const Value.absent(),
                Value<String> wrongDefinitionAnswers = const Value.absent(),
                Value<String?> termImageUrl = const Value.absent(),
                Value<String?> definitionImageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardsCompanion.insert(
                id: id,
                setId: setId,
                position: position,
                term: term,
                definition: definition,
                termTranscription: termTranscription,
                definitionTranscription: definitionTranscription,
                hint: hint,
                contentType: contentType,
                codeLanguage: codeLanguage,
                altAnswers: altAnswers,
                wrongTermAnswers: wrongTermAnswers,
                wrongDefinitionAnswers: wrongDefinitionAnswers,
                termImageUrl: termImageUrl,
                definitionImageUrl: definitionImageUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CardsTable, Card>(table),
                  $$CardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({setId = false, cardStatesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cardStatesRefs) db.cardStates],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (setId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.setId,
                                referencedTable: $$CardsTableReferences
                                    ._setIdTable(db),
                                referencedColumn: $$CardsTableReferences
                                    ._setIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cardStatesRefs)
                    await $_getPrefetchedData<Card, $CardsTable, CardState>(
                      currentTable: table,
                      referencedTable: $$CardsTableReferences
                          ._cardStatesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CardsTableReferences(db, table, p0).cardStatesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.cardId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardsTable,
      Card,
      $$CardsTableFilterComposer,
      $$CardsTableOrderingComposer,
      $$CardsTableAnnotationComposer,
      $$CardsTableCreateCompanionBuilder,
      $$CardsTableUpdateCompanionBuilder,
      (Card, $$CardsTableReferences),
      Card,
      PrefetchHooks Function({bool setId, bool cardStatesRefs})
    >;
typedef $$CardStatesTableCreateCompanionBuilder =
    CardStatesCompanion Function({
      required String cardId,
      required String direction,
      required String state,
      Value<double?> stability,
      Value<double?> difficulty,
      Value<int?> step,
      required DateTime dueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });
typedef $$CardStatesTableUpdateCompanionBuilder =
    CardStatesCompanion Function({
      Value<String> cardId,
      Value<String> direction,
      Value<String> state,
      Value<double?> stability,
      Value<double?> difficulty,
      Value<int?> step,
      Value<DateTime> dueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });

final class $$CardStatesTableReferences
    extends BaseReferences<_$AppDatabase, $CardStatesTable, CardState> {
  $$CardStatesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) =>
      db.cards.createAlias('card_states__card_id__cards__id');

  $$CardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$CardsTableTableManager(
      $_db,
      $_db.cards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CardStatesTableFilterComposer
    extends Composer<_$AppDatabase, $CardStatesTable> {
  $$CardStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get step => $composableBuilder(
    column: $table.step,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableFilterComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $CardStatesTable> {
  $$CardStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stability => $composableBuilder(
    column: $table.stability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get step => $composableBuilder(
    column: $table.step,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableOrderingComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardStatesTable> {
  $$CardStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<double> get stability =>
      $composableBuilder(column: $table.stability, builder: (column) => column);

  GeneratedColumn<double> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<int> get step =>
      $composableBuilder(column: $table.step, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableAnnotationComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CardStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardStatesTable,
          CardState,
          $$CardStatesTableFilterComposer,
          $$CardStatesTableOrderingComposer,
          $$CardStatesTableAnnotationComposer,
          $$CardStatesTableCreateCompanionBuilder,
          $$CardStatesTableUpdateCompanionBuilder,
          (CardState, $$CardStatesTableReferences),
          CardState,
          PrefetchHooks Function({bool cardId})
        > {
  $$CardStatesTableTableManager(_$AppDatabase db, $CardStatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cardId = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<double?> stability = const Value.absent(),
                Value<double?> difficulty = const Value.absent(),
                Value<int?> step = const Value.absent(),
                Value<DateTime> dueAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardStatesCompanion(
                cardId: cardId,
                direction: direction,
                state: state,
                stability: stability,
                difficulty: difficulty,
                step: step,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cardId,
                required String direction,
                required String state,
                Value<double?> stability = const Value.absent(),
                Value<double?> difficulty = const Value.absent(),
                Value<int?> step = const Value.absent(),
                required DateTime dueAt,
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardStatesCompanion.insert(
                cardId: cardId,
                direction: direction,
                state: state,
                stability: stability,
                difficulty: difficulty,
                step: step,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CardStatesTable, CardState>(table),
                  $$CardStatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cardId,
                                referencedTable: $$CardStatesTableReferences
                                    ._cardIdTable(db),
                                referencedColumn: $$CardStatesTableReferences
                                    ._cardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CardStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardStatesTable,
      CardState,
      $$CardStatesTableFilterComposer,
      $$CardStatesTableOrderingComposer,
      $$CardStatesTableAnnotationComposer,
      $$CardStatesTableCreateCompanionBuilder,
      $$CardStatesTableUpdateCompanionBuilder,
      (CardState, $$CardStatesTableReferences),
      CardState,
      PrefetchHooks Function({bool cardId})
    >;
typedef $$SyncMetaTableCreateCompanionBuilder =
    SyncMetaCompanion Function({
      required String entityType,
      required String entityId,
      required DateTime lastSyncedAt,
      Value<String?> revision,
      Value<int> rowid,
    });
typedef $$SyncMetaTableUpdateCompanionBuilder =
    SyncMetaCompanion Function({
      Value<String> entityType,
      Value<String> entityId,
      Value<DateTime> lastSyncedAt,
      Value<String?> revision,
      Value<int> rowid,
    });

class $$SyncMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revision => $composableBuilder(
    column: $table.revision,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revision =>
      $composableBuilder(column: $table.revision, builder: (column) => column);
}

class $$SyncMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetaTable,
          SyncMetaData,
          $$SyncMetaTableFilterComposer,
          $$SyncMetaTableOrderingComposer,
          $$SyncMetaTableAnnotationComposer,
          $$SyncMetaTableCreateCompanionBuilder,
          $$SyncMetaTableUpdateCompanionBuilder,
          (
            SyncMetaData,
            BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
          ),
          SyncMetaData,
          PrefetchHooks Function()
        > {
  $$SyncMetaTableTableManager(_$AppDatabase db, $SyncMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<DateTime> lastSyncedAt = const Value.absent(),
                Value<String?> revision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion(
                entityType: entityType,
                entityId: entityId,
                lastSyncedAt: lastSyncedAt,
                revision: revision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String entityType,
                required String entityId,
                required DateTime lastSyncedAt,
                Value<String?> revision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion.insert(
                entityType: entityType,
                entityId: entityId,
                lastSyncedAt: lastSyncedAt,
                revision: revision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncMetaTable, SyncMetaData>(table),
                  BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetaTable,
      SyncMetaData,
      $$SyncMetaTableFilterComposer,
      $$SyncMetaTableOrderingComposer,
      $$SyncMetaTableAnnotationComposer,
      $$SyncMetaTableCreateCompanionBuilder,
      $$SyncMetaTableUpdateCompanionBuilder,
      (
        SyncMetaData,
        BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
      ),
      SyncMetaData,
      PrefetchHooks Function()
    >;
typedef $$ReviewOutboxTableCreateCompanionBuilder =
    ReviewOutboxCompanion Function({
      required String clientReviewId,
      required String cardId,
      required String direction,
      required String mode,
      required int rating,
      Value<bool?> answerCorrect,
      Value<int?> durationMs,
      required DateTime reviewedAt,
      Value<String?> sessionId,
      Value<int> attempts,
      Value<DateTime?> lastAttemptAt,
      Value<int> rowid,
    });
typedef $$ReviewOutboxTableUpdateCompanionBuilder =
    ReviewOutboxCompanion Function({
      Value<String> clientReviewId,
      Value<String> cardId,
      Value<String> direction,
      Value<String> mode,
      Value<int> rating,
      Value<bool?> answerCorrect,
      Value<int?> durationMs,
      Value<DateTime> reviewedAt,
      Value<String?> sessionId,
      Value<int> attempts,
      Value<DateTime?> lastAttemptAt,
      Value<int> rowid,
    });

class $$ReviewOutboxTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewOutboxTable> {
  $$ReviewOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientReviewId => $composableBuilder(
    column: $table.clientReviewId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardId => $composableBuilder(
    column: $table.cardId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get answerCorrect => $composableBuilder(
    column: $table.answerCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReviewOutboxTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewOutboxTable> {
  $$ReviewOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientReviewId => $composableBuilder(
    column: $table.clientReviewId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardId => $composableBuilder(
    column: $table.cardId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get answerCorrect => $composableBuilder(
    column: $table.answerCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReviewOutboxTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewOutboxTable> {
  $$ReviewOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientReviewId => $composableBuilder(
    column: $table.clientReviewId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cardId =>
      $composableBuilder(column: $table.cardId, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<bool> get answerCorrect => $composableBuilder(
    column: $table.answerCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );
}

class $$ReviewOutboxTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewOutboxTable,
          ReviewOutboxData,
          $$ReviewOutboxTableFilterComposer,
          $$ReviewOutboxTableOrderingComposer,
          $$ReviewOutboxTableAnnotationComposer,
          $$ReviewOutboxTableCreateCompanionBuilder,
          $$ReviewOutboxTableUpdateCompanionBuilder,
          (
            ReviewOutboxData,
            BaseReferences<_$AppDatabase, $ReviewOutboxTable, ReviewOutboxData>,
          ),
          ReviewOutboxData,
          PrefetchHooks Function()
        > {
  $$ReviewOutboxTableTableManager(_$AppDatabase db, $ReviewOutboxTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientReviewId = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<bool?> answerCorrect = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<DateTime> reviewedAt = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewOutboxCompanion(
                clientReviewId: clientReviewId,
                cardId: cardId,
                direction: direction,
                mode: mode,
                rating: rating,
                answerCorrect: answerCorrect,
                durationMs: durationMs,
                reviewedAt: reviewedAt,
                sessionId: sessionId,
                attempts: attempts,
                lastAttemptAt: lastAttemptAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientReviewId,
                required String cardId,
                required String direction,
                required String mode,
                required int rating,
                Value<bool?> answerCorrect = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                required DateTime reviewedAt,
                Value<String?> sessionId = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewOutboxCompanion.insert(
                clientReviewId: clientReviewId,
                cardId: cardId,
                direction: direction,
                mode: mode,
                rating: rating,
                answerCorrect: answerCorrect,
                durationMs: durationMs,
                reviewedAt: reviewedAt,
                sessionId: sessionId,
                attempts: attempts,
                lastAttemptAt: lastAttemptAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReviewOutboxTable, ReviewOutboxData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ReviewOutboxTable,
                    ReviewOutboxData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReviewOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewOutboxTable,
      ReviewOutboxData,
      $$ReviewOutboxTableFilterComposer,
      $$ReviewOutboxTableOrderingComposer,
      $$ReviewOutboxTableAnnotationComposer,
      $$ReviewOutboxTableCreateCompanionBuilder,
      $$ReviewOutboxTableUpdateCompanionBuilder,
      (
        ReviewOutboxData,
        BaseReferences<_$AppDatabase, $ReviewOutboxTable, ReviewOutboxData>,
      ),
      ReviewOutboxData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SetsTableTableManager get sets => $$SetsTableTableManager(_db, _db.sets);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$CardStatesTableTableManager get cardStates =>
      $$CardStatesTableTableManager(_db, _db.cardStates);
  $$SyncMetaTableTableManager get syncMeta =>
      $$SyncMetaTableTableManager(_db, _db.syncMeta);
  $$ReviewOutboxTableTableManager get reviewOutbox =>
      $$ReviewOutboxTableTableManager(_db, _db.reviewOutbox);
}
