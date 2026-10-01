import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../data/api_client.dart';
import '../../widgets/remora_components.dart';
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
    final firstSet = library.sets.firstOrNull;

    return DashboardView(
      name: name,
      dashboard: dashboard,
      setTitle: firstSet?.title,
      setId: firstSet?.id,
      libraryLoading: library.isLoading,
      onRefresh: () async {
        await Future.wait([
          ref.read(dashboardProvider.notifier).refresh(),
          ref.read(libraryProvider.notifier).refresh(),
        ]);
      },
      onOpenSets: () => context.go('/sets'),
      onOpenSet: (id, title) =>
          context.push('/set/$id/study?title=${Uri.encodeComponent(title)}'),
    );
  }
}

/// Чистое представление главной: состояния можно проверять без сети и базы.
class DashboardView extends StatelessWidget {
  const DashboardView({
    required this.name,
    required this.dashboard,
    required this.libraryLoading,
    required this.onRefresh,
    required this.onOpenSets,
    required this.onOpenSet,
    super.key,
    this.setTitle,
    this.setId,
    this.now,
  });

  final String name;
  final DashboardState dashboard;
  final String? setTitle;
  final String? setId;
  final bool libraryLoading;
  final Future<void> Function() onRefresh;
  final VoidCallback onOpenSets;
  final void Function(String id, String title) onOpenSet;
  final DateTime? now;

  @override
  Widget build(BuildContext context) {
    final currentTime = now ?? DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            onPressed: onRefresh,
            tooltip: 'Обновить прогресс',
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: RemoraSpacing.xxl),
          children: [
            _DashboardHeader(name: name, now: currentTime),
            if (dashboard.isOffline)
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  RemoraSpacing.md,
                  RemoraSpacing.xs,
                  RemoraSpacing.md,
                  RemoraSpacing.md,
                ),
                child: _OfflineNotice(),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
              child: dashboard.isLoading && dashboard.summary == null
                  ? const _DashboardSkeleton()
                  : _ProgressOverview(state: dashboard, today: currentTime),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
              child: Divider(height: RemoraSpacing.md),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.md),
              child: _ContinuePanel(
                setTitle: setTitle,
                setId: setId,
                loading: libraryLoading && setTitle == null,
                onOpenSets: onOpenSets,
                onOpenSet: onOpenSet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _greeting(DateTime value) {
  final hour = value.hour;
  if (hour < 6) return 'Доброй ночи';
  if (hour < 12) return 'Доброе утро';
  if (hour < 18) return 'Добрый день';
  return 'Добрый вечер';
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.name, required this.now});

  final String name;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final enlargedText = MediaQuery.textScalerOf(context).scale(16) > 18;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RemoraSpacing.md,
        RemoraSpacing.xs,
        RemoraSpacing.md,
        RemoraSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${_greeting(now)},\n$name',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineLarge?.copyWith(height: 1.02),
                ),
              ),
              _GrowingBooksMotif(
                size: enlargedText ? 96 : 112,
                dark: theme.brightness == Brightness.dark,
              ),
            ],
          ),
          SizedBox(height: enlargedText ? RemoraSpacing.sm : 0),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: enlargedText ? 360 : 330),
            child: Text(
              'Небольшой шаг каждый день\n'
              'превращается в уверенное знание.',
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.35),
            ),
          ),
          const SizedBox(height: RemoraSpacing.md),
        ],
      ),
    );
  }
}

class _ProgressOverview extends StatelessWidget {
  const _ProgressOverview({required this.state, required this.today});

  final DashboardState state;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final summary = state.summary;
    if (summary == null) return const _EmptyProgress();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Сегодня', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: RemoraSpacing.sm),
        _StatsLine(summary: summary),
        const SizedBox(height: RemoraSpacing.md),
        Row(
          children: [
            Expanded(
              child: Text(
                'Цель: ${summary.dailyGoal} ${_cardWord(summary.dailyGoal)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(
              '${summary.reviewsToday} из ${summary.dailyGoal}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: RemoraSpacing.xs),
        LinearProgressIndicator(
          value: summary.goalProgress,
          minHeight: 8,
          borderRadius: BorderRadius.circular(RemoraRadii.large),
          semanticsLabel: 'Прогресс дневной цели',
        ),
        const SizedBox(height: RemoraSpacing.md),
        Text('Последние 7 дней', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: RemoraSpacing.sm),
        _WeekActivity(activity: state.activity, today: today),
      ],
    );
  }
}

class _StatsLine extends StatelessWidget {
  const _StatsLine({required this.summary});

