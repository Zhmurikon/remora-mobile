import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';

class DashboardState {
  const DashboardState({
    this.summary,
    this.activity = const [],
    this.isLoading = true,
    this.isOffline = false,
  });

  final RetentionSummary? summary;
  final List<ActivityDay> activity;
  final bool isLoading;
  final bool isOffline;
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier(this._api) : super(const DashboardState()) {
    refresh();
  }

  final RemoraApiClient _api;

  Future<void> refresh() async {
    state = DashboardState(
      summary: state.summary,
      activity: state.activity,
      isLoading: state.summary == null,
    );
    final today = DateTime.now();
    final from = DateTime(today.year, today.month, today.day - 6);
    try {
      final results = await Future.wait<Object>([
        _api.getRetentionSummary(),
        _api.getRetentionActivity(from: from, to: today),
      ]);
      state = DashboardState(
        summary: results[0] as RetentionSummary,
        activity: results[1] as List<ActivityDay>,
        isLoading: false,
      );
    } catch (_) {
      state = DashboardState(
        summary: state.summary,
        activity: state.activity,
        isLoading: false,
        isOffline: true,
      );
    }
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
      return DashboardNotifier(ref.watch(apiClientProvider));
    });
