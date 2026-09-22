import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/auth_interceptor.dart';
import '../features/auth/auth_provider.dart';

/// Базовый URL API. Для эмулятора: http://10.0.2.2:8000 (локально),
/// https://test.edu-remora.ru (дев-сервер).
const baseUrl = 'https://test.edu-remora.ru';

/// Настроенный Dio с auth-интерсептором.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
  ));

  dio.interceptors.add(AuthInterceptor(
    accessToken: () => ref.read(authProvider).accessToken,
    onAccessToken: (token) async {
      ref.read(authProvider.notifier).setAccessToken(token);
    },
    onLogout: () async {
      ref.read(authProvider.notifier).logout();
    },
  ));

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
      data: {
        'email': email,
        'password': password,
        'username': username,
      },
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
    String mode = 'flashcards',
  }) async {
    final response = await _dio.get(
      '/api/v1/study/queue',
      queryParameters: {'set_id': setId, 'mode': mode},
    );
    return StudyQueue.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ReviewBatchResult> submitReviews(ReviewBatch batch) async {
    final response = await _dio.post(
      '/api/v1/study/reviews',
      data: batch.toJson(),
    );
    return ReviewBatchResult.fromJson(response.data as Map<String, dynamic>);
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
      altAnswers: (json['alt_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      wrongTermAnswers: (json['wrong_term_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      wrongDefinitionAnswers: (json['wrong_definition_answers'] as List?)
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
    required this.term,
    required this.definition,
    this.hint,
    this.termImageUrl,
    this.definitionImageUrl,
    this.altAnswers = const [],
  });

  factory QueueCard.fromJson(Map<String, dynamic> json) {
    return QueueCard(
      id: json['id'] as String,
      term: json['term'] as String,
      definition: json['definition'] as String,
      hint: json['hint'] as String?,
      termImageUrl: json['term_image_url'] as String?,
      definitionImageUrl: json['definition_image_url'] as String?,
      altAnswers: (json['alt_answers'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  final String id;
  final String term;
  final String definition;
  final String? hint;
  final String? termImageUrl;
  final String? definitionImageUrl;
  final List<String> altAnswers;
}

class CardStateData {
  CardStateData({
    required this.state,
    this.stability,
    this.difficulty,
    this.step,
    required this.dueAt,
    this.lastReviewedAt,
  });

  factory CardStateData.fromJson(Map<String, dynamic> json) {
    return CardStateData(
      state: json['state'] as String,
      stability: (json['stability'] as num?)?.toDouble(),
      difficulty: (json['difficulty'] as num?)?.toDouble(),
      step: json['step'] as int?,
      dueAt: DateTime.parse(json['due_at'] as String),
      lastReviewedAt: json['last_reviewed_at'] == null
          ? null
          : DateTime.parse(json['last_reviewed_at'] as String),
    );
  }

  final String state;
  final double? stability;
  final double? difficulty;
  final int? step;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
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
