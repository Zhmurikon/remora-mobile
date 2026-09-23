import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/auth_interceptor.dart';
import '../features/auth/auth_provider.dart';
import 'circuit_breaker_interceptor.dart';
import 'logging_interceptor.dart';

/// Базовый URL API. Для эмулятора: http://10.0.2.2:8000 (локально),
/// https://test.edu-remora.ru (дев-сервер).
const baseUrl = 'https://test.edu-remora.ru';

/// Настроенный Dio с auth-интерсептором.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Первым — лог запросов: засекает старт и пишет итог с длительностью.
  dio.interceptors.add(LoggingInterceptor());

  // Предохранитель: при открытом — мгновенный офлайн вместо ожидания таймаута.
  dio.interceptors.add(CircuitBreakerInterceptor(ref));

  dio.interceptors.add(
    AuthInterceptor(
      accessToken: () => ref.read(authProvider).accessToken,
      onAccessToken: (token) async {
        ref.read(authProvider.notifier).setAccessToken(token);
      },
      onLogout: () async {
        ref.read(authProvider.notifier).logout();
      },
    ),
  );

  return dio;
});

/// API-клиент, использующий настроенный Dio.
final apiClientProvider = Provider<RemoraApiClient>((ref) {
  return RemoraApiClient(ref.read(dioProvider));
});

/// API-клиент для Remora. Auth + библиотека + обучение.
class RemoraApiClient {
  RemoraApiClient(this._dio);

