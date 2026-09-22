// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AccountExportPublic.serializer)
      ..add(AccountExportStatus.serializer)
      ..add(AgentArticleDetail.serializer)
      ..add(AgentArticleWrite.serializer)
      ..add(AgentCourseDetail.serializer)
      ..add(AgentCourseUpdate.serializer)
      ..add(AgentCourseWrite.serializer)
      ..add(AgentSectionDetail.serializer)
      ..add(AgentSectionWrite.serializer)
      ..add(AgentSetDetail.serializer)
      ..add(AgentSetUpdate.serializer)
      ..add(AgentSetWrite.serializer)
      ..add(AgentStructureDelete.serializer)
      ..add(AgentStructureDeleteConfirmEnum.serializer)
      ..add(AnkiImportResult.serializer)
      ..add(AnswerVerdict.serializer)
      ..add(ApiTokenCreate.serializer)
      ..add(ApiTokenCreateScopesEnum.serializer)
      ..add(ApiTokenCreated.serializer)
      ..add(ApiTokenPublic.serializer)
      ..add(ArticleMediaRef.serializer)
      ..add(ArticleWrite.serializer)
      ..add(AuthorProfile.serializer)
      ..add(AuthorStats.serializer)
      ..add(BotCodeCreated.serializer)
      ..add(BotCodeRequest.serializer)
      ..add(BotLinkPublic.serializer)
      ..add(BotPlatform.serializer)
      ..add(CardBatch.serializer)
      ..add(CardPublic.serializer)
      ..add(CardStateKind.serializer)
      ..add(CardStateOut.serializer)
      ..add(CardWrite.serializer)
      ..add(ContentType.serializer)
      ..add(CourseArticlePublic.serializer)
      ..add(CourseAuthor.serializer)
      ..add(CourseCopyRequest.serializer)
      ..add(CourseCreate.serializer)
      ..add(CourseDetail.serializer)
      ..add(CourseEditorDetail.serializer)
      ..add(CourseMetadata.serializer)
      ..add(CoursePublication.serializer)
      ..add(CourseSearchItem.serializer)
      ..add(CourseSearchResult.serializer)
      ..add(CourseSectionPublic.serializer)
      ..add(CourseSitemapEntry.serializer)
      ..add(CourseStructureWrite.serializer)
      ..add(CourseSummary.serializer)
      ..add(DirectionMode.serializer)
      ..add(FolderCreate.serializer)
      ..add(FolderPublic.serializer)
      ..add(FolderUpdate.serializer)
      ..add(ForecastDay.serializer)
      ..add(HTTPValidationError.serializer)
      ..add(HealthResponse.serializer)
      ..add(HealthResponseStatusEnum.serializer)
      ..add(ImageUploadRequest.serializer)
      ..add(ImageUploadTicket.serializer)
      ..add(ImportErrorItem.serializer)
      ..add(ImportJobPublic.serializer)
      ..add(ImportJobStatus.serializer)
      ..add(LearnQuestionType.serializer)
      ..add(LearnTypingCheck.serializer)
      ..add(LibraryDiff.serializer)
      ..add(LibraryItem.serializer)
      ..add(LibraryItemTargetTypeEnum.serializer)
      ..add(LibrarySaveCreate.serializer)
      ..add(LibrarySaveCreateTargetTypeEnum.serializer)
      ..add(LibraryState.serializer)
      ..add(LocationInner.serializer)
      ..add(LoginRequest.serializer)
      ..add(MediaAssetPublic.serializer)
      ..add(MediaStatus.serializer)
      ..add(PasswordChangeRequest.serializer)
      ..add(PasswordResetConfirmRequest.serializer)
      ..add(PasswordResetRequest.serializer)
      ..add(ProblemCard.serializer)
      ..add(ProfileUpdateRequest.serializer)
      ..add(PublicCard.serializer)
      ..add(PublicSet.serializer)
      ..add(PublicSetAuthor.serializer)
      ..add(QueueCard.serializer)
      ..add(QueueItem.serializer)
      ..add(QueueScope.serializer)
      ..add(RatingPreviewOut.serializer)
      ..add(ReadinessResponse.serializer)
      ..add(ReadinessResponseStatusEnum.serializer)
      ..add(RefreshRequest.serializer)
      ..add(RefreshResponse.serializer)
      ..add(RegisterRequest.serializer)
      ..add(ReportCreate.serializer)
      ..add(ReportItem.serializer)
      ..add(ReportReason.serializer)
      ..add(ReportResolution.serializer)
      ..add(ReportResolutionOutcomeEnum.serializer)
      ..add(ReportStatus.serializer)
      ..add(ReportSubmitted.serializer)
      ..add(ReviewBatch.serializer)
      ..add(ReviewBatchResult.serializer)
      ..add(ReviewIn.serializer)
      ..add(SectionWrite.serializer)
      ..add(SessionCreate.serializer)
      ..add(SessionOut.serializer)
      ..add(SessionPublic.serializer)
      ..add(SessionStatus.serializer)
      ..add(SetCreate.serializer)
      ..add(SetDetail.serializer)
      ..add(SetLearnSettingsOut.serializer)
      ..add(SetLearnSettingsUpdate.serializer)
      ..add(SetStats.serializer)
      ..add(SetSummary.serializer)
      ..add(SetUpdate.serializer)
      ..add(SetVisibility.serializer)
      ..add(SpeakRequest.serializer)
      ..add(SpeakResponse.serializer)
      ..add(StateDistribution.serializer)
      ..add(Strictness.serializer)
      ..add(StudyDirection.serializer)
      ..add(StudyMode.serializer)
      ..add(StudyQueue.serializer)
      ..add(StudySettingsOut.serializer)
      ..add(StudySettingsUpdate.serializer)
      ..add(TestAnswerIn.serializer)
      ..add(TestAttemptOut.serializer)
      ..add(TestConfig.serializer)
      ..add(TestQuestionKind.serializer)
      ..add(TestQuestionOut.serializer)
      ..add(TestQuestionReview.serializer)
      ..add(TestResult.serializer)
      ..add(TestSource.serializer)
      ..add(TestSubmit.serializer)
      ..add(TokenResponse.serializer)
      ..add(TtsStatus.serializer)
      ..add(UserPublic.serializer)
      ..add(ValidationError.serializer)
      ..add(VerifyEmailRequest.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AgentArticleDetail)]),
          () => ListBuilder<AgentArticleDetail>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AgentArticleWrite)]),
          () => ListBuilder<AgentArticleWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AgentSectionDetail)]),
          () => ListBuilder<AgentSectionDetail>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AgentSectionWrite)]),
          () => ListBuilder<AgentSectionWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AgentSectionWrite)]),
          () => ListBuilder<AgentSectionWrite>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ApiTokenCreateScopesEnum)]),
          () => ListBuilder<ApiTokenCreateScopesEnum>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ArticleMediaRef)]),
          () => ListBuilder<ArticleMediaRef>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ArticleWrite)]),
          () => ListBuilder<ArticleWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardPublic)]),
          () => ListBuilder<CardPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardPublic)]),
          () => ListBuilder<CardPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardWrite)]),
          () => ListBuilder<CardWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardWrite)]),
          () => ListBuilder<CardWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardWrite)]),
          () => ListBuilder<CardWrite>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CourseArticlePublic)]),
          () => ListBuilder<CourseArticlePublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CourseSearchItem)]),
          () => ListBuilder<CourseSearchItem>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CourseSectionPublic)]),
          () => ListBuilder<CourseSectionPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CourseSectionPublic)]),
          () => ListBuilder<CourseSectionPublic>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ForecastDay)]),
          () => ListBuilder<ForecastDay>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProblemCard)]),
          () => ListBuilder<ProblemCard>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ImportErrorItem)]),
          () => ListBuilder<ImportErrorItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ImportErrorItem)]),
          () => ListBuilder<ImportErrorItem>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LearnQuestionType)]),
          () => ListBuilder<LearnQuestionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LearnQuestionType)]),
          () => ListBuilder<LearnQuestionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LearnQuestionType)]),
          () => ListBuilder<LearnQuestionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LearnQuestionType)]),
          () => ListBuilder<LearnQuestionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LocationInner)]),
          () => ListBuilder<LocationInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PublicCard)]),
          () => ListBuilder<PublicCard>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(QueueItem)]),
          () => ListBuilder<QueueItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(LearnQuestionType)]),
          () => ListBuilder<LearnQuestionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(RatingPreviewOut)]),
          () => ListBuilder<RatingPreviewOut>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ReviewIn)]),
          () => ListBuilder<ReviewIn>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SectionWrite)]),
          () => ListBuilder<SectionWrite>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CourseSearchItem)]),
          () => ListBuilder<CourseSearchItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CardStateOut)]),
          () => ListBuilder<CardStateOut>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TestAnswerIn)]),
          () => ListBuilder<TestAnswerIn>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TestQuestionKind)]),
          () => ListBuilder<TestQuestionKind>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TestQuestionOut)]),
          () => ListBuilder<TestQuestionOut>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TestQuestionReview)]),
          () => ListBuilder<TestQuestionReview>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ValidationError)]),
          () => ListBuilder<ValidationError>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
