import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';
import '../library/library_provider.dart';
import 'courses_provider.dart';

class MaterialActionsState {
  const MaterialActionsState({
    this.saveIds = const {},
    this.busyKeys = const {},
    this.isLoading = true,
    this.error,
  });

  final Map<String, String> saveIds;
  final Set<String> busyKeys;
  final bool isLoading;
  final String? error;

  bool isSaved(String type, String id) => saveIds.containsKey('$type:$id');
  bool isBusy(String type, String id) => busyKeys.contains('$type:$id');

  MaterialActionsState copyWith({
    Map<String, String>? saveIds,
    Set<String>? busyKeys,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) => MaterialActionsState(
    saveIds: saveIds ?? this.saveIds,
    busyKeys: busyKeys ?? this.busyKeys,
    isLoading: isLoading ?? this.isLoading,
    error: clearError ? null : error ?? this.error,
  );
}

class MaterialActionsNotifier extends StateNotifier<MaterialActionsState> {
  MaterialActionsNotifier(this._api, this._ref)
    : super(const MaterialActionsState()) {
    refresh();
  }

  final RemoraApiClient _api;
  final Ref _ref;
  final _copyKeys = <String, String>{};

  Future<void> refresh() async {
    try {
      final items = await _api.getLibraryItems();
      state = state.copyWith(
        saveIds: {
          for (final item in items)
            '${item.targetType}:${item.targetId}': item.id,
        },
        isLoading: false,
        clearError: true,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> toggleSave(String type, String id, {String? setId}) async {
    final key = '$type:$id';
    if (state.busyKeys.contains(key)) return false;
    _setBusy(key, true);
    try {
      final saves = {...state.saveIds};
      final saveId = saves[key];
      if (saveId == null) {
        final saved = await _api.saveToLibrary(targetType: type, targetId: id);
        saves[key] = saved.id;
      } else {
        await _api.removeFromLibrary(saveId);
        saves.remove(key);
      }
      state = state.copyWith(saveIds: saves, clearError: true);
      await _ref.read(libraryProvider.notifier).refresh();
      if (saveId == null && setId != null) {
        await _ref.read(setRepositoryProvider).downloadSet(setId);
        await _ref.read(libraryProvider.notifier).refresh();
      }
      return true;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось изменить сохранение. Попробуйте ещё раз.',
      );
      return false;
    } finally {
      _setBusy(key, false);
    }
  }

  Future<CopiedCourseData?> copyArticle(
    String courseId,
    String articleId,
  ) async {
    final key = 'article:$articleId';
    if (state.busyKeys.contains(key)) return null;
    _setBusy(key, true);
    final requestKey = _copyKeys.putIfAbsent(key, () => const Uuid().v4());
    try {
      final copied = await _api.copyCourse(
        courseId,
        articleId: articleId,
        idempotencyKey: requestKey,
      );
      _copyKeys.remove(key);
      await _ref.read(coursesListProvider.notifier).refresh();
      return copied;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось скопировать статью. Попробуйте ещё раз.',
      );
      return null;
    } finally {
      _setBusy(key, false);
    }
  }

  Future<CopiedSetData?> copySet(String setId) async {
    final key = 'set:$setId';
    if (state.busyKeys.contains(key)) return null;
    _setBusy(key, true);
    final requestKey = _copyKeys.putIfAbsent(key, () => const Uuid().v4());
    try {
      final copied = await _api.copySet(setId, idempotencyKey: requestKey);
      _copyKeys.remove(key);
      await _ref.read(libraryProvider.notifier).refresh();
      return copied;
    } catch (_) {
      state = state.copyWith(
        error: 'Не удалось скопировать набор. Попробуйте ещё раз.',
      );
      return null;
    } finally {
      _setBusy(key, false);
    }
  }

  void clearError() => state = state.copyWith(clearError: true);

  void _setBusy(String key, bool busy) {
    final keys = {...state.busyKeys};
    busy ? keys.add(key) : keys.remove(key);
    state = state.copyWith(busyKeys: keys);
  }
}

final materialActionsProvider =
    StateNotifierProvider<MaterialActionsNotifier, MaterialActionsState>((ref) {
      return MaterialActionsNotifier(ref.watch(apiClientProvider), ref);
    });
