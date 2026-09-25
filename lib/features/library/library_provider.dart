import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/db/app_database.dart';
import '../../data/db/database_provider.dart';
import '../../data/repositories/set_repository.dart';

/// Доступность сети.
final connectivityProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  return Connectivity().onConnectivityChanged;
});

final setRepositoryProvider = Provider<SetRepository>((ref) {
  return SetRepository(
    ref.watch(databaseProvider),
    ref.watch(apiClientProvider),
  );
});

/// Состояние экрана библиотеки.
class LibraryState {
  LibraryState({
    required this.sets,
    required this.isLoading,
    this.error,
    required this.isOnline,
    required this.downloadingSetIds,
    required this.downloadedSetIds,
    required this.outdatedSetIds,
  });

  final List<SetRecord> sets;
  final bool isLoading;
  final String? error;
  final bool isOnline;
  final Set<String> downloadingSetIds;
  final Set<String> downloadedSetIds;
  final Set<String> outdatedSetIds;

  LibraryState copyWith({
    List<SetRecord>? sets,
    bool? isLoading,
    String? error,
    bool? isOnline,
    Set<String>? downloadingSetIds,
    Set<String>? downloadedSetIds,
    Set<String>? outdatedSetIds,
  }) {
    return LibraryState(
      sets: sets ?? this.sets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isOnline: isOnline ?? this.isOnline,
      downloadingSetIds: downloadingSetIds ?? this.downloadingSetIds,
      downloadedSetIds: downloadedSetIds ?? this.downloadedSetIds,
      outdatedSetIds: outdatedSetIds ?? this.outdatedSetIds,
    );
  }
}

/// Провайдер состояния библиотеки.
class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier(this._repo)
    : super(
        LibraryState(
          sets: [],
          isLoading: true,
          isOnline: true,
          downloadingSetIds: {},
          downloadedSetIds: {},
          outdatedSetIds: {},
        ),
      ) {
    _init();
  }

  final SetRepository _repo;

  Future<void> _init() async {
    try {
      // Сначала показываем локальные данные
      final localSets = await _repo.getDownloadedSets();
      final downloadedIds = await _repo.getDownloadedSetIds();
      final outdatedIds = await _repo.getOutdatedDownloadedSetIds();
      state = state.copyWith(
        sets: localSets,
        isLoading: false,
        downloadedSetIds: downloadedIds,
        outdatedSetIds: outdatedIds,
      );

      // Затем пробуем синхронизировать из API
      await refresh();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Обновить список наборов (онлайн-синхронизация).
  Future<void> refresh() async {
    try {
      final sets = await _repo.syncMySets();
      final outdatedIds = await _repo.getOutdatedDownloadedSetIds();
      state = state.copyWith(
        sets: sets,
        outdatedSetIds: outdatedIds,
        isOnline: true,
        error: null,
      );
    } catch (e) {
      // Не онлайн — показываем локальные данные без ошибки
      state = state.copyWith(isOnline: false);
    }
  }

  /// Скачать набор для офлайн-доступа.
  Future<void> downloadSet(String setId) async {
    if (state.downloadingSetIds.contains(setId)) return;

    state = state.copyWith(
      downloadingSetIds: {...state.downloadingSetIds, setId},
    );

    try {
      await _repo.downloadSet(setId);
      final sets = await _repo.getDownloadedSets();
      final downloadedIds = await _repo.getDownloadedSetIds();
      final outdatedIds = await _repo.getOutdatedDownloadedSetIds();
      final downloading = {...state.downloadingSetIds}..remove(setId);
      state = state.copyWith(
        sets: sets,
        downloadingSetIds: downloading,
        downloadedSetIds: downloadedIds,
        outdatedSetIds: outdatedIds,
      );
    } catch (e) {
      final downloading = {...state.downloadingSetIds}..remove(setId);
      state = state.copyWith(
        downloadingSetIds: downloading,
        error: 'Не удалось скачать: ${detail(e)}',
      );
    }
  }
}

String detail(Object e) => e.toString().split('\n').first;

final libraryProvider = StateNotifierProvider<LibraryNotifier, LibraryState>((
  ref,
) {
  return LibraryNotifier(ref.watch(setRepositoryProvider));
});
