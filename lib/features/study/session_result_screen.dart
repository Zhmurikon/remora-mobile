import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'study_provider.dart';

/// Экран результатов сессии + статистика набора.
class SessionResultScreen extends ConsumerStatefulWidget {
  const SessionResultScreen({super.key, required this.setId});

  final String setId;

  @override
  ConsumerState<SessionResultScreen> createState() =>
      _SessionResultScreenState();
}

class _SessionResultScreenState extends ConsumerState<SessionResultScreen> {
  SetStats? _stats;
  bool _isLoadingStats = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    try {
      final api = ref.read(apiClientProvider);
      final stats = await api.getSetStats(widget.setId);
      if (mounted) {
        setState(() {
          _stats = stats;
          _isLoadingStats = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _isLoadingStats = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(studySessionProvider);

    final answered = state.answered;
    final correct = state.correct;
    final wrong = answered - correct;
    final accuracy = answered > 0 ? (correct / answered * 100).round() : 0;

    final accuracyColor = accuracy >= 80
        ? (isDark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess)
        : accuracy >= 50
        ? (isDark ? RemoraColors.darkWarning : RemoraColors.lightWarning)
        : (isDark ? RemoraColors.darkDanger : RemoraColors.lightDanger);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Результаты сессии
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accuracyColor.withValues(alpha: 0.12),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 48,
                        color: accuracyColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _modeTitle(state.mode),
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('Сессия завершена', style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statColumn('$answered', 'Отвечено', null),
                      _statColumn(
                        '$correct',
                        'Правильно',
                        isDark
                            ? RemoraColors.darkSuccess
                            : RemoraColors.lightSuccess,
                      ),
                      _statColumn(
                        '$wrong',
                        'Ошибки',
                        isDark
                            ? RemoraColors.darkDanger
                            : RemoraColors.lightDanger,
                      ),
                      _statColumn('$accuracy%', 'Точность', accuracyColor),
                    ],
                  ),
                ],
              ),
            ),
          ),

          if (state.pending > 0) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    (isDark
                            ? RemoraColors.darkWarning
                            : RemoraColors.lightWarning)
                        .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: isDark
                        ? RemoraColors.darkWarning
                        : RemoraColors.lightWarning,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Неотправленных ответов: ${state.pending}. '
                      'Они отправятся автоматически при подключении.',
                      style: TextStyle(
                        color: isDark
                            ? RemoraColors.darkWarning
                            : RemoraColors.lightWarning,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Статистика набора
          if (_isLoadingStats) ...[
            const SizedBox(height: 24),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            ),
          ] else if (_stats != null) ...[
            const SizedBox(height: 24),
            Text('Статистика набора', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _buildStatsCard(context, _stats!, isDark),
          ],

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => context.go('/set/${widget.setId}/study'),
              child: const Text('Продолжить обучение'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.go('/'),
              child: const Text('К наборам'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _statColumn(String value, String label, Color? color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildStatsCard(BuildContext context, SetStats stats, bool isDark) {
    final masteryPercent = stats.masteryPercent.round();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Прогресс-бар освоения
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Освоение',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: stats.masteryPercent / 100,
                          minHeight: 8,
                          backgroundColor: isDark
                              ? RemoraColors.darkSurfaceMuted
                              : RemoraColors.lightSurfaceMuted,
                          valueColor: AlwaysStoppedAnimation(
                            isDark
                                ? RemoraColors.darkPrimary
                                : RemoraColors.lightPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '$masteryPercent%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? RemoraColors.darkPrimary
                        : RemoraColors.lightPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Распределение состояний
            Row(
              children: [
                _stateChip(
                  'Новые',
                  stats.distribution.newCount,
                  isDark
                      ? RemoraColors.darkFgSubtle
                      : RemoraColors.lightFgSubtle,
                ),
                const SizedBox(width: 8),
                _stateChip(
                  'Изучение',
                  stats.distribution.learning,
                  isDark ? RemoraColors.darkAccent : RemoraColors.lightAccent,
                ),
                const SizedBox(width: 8),
                _stateChip(
                  'Повторение',
                  stats.distribution.review,
                  isDark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary,
                ),
                const SizedBox(width: 8),
                _stateChip(
                  'Переучивание',
                  stats.distribution.relearning,
                  isDark ? RemoraColors.darkWarning : RemoraColors.lightWarning,
                ),
              ],
            ),
            if (stats.dueNow > 0) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color:
                      (isDark
                              ? RemoraColors.darkAccent
                              : RemoraColors.lightAccent)
                          .withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Сейчас к повторению: ${stats.dueNow}',
                  style: TextStyle(
                    color: isDark
                        ? RemoraColors.darkAccent
                        : RemoraColors.lightAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            if (stats.problemCards.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Проблемные карточки',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              ...stats.problemCards
                  .take(5)
                  .map(
                    (pc) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              pc.term,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${pc.lapses} ошиб.',
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark
                                  ? RemoraColors.darkDanger
                                  : RemoraColors.lightDanger,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _stateChip(String label, int count, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }

  String _modeTitle(StudyMode mode) {
    switch (mode) {
      case StudyMode.flashcards:
        return 'Карточки';
      case StudyMode.learn:
        return 'Учить';
      case StudyMode.write:
        return 'Писать';
    }
  }
}