  final Dio _dio;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/api/v1/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    await _dio.post(
      '/api/v1/auth/register',
      data: {'email': email, 'password': password, 'username': username},
    );
  }

  Future<RefreshResponse> refresh({required String refreshToken}) async {
    final response = await _dio.post(
      '/api/v1/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return RefreshResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserProfile> getMe() async {
    final response = await _dio.get('/api/v1/auth/me');
    return UserProfile.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> logout({String? refreshToken}) async {
    await _dio.post(
      '/api/v1/auth/logout',
      data: refreshToken != null ? {'refresh_token': refreshToken} : null,
    );
  }

  // --- Библиотека и наборы ---

  Future<List<SetSummary>> getMySets() async {
    final response = await _dio.get('/api/v1/sets');
    return (response.data as List)
        .map((e) => SetSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<SetDetail> getSetDetail(String setId) async {
    final response = await _dio.get('/api/v1/sets/$setId');
    return SetDetail.fromJson(response.data as Map<String, dynamic>);
  }

  // --- Обучение ---

  Future<StudyQueue> getStudyQueue({
    required String setId,
    String mode = 'learn',
    String scope = 'due',
    String direction = 'term_to_def',
    int limit = 60,
  }) async {
    final response = await _dio.get(
      '/api/v1/study/sets/$setId/queue',
      queryParameters: {
        'mode': mode,
        'scope': scope,
        'direction': direction,
        'limit': limit,
      },
    );
    return StudyQueue.fromJson(response.data as Map<String, dynamic>);
  }

  /// Настройки заучивания для набора: свои, если переопределены, иначе общие.
  Future<SetLearnSettings> getSetLearnSettings(String setId) async {
    final response =
        await _dio.get('/api/v1/study/sets/$setId/learn-settings');
    return SetLearnSettings.fromJson(response.data as Map<String, dynamic>);
  }

  /// Переопределить настройки заучивания для конкретного набора.
  Future<SetLearnSettings> updateSetLearnSettings(
    String setId,
    SetLearnSettingsInput input,
  ) async {
    final response = await _dio.put(
      '/api/v1/study/sets/$setId/learn-settings',
      data: input.toJson(),
    );
    return SetLearnSettings.fromJson(response.data as Map<String, dynamic>);
  }

  /// Вернуться к общим настройкам заучивания для набора.
  Future<void> resetSetLearnSettings(String setId) async {
    await _dio.delete('/api/v1/study/sets/$setId/learn-settings');
  }

  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async {
    final response = await _dio.post(
      '/api/v1/study/reviews',
      data: batch.toJson(),
    );
    return ReviewBatchResult.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SetStats> getSetStats(String setId) async {
    final response = await _dio.get('/api/v1/study/sets/$setId/stats');
    return SetStats.fromJson(response.data as Map<String, dynamic>);
  }

  // --- Тесты ---

  Future<TestAttemptOut> createTest({
    required String setId,
    required TestConfig config,
  }) async {
    final response = await _dio.post(
      '/api/v1/study/sets/$setId/tests',
      data: config.toJson(),
    );
    return TestAttemptOut.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TestAttemptOut> getTest(String attemptId) async {
    final response = await _dio.get('/api/v1/study/tests/$attemptId');
    return TestAttemptOut.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TestResult> submitTest({
    required String attemptId,
    required List<TestAnswerIn> answers,
  }) async {
    final response = await _dio.post(
      '/api/v1/study/tests/$attemptId/submit',
      data: {'answers': answers.map((a) => a.toJson()).toList()},
    );
    return TestResult.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TestResult> getTestResult(String attemptId) async {
    final response = await _dio.get('/api/v1/study/tests/$attemptId/result');
    return TestResult.fromJson(response.data as Map<String, dynamic>);
  }

  Future<TestAttemptOut> retakeTest(String attemptId) async {
    final response = await _dio.post('/api/v1/study/tests/$attemptId/retake');
    return TestAttemptOut.fromJson(response.data as Map<String, dynamic>);
  }

  // --- Курсы (чтение теории) ---

  /// Мои курсы (без структуры) — список для экрана курсов.
  Future<List<CourseSummaryData>> getMyCourses() async {
    final response = await _dio.get('/api/v1/courses');
    return (response.data as List)
        .map((e) => CourseSummaryData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Полная структура курса: разделы, статьи с телом теории и медиа-ссылками.
  Future<CourseDetailData> getCourseDetail(String courseId) async {
    final response = await _dio.get('/api/v1/courses/$courseId');
    return CourseDetailData.fromJson(response.data as Map<String, dynamic>);
  }
}

class AuthResponse {
  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String accessToken;
  final String? refreshToken;
  final UserProfile user;
}

class RefreshResponse {
  RefreshResponse({required this.accessToken, required this.refreshToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return RefreshResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
    );
  }

  final String accessToken;
  final String? refreshToken;
}

class UserProfile {
  UserProfile({
    required this.id,
    required this.email,
    required this.username,
    this.displayName,
    this.avatarUrl,
    required this.role,
    required this.emailVerified,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String,
      emailVerified: json['email_verified'] as bool,
    );
  }

  final String id;
  final String? email;
  final String username;
  final String? displayName;
  final String? avatarUrl;
  final String role;
  final bool emailVerified;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'username': username,
        'display_name': displayName,
        'avatar_url': avatarUrl,
        'role': role,
        'email_verified': emailVerified,
      };
}

// --- Модели библиотеки и обучения ---

class SetSummary {
  SetSummary({
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    required this.slug,
    required this.cardsCount,
    this.folderId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SetSummary.fromJson(Map<String, dynamic> json) {
    return SetSummary(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      visibility: json['visibility'] as String,
      slug: json['slug'] as String,
      cardsCount: json['cards_count'] as int,
      folderId: json['folder_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  final String id;
  final String title;
  final String description;
  final String visibility;
  final String slug;
  final int cardsCount;
  final String? folderId;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class SetDetail extends SetSummary {
  SetDetail({
    required super.id,
    required super.title,
    required super.description,
    required super.visibility,
    required super.slug,
    required super.cardsCount,
    super.folderId,
    required super.createdAt,
    required super.updatedAt,
    required this.langTerm,
    required this.langDefinition,
    required this.cards,
  });

  factory SetDetail.fromJson(Map<String, dynamic> json) {
    return SetDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      visibility: json['visibility'] as String,
      slug: json['slug'] as String,
      cardsCount: json['cards_count'] as int,
      folderId: json['folder_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      langTerm: json['lang_term'] as String,
      langDefinition: json['lang_definition'] as String,
      cards: (json['cards'] as List)
          .map((e) => CardData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final String langTerm;
  final String langDefinition;
  final List<CardData> cards;
}

class CardData {
  CardData({
    required this.id,
    required this.position,
    required this.term,
    required this.definition,
    this.termTranscription,
    this.definitionTranscription,
    this.hint,
    required this.contentType,
    this.codeLanguage,
    this.altAnswers = const [],
    this.wrongTermAnswers = const [],
    this.wrongDefinitionAnswers = const [],
    this.termImageUrl,
    this.definitionImageUrl,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'] as String,
      position: json['position'] as int,
      term: json['term'] as String,
      definition: json['definition'] as String,
      termTranscription: json['term_transcription'] as String?,
      definitionTranscription: json['definition_transcription'] as String?,
      hint: json['hint'] as String?,
      contentType: json['content_type'] as String? ?? 'text',
      codeLanguage: json['code_language'] as String?,
      altAnswers:
          (json['alt_answers'] as List?)?.map((e) => e as String).toList() ??
          [],
      wrongTermAnswers:
          (json['wrong_term_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      wrongDefinitionAnswers:
          (json['wrong_definition_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      termImageUrl: json['term_image_url'] as String?,
      definitionImageUrl: json['definition_image_url'] as String?,
    );
  }

  final String id;
  final int position;
  final String term;
  final String definition;
  final String? termTranscription;
  final String? definitionTranscription;
  final String? hint;
  final String contentType;
  final String? codeLanguage;
  final List<String> altAnswers;
  final List<String> wrongTermAnswers;
  final List<String> wrongDefinitionAnswers;
  final String? termImageUrl;
  final String? definitionImageUrl;
}

class StudyQueue {
  StudyQueue({
    required this.setId,
    required this.setTitle,
    required this.langTerm,
    required this.langDefinition,
    required this.answerStrictness,
    this.learnQuestionTypes = const ['choice', 'typing', 'recall'],
    this.learnSuccessesRequired = 1,
    this.learnTypingCheck = 'automatic',
    this.learnMatchPercent = 90,
    required this.mode,
    required this.schedulerVersion,
    required this.items,
    required this.dueTotal,
    required this.newTotal,
    required this.newLeftToday,
    required this.reviewsLeftToday,
  });

  factory StudyQueue.fromJson(Map<String, dynamic> json) {
    return StudyQueue(
      setId: json['set_id'] as String,
      setTitle: json['set_title'] as String,
      langTerm: json['lang_term'] as String,
      langDefinition: json['lang_definition'] as String,
      answerStrictness: json['answer_strictness'] as String,
      learnQuestionTypes:
          (json['learn_question_types'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          ['choice', 'typing', 'recall'],
      learnSuccessesRequired: json['learn_successes_required'] as int? ?? 1,
      learnTypingCheck: json['learn_typing_check'] as String? ?? 'automatic',
      learnMatchPercent: json['learn_match_percent'] as int? ?? 90,
      mode: json['mode'] as String,
      schedulerVersion: json['scheduler_version'] as String,
      items: (json['items'] as List)
          .map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dueTotal: json['due_total'] as int,
      newTotal: json['new_total'] as int,
      newLeftToday: json['new_left_today'] as int,
      reviewsLeftToday: json['reviews_left_today'] as int,
    );
  }

  final String setId;
  final String setTitle;
  final String langTerm;
  final String langDefinition;
  final String answerStrictness;
  final List<String> learnQuestionTypes;
  final int learnSuccessesRequired;
  final String learnTypingCheck;
  final int learnMatchPercent;
  final String mode;
  final String schedulerVersion;
  final List<QueueItem> items;
  final int dueTotal;
  final int newTotal;
  final int newLeftToday;
  final int reviewsLeftToday;
}

class QueueItem {
  QueueItem({
    required this.card,
    required this.direction,
    required this.state,
    required this.previews,
  });

  factory QueueItem.fromJson(Map<String, dynamic> json) {
    return QueueItem(
      card: QueueCard.fromJson(json['card'] as Map<String, dynamic>),
      direction: json['direction'] as String,
      state: CardStateData.fromJson(json['state'] as Map<String, dynamic>),
      previews: (json['previews'] as List)
          .map((e) => RatingPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final QueueCard card;
  final String direction;
  final CardStateData state;
  final List<RatingPreview> previews;
}

class QueueCard {
  QueueCard({
    required this.id,
    required this.position,
    required this.term,
    required this.definition,
    this.termTranscription,
    this.definitionTranscription,
    this.hint,
    this.contentType = 'text',
    this.codeLanguage,
    this.termImageUrl,
    this.definitionImageUrl,
    this.altAnswers = const [],
    this.wrongTermAnswers = const [],
    this.wrongDefinitionAnswers = const [],
  });

  factory QueueCard.fromJson(Map<String, dynamic> json) {
    return QueueCard(
      id: json['id'] as String,
      position: json['position'] as int? ?? 0,
      term: json['term'] as String,
      definition: json['definition'] as String,
      termTranscription: json['term_transcription'] as String?,
      definitionTranscription: json['definition_transcription'] as String?,
      hint: json['hint'] as String?,
      contentType: json['content_type'] as String? ?? 'text',
      codeLanguage: json['code_language'] as String?,
      termImageUrl: json['term_image_url'] as String?,
      definitionImageUrl: json['definition_image_url'] as String?,
      altAnswers:
          (json['alt_answers'] as List?)?.map((e) => e as String).toList() ??
          [],
      wrongTermAnswers:
          (json['wrong_term_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      wrongDefinitionAnswers:
          (json['wrong_definition_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  final String id;
  final int position;
  final String term;
  final String definition;
  final String? termTranscription;
  final String? definitionTranscription;
  final String? hint;
  final String contentType;
  final String? codeLanguage;
  final String? termImageUrl;
  final String? definitionImageUrl;
  final List<String> altAnswers;
  final List<String> wrongTermAnswers;
  final List<String> wrongDefinitionAnswers;
}

class CardStateData {
  CardStateData({
    required this.cardId,
    required this.direction,
    required this.state,
    this.stability,
    this.difficulty,
    required this.dueAt,
    this.lastReviewedAt,
    this.reps = 0,
    this.lapses = 0,
    this.suspendedAt,
  });

  factory CardStateData.fromJson(Map<String, dynamic> json) {
    return CardStateData(
      cardId: json['card_id'] as String,
      direction: json['direction'] as String,
      state: json['state'] as String,
      stability: (json['stability'] as num?)?.toDouble(),
      difficulty: (json['difficulty'] as num?)?.toDouble(),
      dueAt: DateTime.parse(json['due_at'] as String),
      lastReviewedAt: json['last_reviewed_at'] == null
          ? null
          : DateTime.parse(json['last_reviewed_at'] as String),
      reps: json['reps'] as int? ?? 0,
      lapses: json['lapses'] as int? ?? 0,
      suspendedAt: json['suspended_at'] == null
          ? null
          : DateTime.parse(json['suspended_at'] as String),
    );
  }

  final String cardId;
  final String direction;
  final String state;
  final double? stability;
  final double? difficulty;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
  final int reps;
  final int lapses;
  final DateTime? suspendedAt;
}

class RatingPreview {
  RatingPreview({required this.rating, required this.intervalSeconds});

  factory RatingPreview.fromJson(Map<String, dynamic> json) {
    return RatingPreview(
      rating: json['rating'] as int,
      intervalSeconds: json['interval_seconds'] as int,
    );
  }

  final int rating;
  final int intervalSeconds;
}

/// Настройки заучивания, действующие для набора: свои или унаследованные общие.
class SetLearnSettings {
  SetLearnSettings({
    required this.questionTypes,
    required this.successesRequired,
    required this.typingCheck,
    required this.matchPercent,
    required this.customized,
  });

  factory SetLearnSettings.fromJson(Map<String, dynamic> json) {
    return SetLearnSettings(
      questionTypes: (json['question_types'] as List)
          .map((e) => e as String)
          .toList(),
      successesRequired: json['successes_required'] as int,
      typingCheck: json['typing_check'] as String,
      matchPercent: json['match_percent'] as int,
      customized: json['customized'] as bool,
    );
  }

  final List<String> questionTypes;
  final int successesRequired;
  final String typingCheck;
  final int matchPercent;
  final bool customized;
}

/// Тело запроса на переопределение настроек заучивания для набора.
class SetLearnSettingsInput {
  const SetLearnSettingsInput({
    required this.questionTypes,
    required this.successesRequired,
    required this.typingCheck,
    required this.matchPercent,
  });

  final List<String> questionTypes;
  final int successesRequired;
  final String typingCheck;
  final int matchPercent;

  Map<String, dynamic> toJson() => {
        'question_types': questionTypes,
        'successes_required': successesRequired,
        'typing_check': typingCheck,
        'match_percent': matchPercent,
      };
}

class ReviewIn {
  ReviewIn({
    required this.clientReviewId,
    required this.cardId,
    required this.direction,
    required this.mode,
    required this.rating,
    this.answerCorrect,
    this.durationMs,
    required this.reviewedAt,
  });

  Map<String, dynamic> toJson() => {
    'client_review_id': clientReviewId,
    'card_id': cardId,
    'direction': direction,
    'mode': mode,
    'rating': rating,
    'answer_correct': answerCorrect,
    'duration_ms': durationMs,
    'reviewed_at': reviewedAt.toUtc().toIso8601String(),
  };

  final String clientReviewId;
  final String cardId;
  final String direction;
  final String mode;
  final int rating;
  final bool? answerCorrect;
  final int? durationMs;
  final DateTime reviewedAt;
}

class ReviewBatch {
  ReviewBatch({this.sessionId, required this.reviews});

  Map<String, dynamic> toJson() => {
    'session_id': sessionId,
    'reviews': reviews.map((r) => r.toJson()).toList(),
  };

  final String? sessionId;
  final List<ReviewIn> reviews;
}

class ReviewBatchResult {
  ReviewBatchResult({
    required this.accepted,
    required this.duplicates,
    required this.rejected,
    required this.states,
  });

  factory ReviewBatchResult.fromJson(Map<String, dynamic> json) {
    return ReviewBatchResult(
      accepted: (json['accepted'] as List).map((e) => e as String).toList(),
      duplicates: (json['duplicates'] as List).map((e) => e as String).toList(),
      rejected: (json['rejected'] as List).map((e) => e as String).toList(),
      states: (json['states'] as List)
          .map((e) => CardStateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<String> accepted;
  final List<String> duplicates;
  final List<String> rejected;
  final List<CardStateData> states;
}

// --- Статистика набора ---

class SetStats {
  SetStats({
    required this.setId,
    required this.cardsTotal,
    required this.masteredCount,
    required this.learningCount,
    required this.notStartedCount,
    required this.masteryPercent,
    required this.dueNow,
    this.lastStudiedAt,
    required this.distribution,
    required this.problemCards,
    required this.forecast,
  });

  factory SetStats.fromJson(Map<String, dynamic> json) {
    return SetStats(
      setId: json['set_id'] as String,
      cardsTotal: json['cards_total'] as int,
      masteredCount: json['mastered_count'] as int,
      learningCount: json['learning_count'] as int,
      notStartedCount: json['not_started_count'] as int,
      masteryPercent: (json['mastery_percent'] as num).toDouble(),
      dueNow: json['due_now'] as int,
      lastStudiedAt: json['last_studied_at'] == null
          ? null
          : DateTime.parse(json['last_studied_at'] as String),
      distribution: StateDistribution.fromJson(
        json['distribution'] as Map<String, dynamic>,
      ),
      problemCards: (json['problem_cards'] as List)
          .map((e) => ProblemCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      forecast: (json['forecast'] as List)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final String setId;
  final int cardsTotal;
  final int masteredCount;
  final int learningCount;
  final int notStartedCount;
  final double masteryPercent;
  final int dueNow;
  final DateTime? lastStudiedAt;
  final StateDistribution distribution;
  final List<ProblemCard> problemCards;
  final List<ForecastDay> forecast;
}

class StateDistribution {
  StateDistribution({
    this.newCount = 0,
    this.learning = 0,
    this.review = 0,
    this.relearning = 0,
  });

  factory StateDistribution.fromJson(Map<String, dynamic> json) {
    return StateDistribution(
      newCount: json['new'] as int? ?? 0,
      learning: json['learning'] as int? ?? 0,
      review: json['review'] as int? ?? 0,
      relearning: json['relearning'] as int? ?? 0,
    );
  }

  final int newCount;
  final int learning;
  final int review;
  final int relearning;
}

class ProblemCard {
  ProblemCard({
    required this.cardId,
    required this.term,
    required this.definition,
    required this.lapses,
    required this.reps,
    required this.retrievability,
  });

  factory ProblemCard.fromJson(Map<String, dynamic> json) {
    return ProblemCard(
      cardId: json['card_id'] as String,
      term: json['term'] as String,
      definition: json['definition'] as String,
      lapses: json['lapses'] as int,
      reps: json['reps'] as int,
      retrievability: (json['retrievability'] as num).toDouble(),
    );
  }

  final String cardId;
  final String term;
  final String definition;
  final int lapses;
  final int reps;
  final double retrievability;
}

class ForecastDay {
  ForecastDay({required this.date, required this.count});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'] as String,
      count: json['count'] as int,
    );
  }

  final String date;
  final int count;
}

// --- Тесты ---

class TestConfig {
  TestConfig({
    this.questionCount = 20,
    this.kinds = const ['choice', 'true_false', 'typing'],
    this.direction = 'term_to_def',
    this.source = 'all',
    this.writeToSchedule = true,
  });

  factory TestConfig.fromJson(Map<String, dynamic> json) {
    return TestConfig(
      questionCount: json['question_count'] as int? ?? 20,
      kinds:
          (json['kinds'] as List?)?.map((e) => e as String).toList() ??
          const ['choice', 'true_false', 'typing'],
      direction: json['direction'] as String? ?? 'term_to_def',
      source: json['source'] as String? ?? 'all',
      writeToSchedule: json['write_to_schedule'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'question_count': questionCount,
    'kinds': kinds,
    'direction': direction,
    'source': source,
    'write_to_schedule': writeToSchedule,
  };

  final int questionCount;
  final List<String> kinds;
  final String direction;
  final String source;
  final bool writeToSchedule;

  TestConfig copyWith({
    int? questionCount,
    List<String>? kinds,
    String? direction,
    String? source,
    bool? writeToSchedule,
  }) {
    return TestConfig(
      questionCount: questionCount ?? this.questionCount,
      kinds: kinds ?? this.kinds,
      direction: direction ?? this.direction,
      source: source ?? this.source,
      writeToSchedule: writeToSchedule ?? this.writeToSchedule,
    );
  }
}

class TestQuestionOut {
  TestQuestionOut({
    required this.id,
    required this.kind,
    required this.cardId,
    required this.direction,
    required this.prompt,
    required this.contentType,
    this.codeLanguage,
    this.promptImageUrl,
    this.hint,
    this.options = const [],
    this.statement,
    this.pairs = const [],
  });

  factory TestQuestionOut.fromJson(Map<String, dynamic> json) {
    return TestQuestionOut(
      id: json['id'] as String,
      kind: json['kind'] as String,
      cardId: json['card_id'] as String,
      direction: json['direction'] as String,
      prompt: json['prompt'] as String,
      contentType: json['content_type'] as String? ?? 'text',
      codeLanguage: json['code_language'] as String?,
      promptImageUrl: json['prompt_image_url'] as String?,
      hint: json['hint'] as String?,
      options:
          (json['options'] as List?)?.map((e) => e as String).toList() ?? [],
      statement: json['statement'] as String?,
      pairs: (json['pairs'] as List?)?.map((e) => e as String).toList() ?? [],
    );
  }

  final String id;
  final String kind;
  final String cardId;
  final String direction;
  final String prompt;
  final String contentType;
  final String? codeLanguage;
  final String? promptImageUrl;
  final String? hint;
  final List<String> options;
  final String? statement;
  final List<String> pairs;
}

class TestAttemptOut {
  TestAttemptOut({
    required this.id,
    required this.setId,
    required this.setTitle,
    required this.config,
    required this.questions,
    required this.createdAt,
    this.finishedAt,
    this.score,
    required this.correctCount,
    this.retakeOfId,
  });

  factory TestAttemptOut.fromJson(Map<String, dynamic> json) {
    return TestAttemptOut(
      id: json['id'] as String,
      setId: json['set_id'] as String,
      setTitle: json['set_title'] as String,
      config: TestConfig.fromJson(json['config'] as Map<String, dynamic>),
      questions: (json['questions'] as List)
          .map((e) => TestQuestionOut.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
      score: (json['score'] as num?)?.toDouble(),
      correctCount: json['correct_count'] as int,
      retakeOfId: json['retake_of_id'] as String?,
    );
  }

  final String id;
  final String setId;
  final String setTitle;
  final TestConfig config;
  final List<TestQuestionOut> questions;
  final DateTime createdAt;
  final DateTime? finishedAt;
  final double? score;
  final int correctCount;
  final String? retakeOfId;
}

class TestAnswerIn {
  TestAnswerIn({required this.questionId, this.value, this.values = const []});

  Map<String, dynamic> toJson() => {
    'question_id': questionId,
    'value': value,
    'values': values,
  };

  final String questionId;
  final String? value;
  final List<String> values;
}

class TestQuestionReview {
  TestQuestionReview({
    required this.question,
    required this.correct,
    required this.verdict,
    this.given,
    this.givenValues = const [],
    required this.expected,
    this.expectedValues = const [],
  });

  factory TestQuestionReview.fromJson(Map<String, dynamic> json) {
    return TestQuestionReview(
      question: TestQuestionOut.fromJson(
        json['question'] as Map<String, dynamic>,
      ),
      correct: json['correct'] as bool,
      verdict: json['verdict'] as String,
      given: json['given'] as String?,
      givenValues:
          (json['given_values'] as List?)?.map((e) => e as String).toList() ??
          [],
      expected: json['expected'] as String,
      expectedValues:
          (json['expected_values'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  final TestQuestionOut question;
  final bool correct;
  final String verdict;
  final String? given;
  final List<String> givenValues;
  final String expected;
  final List<String> expectedValues;
}

class TestResult {
  TestResult({
    required this.attemptId,
    required this.setId,
    required this.score,
    required this.correctCount,
    required this.total,
    required this.finishedAt,
    required this.review,
    required this.wrongCardIds,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      attemptId: json['attempt_id'] as String,
      setId: json['set_id'] as String,
      score: (json['score'] as num).toDouble(),
      correctCount: json['correct_count'] as int,
      total: json['total'] as int,
      finishedAt: DateTime.parse(json['finished_at'] as String),
      review: (json['review'] as List)
          .map((e) => TestQuestionReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      wrongCardIds: (json['wrong_card_ids'] as List)
          .map((e) => e as String)
          .toList(),
    );
  }

  final String attemptId;
  final String setId;
  final double score;
  final int correctCount;
  final int total;
  final DateTime finishedAt;
  final List<TestQuestionReview> review;
  final List<String> wrongCardIds;
}

// --- Курсы (чтение теории) ---

/// Метаданные курса без структуры. Зеркало серверного CourseSummary.
class CourseSummaryData {
  CourseSummaryData({
    required this.id,
    required this.slug,
    required this.title,
    this.description = '',
    required this.updatedAt,
    this.isPublished = false,
    this.tags = const [],
  });

  factory CourseSummaryData.fromJson(Map<String, dynamic> json) {
    return CourseSummaryData(
      id: json['id'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPublished: json['is_published'] as bool? ?? false,
      tags:
          (json['tags'] as List?)?.map((e) => e as String).toList() ?? const [],
    );
  }

  final String id;
  final String slug;
  final String title;
  final String description;
  final DateTime updatedAt;
  final bool isPublished;
  final List<String> tags;
}

/// Автор курса. Зеркало серверного CourseAuthor.
class CourseAuthorData {
  CourseAuthorData({required this.username, this.displayName, this.avatarUrl});

  factory CourseAuthorData.fromJson(Map<String, dynamic> json) {
    return CourseAuthorData(
      username: json['username'] as String,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  final String username;
  final String? displayName;
  final String? avatarUrl;

  /// Отображаемое имя: display_name, иначе username.
  String get name => (displayName != null && displayName!.trim().isNotEmpty)
      ? displayName!
      : username;
}

/// Подписанная ссылка на изображение теории (протокол media:UUID в теле).
class ArticleMediaRefData {
  ArticleMediaRefData({
    required this.id,
    required this.url,
    this.width,
    this.height,
  });

  factory ArticleMediaRefData.fromJson(Map<String, dynamic> json) {
    return ArticleMediaRefData(
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'width': width,
    'height': height,
  };

  final String id;
  final String url;
  final int? width;
  final int? height;
}

/// Статья теории. Зеркало серверного CourseArticlePublic.
class CourseArticleData {
  CourseArticleData({
    required this.id,
    required this.setId,
    required this.title,
    required this.body,
    required this.position,
    this.media = const [],
  });

  factory CourseArticleData.fromJson(Map<String, dynamic> json) {
    return CourseArticleData(
      id: json['id'] as String,
      setId: json['set_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String? ?? '',
      position: json['position'] as int? ?? 0,
      media:
          (json['media'] as List?)
              ?.map(
                (e) => ArticleMediaRefData.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );
  }

  final String id;
  final String setId;
  final String title;
  final String body;
  final int position;
  final List<ArticleMediaRefData> media;
}

/// Раздел курса. Зеркало серверного CourseSectionPublic.
class CourseSectionData {
  CourseSectionData({
    required this.id,
    required this.title,
    required this.position,
    this.articles = const [],
  });

  factory CourseSectionData.fromJson(Map<String, dynamic> json) {
    return CourseSectionData(
      id: json['id'] as String,
      title: json['title'] as String,
      position: json['position'] as int? ?? 0,
      articles:
          (json['articles'] as List?)
              ?.map(
                (e) => CourseArticleData.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );
  }

  final String id;
  final String title;
  final int position;
  final List<CourseArticleData> articles;
}

/// Полная структура курса. Зеркало серверного CourseDetail.
class CourseDetailData extends CourseSummaryData {
  CourseDetailData({
    required super.id,
    required super.slug,
    required super.title,
    super.description,
    required super.updatedAt,
    super.isPublished,
    super.tags,
    required this.author,
    this.sections = const [],
  });

  factory CourseDetailData.fromJson(Map<String, dynamic> json) {
    return CourseDetailData(
      id: json['id'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPublished: json['is_published'] as bool? ?? false,
      tags:
          (json['tags'] as List?)?.map((e) => e as String).toList() ?? const [],
      author: CourseAuthorData.fromJson(json['author'] as Map<String, dynamic>),
      sections:
          (json['sections'] as List?)
              ?.map(
                (e) => CourseSectionData.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );
  }

  final CourseAuthorData author;
  final List<CourseSectionData> sections;
}
