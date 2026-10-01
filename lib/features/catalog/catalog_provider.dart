import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';
import '../../data/network_errors.dart';
import '../courses/courses_provider.dart';

class CatalogState {
  const CatalogState({
    this.items = const [],
    this.query = '',
    this.isLoading = true,
    this.isOffline = false,
    this.savedCourseIds = const {},
    this.ownedCourseIds = const {},
    this.saveIds = const {},
    this.busyCourseIds = const {},
    this.nextCursor,
    this.isLoadingMore = false,
    this.loadError,
    this.error,
  });

  final List<CourseSearchItem> items;
  final String query;
  final bool isLoading;
  final bool isOffline;
  final Set<String> savedCourseIds;
  final Set<String> ownedCourseIds;
  final Map<String, String> saveIds;
  final Set<String> busyCourseIds;
  final int? nextCursor;
  final bool isLoadingMore;
  final String? loadError;
  final String? error;

  CatalogState copyWith({
    List<CourseSearchItem>? items,
    String? query,
    bool? isLoading,
    bool? isOffline,
    Set<String>? savedCourseIds,
    Set<String>? ownedCourseIds,
    Map<String, String>? saveIds,
    Set<String>? busyCourseIds,
    int? nextCursor,
    bool clearNextCursor = false,
    bool? isLoadingMore,
    String? loadError,
    bool clearLoadError = false,
    String? error,
    bool clearError = false,
  }) => CatalogState(
    items: items ?? this.items,
    query: query ?? this.query,
    isLoading: isLoading ?? this.isLoading,
    isOffline: isOffline ?? this.isOffline,
    savedCourseIds: savedCourseIds ?? this.savedCourseIds,
    ownedCourseIds: ownedCourseIds ?? this.ownedCourseIds,
    saveIds: saveIds ?? this.saveIds,
    busyCourseIds: busyCourseIds ?? this.busyCourseIds,
    nextCursor: clearNextCursor ? null : nextCursor ?? this.nextCursor,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    loadError: clearLoadError ? null : loadError ?? this.loadError,
    error: clearError ? null : error ?? this.error,
  );
}

class CatalogNotifier extends StateNotifier<CatalogState> {
  CatalogNotifier(this._api, this._ref) : super(const CatalogState()) {
    search();
  }

  final RemoraApiClient _api;
  final Ref _ref;
  final _copyKeys = <String, String>{};
  Timer? _debounce;
  var _requestGeneration = 0;

  void setQuery(String value) {
    _debounce?.cancel();
    state = state.copyWith(query: value, isLoading: false);
    _debounce = Timer(const Duration(milliseconds: 350), search);
  }

  Future<void> search() async {
    final generation = ++_requestGeneration;
    final query = state.query;
    state = state.copyWith(
      isLoading: true,
      isLoadingMore: false,
      isOffline: false,
      clearLoadError: true,
      clearError: true,
    );
    try {
      final results = await Future.wait([
        _api.searchCourses(query: query),
        _api.getMyCourses(),
        _api.getSavedCourses(),
      ]);
      if (generation != _requestGeneration || query != state.query) return;
      final result = results[0] as CourseSearchResult;
      final owned = results[1] as List<CourseSummaryData>;
      final saved = results[2] as List<SavedCourseSummaryData>;
      state = state.copyWith(
        items: result.items,
        isLoading: false,
        nextCursor: result.nextCursor,
        clearNextCursor: result.nextCursor == null,
        savedCourseIds: saved.map((course) => course.id).toSet(),
        ownedCourseIds: owned.map((course) => course.id).toSet(),
        saveIds: {for (final course in saved) course.id: course.saveId},
      );
    } catch (error) {
      if (generation != _requestGeneration || query != state.query) return;
      final offline = isNetworkFailure(error);
      state = state.copyWith(
        isLoading: false,
        isOffline: offline,
        loadError: offline
            ? null
            : 'Не удалось загрузить каталог. Попробуйте ещё раз.',
        clearLoadError: offline,
        clearNextCursor: true,
      );
    }
  }

  Future<void> loadMore() async {
    final cursor = state.nextCursor;
    if (cursor == null || state.isLoading || state.isLoadingMore) return;
    final generation = _requestGeneration;
    final query = state.query;
    state = state.copyWith(isLoadingMore: true, clearError: true);
    try {
      final result = await _api.searchCourses(query: query, cursor: cursor);
      if (generation != _requestGeneration || query != state.query) return;
      final knownIds = state.items.map((item) => item.id).toSet();
      state = state.copyWith(
        items: [
          ...state.items,
          ...result.items.where((item) => knownIds.add(item.id)),
        ],
        nextCursor: result.nextCursor,
        clearNextCursor: result.nextCursor == null,
        isLoadingMore: false,
      );
    } catch (_) {
      if (generation != _requestGeneration || query != state.query) return;
      state = state.copyWith(
        isLoadingMore: false,
        error: 'Не удалось загрузить следующие курсы.',
      );
    }
  }

  Future<bool> saveCourse(String courseId) async {
    if (state.busyCourseIds.contains(courseId)) return false;
    _setBusy(courseId, true);
    try {
      final saved = await _api.saveToLibrary(
        targetType: 'course',
        targetId: courseId,
      );
      state = state.copyWith(
        savedCourseIds: {...state.savedCourseIds, courseId},
        saveIds: {...state.saveIds, courseId: saved.id},
        clearError: true,
      );
      await _ref.read(coursesListProvider.notifier).refresh();
      await _ref.read(coursesListProvider.notifier).downloadCourse(courseId);
      return true;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось сохранить курс. Попробуйте ещё раз.',
      );
      return false;
    } finally {
      _setBusy(courseId, false);
    }
  }

  Future<bool> removeCourse(String courseId) async {
    final saveId = state.saveIds[courseId];
    if (saveId == null || state.busyCourseIds.contains(courseId)) return false;
    _setBusy(courseId, true);
    try {
      await _api.removeFromLibrary(saveId);
      state = state.copyWith(
        savedCourseIds: {...state.savedCourseIds}..remove(courseId),
        saveIds: {...state.saveIds}..remove(courseId),
        clearError: true,
      );
      await _ref.read(coursesListProvider.notifier).refresh();
      return true;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось убрать курс из сохранённых. Попробуйте ещё раз.',
      );
      return false;
    } finally {
      _setBusy(courseId, false);
    }
  }

  Future<CopiedCourseData?> copyCourse(String courseId) async {
    if (state.busyCourseIds.contains(courseId)) return null;
    _setBusy(courseId, true);
    final key = _copyKeys.putIfAbsent(courseId, () => const Uuid().v4());
    try {
      final copied = await _api.copyCourse(courseId, idempotencyKey: key);
      _copyKeys.remove(courseId);
      state = state.copyWith(
        ownedCourseIds: {...state.ownedCourseIds, copied.id},
      );
      await _ref.read(coursesListProvider.notifier).refresh();
      return copied;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось создать копию курса. Попробуйте ещё раз.',
      );
      return null;
    } finally {
      _setBusy(courseId, false);
    }
  }

  void clearError() => state = state.copyWith(clearError: true);

  void _setBusy(String courseId, bool busy) {
    final ids = {...state.busyCourseIds};
    busy ? ids.add(courseId) : ids.remove(courseId);
    state = state.copyWith(busyCourseIds: ids);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

final catalogProvider = StateNotifierProvider<CatalogNotifier, CatalogState>((
  ref,
) {
  return CatalogNotifier(ref.watch(apiClientProvider), ref);
});
