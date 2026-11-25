import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'study_result_card.dart';
import 'card_content_widget.dart';
import '../../app/theme.dart';
import '../../data/api_client.dart';
import 'study_provider.dart';

/// Экран результатов сессии + статистика набора.
class SessionResultScreen extends ConsumerStatefulWidget {
  const SessionResultScreen({super.key, required this.setId})
    : isCourse = false,
      isFolder = false;
  const SessionResultScreen.course({super.key, required String courseId})
    : setId = courseId,
      isCourse = true,
      isFolder = false;

  const SessionResultScreen.folder({super.key, required String folderId})
    : setId = folderId,
      isCourse = false,
      isFolder = true;
  final bool isFolder;

  final bool isCourse;

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
    if (widget.isCourse || widget.isFolder) {
      _isLoadingStats = false;
    } else {
      _loadStats();
    }
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () =>
              widget.isCourse ? _returnToCourse() : context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Сессия завершена',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          StudyResultCard(
            correct: correct,
            total: answered,
            complete: state.complete,
            answers: [for (final attempt in state.history) attempt.correct],
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

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                if (widget.isFolder) {
                  context.go('/study/folders');
                  return;
                }
                if (widget.isCourse) {
                  context.pushReplacement(
                    '/course/${widget.setId}/study?title=${Uri.encodeComponent(state.setTitle)}',
                  );
                  return;
                }
                await ref
                    .read(studySessionProvider.notifier)
                    .begin(widget.setId, state.mode);
                if (context.mounted) {
                  context.go('/set/${widget.setId}/study/${state.mode.name}');
                }
              },
              child: Text(
                widget.isFolder
                    ? 'Выбрать папку'
                    : widget.isCourse
                    ? 'Выбрать режим'
                    : 'Продолжить учить',
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () =>
                  widget.isCourse ? _returnToCourse() : context.go('/sets'),
              child: Text(widget.isCourse ? 'К курсу' : 'К наборам'),
            ),
          ),
          if (state.history.any((a) => !a.correct)) ...[
            const SizedBox(height: 24),
            Text('Разбор ошибок', style: theme.textTheme.titleLarge),
            for (final a in state.history.where((a) => !a.correct))
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _side(a.item, answer: false),
                      const SizedBox(height: 10),
                      Text('Ваш ответ', style: theme.textTheme.labelMedium),
                      Text(a.given ?? 'Не помню'),
                      const SizedBox(height: 8),
                      Text(
                        'Правильный ответ',
                        style: theme.textTheme.labelMedium,
                      ),
                      _side(a.item, answer: true),
                    ],
                  ),
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
        ],
      ),
    );
  }

  void _returnToCourse() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/course/${widget.setId}');
    }
  }

  Widget _side(QueueItem item, {required bool answer}) {
    final term = (item.direction == 'term_to_def') != answer;
    return CardContentWidget(
      value: term ? item.card.term : item.card.definition,
      contentType: item.card.contentType,
      codeLanguage: item.card.codeLanguage,
      imageUrl: term ? item.card.termImageUrl : item.card.definitionImageUrl,
    );
  }

  Widget _buildStatsCard(BuildContext context, SetStats stats, bool isDark) {
    final progressPercent = stats.studiedPercent.round();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Первый проход — уже видимый прогресс, а закрепление остаётся
            // отдельной строгой метрикой долгосрочного запоминания.
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Прогресс',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: stats.studiedPercent / 100,
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
                  '$progressPercent%',
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
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${stats.studiedCount} из ${stats.cardsTotal} карточек изучались · '
                '${stats.masteredCount} закреплено',
                style: Theme.of(context).textTheme.bodySmall,
              ),
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
}
