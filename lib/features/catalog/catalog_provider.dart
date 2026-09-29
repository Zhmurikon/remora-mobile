import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';

class CatalogState {
  const CatalogState({
    this.items = const [],
    this.query = '',
    this.isLoading = true,
    this.isOffline = false,
  });

  final List<CourseSearchItem> items;
  final String query;
  final bool isLoading;
  final bool isOffline;
}

class CatalogNotifier extends StateNotifier<CatalogState> {
  CatalogNotifier(this._api) : super(const CatalogState()) {
    search();
  }

  final RemoraApiClient _api;
  Timer? _debounce;

  void setQuery(String value) {
    _debounce?.cancel();
    state = CatalogState(items: state.items, query: value, isLoading: false);
    _debounce = Timer(const Duration(milliseconds: 350), search);
  }

  Future<void> search() async {
    state = CatalogState(
      items: state.items,
      query: state.query,
      isLoading: true,
    );
    try {
      final result = await _api.searchCourses(query: state.query);
      state = CatalogState(
        items: result.items,
        query: state.query,
        isLoading: false,
      );
    } catch (_) {
      state = CatalogState(
        items: state.items,
        query: state.query,
        isLoading: false,
        isOffline: true,
      );
    }
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
  return CatalogNotifier(ref.watch(apiClientProvider));
});
