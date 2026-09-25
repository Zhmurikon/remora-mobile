import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../../data/db/database_provider.dart';
import '../../data/repositories/course_repository.dart';

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return CourseRepository(
    ref.watch(databaseProvider),
    ref.watch(apiClientProvider),
  );
});

// ── Список моих курсов ──

class CoursesListState {
  CoursesListState({
    required this.courses,
    required this.isLoading,
    required this.isOnline,
    this.error,
  });

  final List<CourseRecord> courses;
  final bool isLoading;
  final bool isOnline;
  final String? error;

  CoursesListState copyWith({
    List<CourseRecord>? courses,
    bool? isLoading,
    bool? isOnline,
    String? error,
  }) {
    return CoursesListState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      isOnline: isOnline ?? this.isOnline,
      error: error,
    );
  }
}

/// Список моих курсов: сперва локальные, затем онлайн-синхронизация.
class CoursesListNotifier extends StateNotifier<CoursesListState> {
  CoursesListNotifier(this._repo)
    : super(CoursesListState(courses: [], isLoading: true, isOnline: true)) {
    _init();
  }

  final CourseRepository _repo;

  Future<void> _init() async {
    final local = await _repo.getDownloadedCourses();
    state = state.copyWith(courses: local, isLoading: false);
    await refresh();
  }

  Future<void> refresh() async {
    try {
      final courses = await _repo.syncMyCourses();
      state = state.copyWith(courses: courses, isOnline: true, error: null);
    } catch (_) {
      // Офлайн — остаёмся на локальных данных без ошибки.
      state = state.copyWith(isOnline: false);
    }
  }
}

final coursesListProvider =
    StateNotifierProvider<CoursesListNotifier, CoursesListState>((ref) {
      return CoursesListNotifier(ref.watch(courseRepositoryProvider));
    });

// ── Один курс: структура и теория ──

class CourseViewState {
  CourseViewState({
    this.course,
    required this.sections,
    required this.articles,
    required this.isLoading,
    required this.isOnline,
    this.error,
  });

  final CourseRecord? course;
  final List<CourseSectionRow> sections;
  final List<CourseArticleRow> articles;
  final bool isLoading;
  final bool isOnline;
  final String? error;

  /// Статьи раздела по порядку.
  List<CourseArticleRow> articlesOf(String sectionId) =>
      articles.where((a) => a.sectionId == sectionId).toList();

  bool get isEmpty => sections.isEmpty && !isLoading;

  CourseViewState copyWith({
    CourseRecord? course,
    List<CourseSectionRow>? sections,
    List<CourseArticleRow>? articles,
    bool? isLoading,
    bool? isOnline,
    String? error,
  }) {
    return CourseViewState(
      course: course ?? this.course,
      sections: sections ?? this.sections,
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      isOnline: isOnline ?? this.isOnline,
      error: error,
    );
  }
}

/// Структура курса: локально сразу, затем скачивание с сервера в фоне.
class CourseViewNotifier extends StateNotifier<CourseViewState> {
  CourseViewNotifier(this._repo, this._courseId)
    : super(
        CourseViewState(
          sections: const [],
          articles: const [],
          isLoading: true,
          isOnline: true,
        ),
      ) {
    _init();
  }

  final CourseRepository _repo;
  final String _courseId;

  Future<void> _init() async {
    await _loadLocal();
    await refresh();
  }

  Future<void> _loadLocal() async {
    final course = await _repo.getCourse(_courseId);
    final sections = await _repo.getSections(_courseId);
    final articles = await _repo.getArticles(_courseId);
    state = state.copyWith(
      course: course,
      sections: sections,
      articles: articles,
      isLoading: false,
    );
  }

  /// Скачать курс заново с сервера (структура + теория) и перечитать из БД.
  Future<void> refresh() async {
    try {
      await _repo.downloadCourse(_courseId);
      await _loadLocal();
      state = state.copyWith(isOnline: true, error: null);
    } catch (_) {
      // Офлайн: если структуры вообще нет локально — сообщаем, иначе молчим.
      state = state.copyWith(
        isOnline: false,
        error: state.sections.isEmpty
            ? 'Курс не скачан. Подключитесь к сети, чтобы загрузить теорию.'
            : null,
      );
    }
  }
}

final courseViewProvider = StateNotifierProvider.autoDispose
    .family<CourseViewNotifier, CourseViewState, String>((ref, courseId) {
      return CourseViewNotifier(ref.watch(courseRepositoryProvider), courseId);
    });