  final RetentionSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final enlargedText = MediaQuery.textScalerOf(context).scale(16) > 18;
    return Semantics(
      container: true,
      label:
          '${summary.currentStreakDays} ${_dayWord(summary.currentStreakDays)} подряд, '
          '${summary.totalXp} опыта. Лучший результат — '
          '${summary.longestStreakDays} ${_dayWord(summary.longestStreakDays)}. '
          'Доступно заморозок: ${summary.freezesLeft}.',
      child: ExcludeSemantics(
        child: enlargedText
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _StreakIcon(theme: theme),
                      const SizedBox(width: RemoraSpacing.sm),
                      Expanded(
                        child: Text(
                          '${summary.currentStreakDays} ${_dayWord(summary.currentStreakDays)} подряд',
                          maxLines: 2,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      _XpBadge(theme: theme, tokens: tokens),
                      const SizedBox(width: RemoraSpacing.xs),
                      Text(
                        '${summary.totalXp} XP',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: RemoraSizes.minTouchTarget + RemoraSpacing.sm,
                      top: RemoraSpacing.xxs,
                    ),
                    child: Text(
                      'Лучший результат — ${summary.longestStreakDays} '
                      '${_dayWord(summary.longestStreakDays)}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _StreakIcon(theme: theme),
                  const SizedBox(width: RemoraSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${summary.currentStreakDays} ${_dayWord(summary.currentStreakDays)} подряд',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                        FittedBox(
                          alignment: AlignmentDirectional.centerStart,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Лучший результат — ${summary.longestStreakDays} '
                            '${_dayWord(summary.longestStreakDays)}',
                            maxLines: 1,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 42,
                    margin: const EdgeInsets.symmetric(
                      horizontal: RemoraSpacing.sm,
                    ),
                    color: theme.colorScheme.outline,
                  ),
                  _XpBadge(theme: theme, tokens: tokens),
                  const SizedBox(width: RemoraSpacing.xs),
                  Text(
                    '${summary.totalXp} XP',
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
      ),
    );
  }
}

class _StreakIcon extends StatelessWidget {
  const _StreakIcon({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: RemoraSizes.minTouchTarget,
      height: RemoraSizes.minTouchTarget,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(RemoraRadii.control),
      ),
      child: Icon(
        Icons.local_fire_department_rounded,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

class _XpBadge extends StatelessWidget {
  const _XpBadge({required this.theme, required this.tokens});

  final ThemeData theme;
  final RemoraThemeTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(color: tokens.ochre, shape: BoxShape.circle),
      child: Icon(
        Icons.star_rounded,
        size: 19,
        color: theme.brightness == Brightness.dark
            ? RemoraColors.darkBg
            : Colors.white,
      ),
    );
  }
}

class _WeekActivity extends StatelessWidget {
  const _WeekActivity({required this.activity, required this.today});

  final List<ActivityDay> activity;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final byDate = {for (final day in activity) _dateKey(day.date): day};
    const labels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = RemoraSpacing.xs;
        final cellWidth = (constraints.maxWidth - gap * 6) / 7;
        final circleSize = cellWidth.clamp(28.0, 40.0);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final date = DateTime(
              today.year,
              today.month,
              today.day - 6 + index,
            );
            final day = byDate[_dateKey(date)];
            final completed = day?.goalReached ?? false;
            final frozen = day?.isFrozen ?? false;
            final status = completed
                ? 'цель выполнена'
                : frozen
                ? 'серия заморожена'
                : 'цель не выполнена';
            final label = labels[date.weekday - 1];
            final background = completed
                ? theme.colorScheme.primary
                : frozen
                ? tokens.ochreContainer
                : tokens.surfaceElevated;
            final foreground = completed
                ? theme.colorScheme.onPrimary
                : frozen
                ? tokens.ochre
                : theme.colorScheme.onSurfaceVariant;
            return Semantics(
              label: '$label: $status',
              child: ExcludeSemantics(
                child: SizedBox(
                  width: cellWidth,
                  child: Column(
                    children: [
                      Container(
                        width: circleSize,
                        height: circleSize,
                        decoration: BoxDecoration(
                          color: background,
                          shape: BoxShape.circle,
                        ),
                        child: completed || frozen
                            ? Icon(
                                completed
                                    ? Icons.check_rounded
                                    : Icons.ac_unit_rounded,
                                size: circleSize * 0.52,
                                color: foreground,
                              )
                            : null,
                      ),
                      const SizedBox(height: RemoraSpacing.xs),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(label, style: theme.textTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ContinuePanel extends StatelessWidget {
  const _ContinuePanel({
    required this.loading,
    required this.onOpenSets,
    required this.onOpenSet,
    this.setTitle,
    this.setId,
  });

  final String? setTitle;
  final String? setId;
  final bool loading;
  final VoidCallback onOpenSets;
  final void Function(String id, String title) onOpenSet;

  @override
  Widget build(BuildContext context) {
    final hasSet = setTitle != null && setId != null;
    final title = loading
        ? 'Готовим продолжение'
        : hasSet
        ? 'Продолжить обучение'
        : 'Начните с первого набора';
    final message = loading
        ? 'Ищем последний доступный набор.'
        : hasSet
        ? setTitle!
        : 'Выберите набор — он останется доступен для следующих занятий.';

    final onPressed = loading
        ? null
        : hasSet
        ? () => onOpenSet(setId!, setTitle!)
        : onOpenSets;

    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.card),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(RemoraSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(RemoraRadii.control),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 64),
                child: Row(
                  children: [
                    const _CourseBookMotif(size: 82),
                    const SizedBox(width: RemoraSpacing.sm),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: RemoraSpacing.xxs),
                          Text(
                            message,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: RemoraSpacing.xs),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: RemoraSpacing.xs),
            FilledButton.icon(
              onPressed: onPressed,
              icon: loading
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(
                      hasSet ? Icons.play_arrow_rounded : Icons.style_outlined,
                    ),
              label: Text(
                loading
                    ? 'Загрузка'
                    : hasSet
                    ? 'Продолжить обучение'
                    : 'Открыть наборы',
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
    final theme = Theme.of(context);
    final tokens = context.remora;
    return Semantics(
      container: true,
      label:
          'Нет сети. Прогресс временно недоступен. Скачанные наборы можно изучать офлайн.',
      child: ExcludeSemantics(
        child: Container(
          constraints: const BoxConstraints(
            minHeight: RemoraSizes.minTouchTarget,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: RemoraSpacing.sm,
            vertical: RemoraSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: tokens.warningContainer,
            borderRadius: BorderRadius.circular(RemoraRadii.card),
          ),
          child: Row(
            children: [
              Icon(Icons.cloud_off_outlined, color: tokens.warning),
              const SizedBox(width: RemoraSpacing.sm),
              Expanded(
                child: Text(
                  'Нет сети — скачанные наборы по-прежнему доступны.',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyProgress extends StatelessWidget {
  const _EmptyProgress();

  @override
  Widget build(BuildContext context) {
    return RemoraSurface(
      level: RemoraSurfaceLevel.tonal,
      padding: const EdgeInsets.all(RemoraSpacing.lg),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 188),
        child: const RemoraStateView.empty(
          title: 'Здесь появится ваш прогресс',
          message: 'Завершите дневную цель, чтобы начать серию.',
          icon: Icons.insights_outlined,
        ),
      ),
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    final color = context.remora.surfaceElevated;
    return Semantics(
      label: 'Загрузка прогресса',
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 76,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(RemoraRadii.card),
              ),
            ),
            const SizedBox(height: RemoraSpacing.md),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(RemoraRadii.card),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

class _GrowingBooksMotif extends StatelessWidget {
  const _GrowingBooksMotif({required this.size, required this.dark});

  final double size;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Opacity(
        opacity: dark ? 1 : 0.96,
        child: Image.asset(
          'assets/illustrations/growing-books-v2.png',
          width: size,
          height: size,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

class _CourseBookMotif extends StatelessWidget {
  const _CourseBookMotif({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        width: size,
        height: 64,
        child: Image.asset(
          'assets/illustrations/python-course.png',
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
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

String _cardWord(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return 'карточка';
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) {
    return 'карточки';
  }
  return 'карточек';
}
