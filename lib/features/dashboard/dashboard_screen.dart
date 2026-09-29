import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import '../auth/auth_provider.dart';
import '../library/library_provider.dart';
import 'dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final library = ref.watch(libraryProvider);
    final user = ref.watch(authProvider).user;
    final name = user?.displayName ?? user?.username ?? 'друг';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            onPressed: () => ref.read(dashboardProvider.notifier).refresh(),
            tooltip: 'Обновить прогресс',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            ref.read(dashboardProvider.notifier).refresh(),
            ref.read(libraryProvider.notifier).refresh(),
          ]);
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            Text(
              '${_greeting()}, $name!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Небольшой шаг каждый день превращается в уверенное знание.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            if (dashboard.isLoading)
              const _DashboardSkeleton()
            else ...[
              if (dashboard.isOffline) const _OfflineNotice(),
              _ProgressOverview(state: dashboard),
            ],
            const SizedBox(height: 16),
            _ContinueCard(
              setTitle: library.sets.firstOrNull?.title,
              setId: library.sets.firstOrNull?.id,
            ),
          ],
        ),
      ),
    );
  }
}

String _greeting() {
  final hour = DateTime.now().hour;
  if (hour < 6) return 'Доброй ночи';
  if (hour < 12) return 'Доброе утро';
  if (hour < 18) return 'Добрый день';
  return 'Добрый вечер';
}

class _ProgressOverview extends StatelessWidget {
  const _ProgressOverview({required this.state});

  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    final summary = state.summary;
    if (summary == null) return const _EmptyProgress();

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? RemoraColors.darkAccentSubtle
                        : RemoraColors.lightAccentSubtle,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.local_fire_department,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${summary.currentStreakDays} ${_dayWord(summary.currentStreakDays)} подряд',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Лучший результат — ${summary.longestStreakDays} ${_dayWord(summary.longestStreakDays)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${summary.totalXp} XP',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Цель на сегодня',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text('${summary.reviewsToday} из ${summary.dailyGoal}'),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: summary.goalProgress,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                  semanticsLabel: 'Прогресс дневной цели',
                  semanticsValue:
                      '${(summary.goalProgress * 100).round()} процентов',
                ),
                const SizedBox(height: 18),
                Text(
                  'Последние семь дней',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 12),
                _WeekActivity(activity: state.activity),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WeekActivity extends StatelessWidget {
  const _WeekActivity({required this.activity});

  final List<ActivityDay> activity;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final byDate = {for (final day in activity) _dateKey(day.date): day};
    const labels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final date = DateTime(today.year, today.month, today.day - 6 + index);
        final day = byDate[_dateKey(date)];
        final completed = day?.goalReached ?? false;
        final frozen = day?.isFrozen ?? false;
        final status = completed
            ? 'цель выполнена'
            : frozen
            ? 'заморозка серии'
            : 'цель не выполнена';
        return Semantics(
          label: '${labels[date.weekday - 1]}: $status',
          child: Column(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: completed
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Icon(
                  completed
                      ? Icons.check
                      : frozen
                      ? Icons.ac_unit
                      : null,
                  size: 18,
                  color: completed
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 6),
              Text(labels[date.weekday - 1]),
            ],
          ),
        );
      }),
    );
  }
}

class _ContinueCard extends StatelessWidget {
  const _ContinueCard({this.setTitle, this.setId});

  final String? setTitle;
  final String? setId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              setTitle == null ? 'Начните обучение' : 'Продолжить обучение',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              setTitle ?? 'Выберите первый набор и начните заниматься.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                if (setId == null) {
                  context.go('/sets');
                } else {
                  context.push(
                    '/set/$setId/study?title=${Uri.encodeComponent(setTitle!)}',
                  );
                }
              },
              icon: Icon(
                setId == null ? Icons.style_outlined : Icons.play_arrow,
              ),
              label: Text(
                setId == null ? 'Открыть наборы' : 'Продолжить обучение',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfflineNotice extends StatelessWidget {
  const _OfflineNotice();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.cloud_off_outlined),
          title: Text('Прогресс временно недоступен'),
          subtitle: Text('Скачанные наборы по-прежнему можно изучать офлайн.'),
        ),
      ),
    );
  }
}

class _EmptyProgress extends StatelessWidget {
  const _EmptyProgress();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.insights_outlined),
        title: Text('Здесь появится ваш прогресс'),
        subtitle: Text('Завершите дневную цель, чтобы начать серию.'),
      ),
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

String _dateKey(DateTime value) => '${value.year}-${value.month}-${value.day}';

String _dayWord(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'день';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'дня';
  }
  return 'дней';
}
