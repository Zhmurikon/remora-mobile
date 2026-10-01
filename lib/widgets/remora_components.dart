import 'package:flutter/material.dart';

import '../app/theme.dart';

enum RemoraSurfaceLevel { flat, tonal, grouped }

/// Три уровня поверхности: фон, тональная группировка и очерченная группа.
class RemoraSurface extends StatelessWidget {
  const RemoraSurface({
    required this.child,
    super.key,
    this.level = RemoraSurfaceLevel.tonal,
    this.padding = const EdgeInsets.all(RemoraSpacing.md),
  });

  final Widget child;
  final RemoraSurfaceLevel level;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (color, border) = switch (level) {
      RemoraSurfaceLevel.flat => (context.remora.background, null),
      RemoraSurfaceLevel.tonal => (context.remora.surfaceMuted, null),
      RemoraSurfaceLevel.grouped => (
        scheme.surface,
        BorderSide(color: scheme.outline),
      ),
    };
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.card),
        side: border ?? BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(padding: padding, child: child),
    );
  }
}

/// Заголовок экранов верхнего уровня с предсказуемой сеткой и переносами.
class RemoraScreenHeader extends StatelessWidget {
  const RemoraScreenHeader({
    required this.title,
    super.key,
    this.subtitle,
    this.actions = const [],
    this.motif,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final KnowledgeMotifType? motif;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RemoraSpacing.lg,
        RemoraSpacing.md,
        RemoraSpacing.lg,
        RemoraSpacing.sm,
      ),
      child: Stack(
        children: [
          if (motif != null)
            PositionedDirectional(
              end: 0,
              top: 0,
              child: Opacity(
                opacity: 0.72,
                child: KnowledgeMotif(type: motif!, size: 72),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: motif == null ? 0 : 76),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.headlineLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: RemoraSpacing.xs),
                        Text(subtitle!, style: theme.textTheme.bodyMedium),
                      ],
                    ],
                  ),
                ),
                if (actions.isNotEmpty) ...[
                  const SizedBox(width: RemoraSpacing.xs),
                  Wrap(spacing: RemoraSpacing.xxs, children: actions),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Плоская строка курса или набора без вложенных карточек.
class RemoraListRow extends StatelessWidget {
  const RemoraListRow({
    required this.title,
    super.key,
    this.subtitle,
    this.metadata,
    this.leading,
    this.trailing,
    this.markerColor,
    this.onTap,
    this.onLongPress,
    this.semanticLabel,
  });

  final String title;
  final String? subtitle;
  final String? metadata;
  final Widget? leading;
  final Widget? trailing;
  final Color? markerColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final row = Material(
      color: scheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.card),
        side: BorderSide(color: scheme.outline),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Padding(
            padding: const EdgeInsets.all(RemoraSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (markerColor != null) ...[
                  Container(
                    width: 5,
                    height: 48,
                    decoration: BoxDecoration(
                      color: markerColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: RemoraSpacing.sm),
                ],
                if (leading != null) ...[
                  SizedBox.square(
                    dimension: RemoraSizes.minTouchTarget,
                    child: Center(child: leading),
                  ),
                  const SizedBox(width: RemoraSpacing.sm),
                ],
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: RemoraSpacing.xxs),
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      if (metadata != null) ...[
                        const SizedBox(height: RemoraSpacing.xxs),
                        Text(metadata!, style: theme.textTheme.bodySmall),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: RemoraSpacing.xs),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: RemoraSizes.minTouchTarget,
                      minHeight: RemoraSizes.minTouchTarget,
                    ),
                    child: Center(child: trailing),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (semanticLabel == null) return row;
    return Semantics(
      container: true,
      button: onTap != null,
      label: semanticLabel,
      child: ExcludeSemantics(child: row),
    );
  }
}

enum RemoraOfflineState { available, unavailable, downloading, updateAvailable }

/// Компактный, но не зависящий только от цвета статус офлайн-доступа.
class RemoraOfflineStatus extends StatelessWidget {
  const RemoraOfflineStatus({
    required this.state,
    super.key,
    this.progress,
    this.compact = false,
  });

  final RemoraOfflineState state;
  final double? progress;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    final (label, icon, foreground, background) = switch (state) {
      RemoraOfflineState.available => (
        'Доступно офлайн',
        Icons.download_done_rounded,
        tokens.success,
        tokens.successContainer,
      ),
      RemoraOfflineState.unavailable => (
        'Только онлайн',
        Icons.cloud_outlined,
        theme.colorScheme.onSurfaceVariant,
        tokens.surfaceMuted,
      ),
      RemoraOfflineState.downloading => (
        'Загрузка',
        Icons.downloading_rounded,
        theme.colorScheme.primary,
        theme.colorScheme.primaryContainer,
      ),
      RemoraOfflineState.updateAvailable => (
        'Есть обновление',
        Icons.sync_rounded,
        tokens.warning,
        tokens.warningContainer,
      ),
    };

    return Semantics(
      label: progress == null
          ? label
          : '$label, ${(progress!.clamp(0, 1) * 100).round()} процентов',
      child: Container(
        constraints: const BoxConstraints(minHeight: 32),
        padding: EdgeInsets.symmetric(
          horizontal: compact ? RemoraSpacing.xs : RemoraSpacing.sm,
          vertical: RemoraSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(RemoraRadii.small),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: foreground),
            if (!compact) ...[
              const SizedBox(width: RemoraSpacing.xs),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(color: foreground),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Единое пустое или ошибочное состояние без полноэкранной иллюстрации.
class RemoraStateView extends StatelessWidget {
  const RemoraStateView.empty({
    required this.title,
    required this.message,
    super.key,
    this.actionLabel,
    this.onAction,
    this.icon = Icons.auto_stories_outlined,
  }) : isError = false;

  const RemoraStateView.error({
    required this.title,
    required this.message,
    super.key,
    this.actionLabel = 'Повторить',
    this.onAction,
    this.icon = Icons.cloud_off_outlined,
  }) : isError = true;

  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData icon;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isError ? theme.colorScheme.error : theme.colorScheme.primary;
    final containerColor = isError
        ? theme.colorScheme.errorContainer
        : theme.colorScheme.primaryContainer;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(RemoraSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(RemoraRadii.card),
                ),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: RemoraSpacing.lg),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: RemoraSpacing.xs),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: RemoraSpacing.xl),
                FilledButton.icon(
                  onPressed: onAction,
                  icon: Icon(
                    isError ? Icons.refresh_rounded : Icons.add_rounded,
                  ),
                  label: Text(actionLabel!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Тактильная поверхность вопроса и ответа с типографикой длинного чтения.
class RemoraStudySurface extends StatelessWidget {
  const RemoraStudySurface({
    required this.child,
    super.key,
    this.label,
    this.footer,
    this.onTap,
    this.padding = const EdgeInsets.all(RemoraSpacing.xl),
  });

  final Widget child;
  final String? label;
  final Widget? footer;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.remora;
    return Semantics(
      container: true,
      button: onTap != null,
      label: label,
      child: Material(
        color: tokens.studySurface,
        elevation: 0,
        shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RemoraRadii.large),
          side: BorderSide(color: theme.colorScheme.outline),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 280,
              minWidth: double.infinity,
            ),
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: DefaultTextStyle.merge(
                      style: context.remoraType.studyCard.copyWith(
                        color: tokens.studyInk,
                      ),
                      child: Center(child: child),
                    ),
                  ),
                  if (footer != null) ...[
                    const SizedBox(height: RemoraSpacing.xl),
                    footer!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Нижнее действие, которое учитывает жестовую панель и не перекрывает контент.
class RemoraBottomAction extends StatelessWidget {
  const RemoraBottomAction({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.supportingText,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? supportingText;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(
          RemoraSpacing.md,
          RemoraSpacing.sm,
          RemoraSpacing.md,
          RemoraSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (supportingText != null) ...[
              Text(
                supportingText!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: RemoraSpacing.xs),
            ],
            FilledButton.icon(
              onPressed: loading ? null : onPressed,
              icon: loading
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(icon ?? Icons.arrow_forward_rounded),
              label: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

enum KnowledgeMotifType { books, cards, connections }

/// Лёгкий геометрический мотив; декоративен и не подменяет знак Remora.
class KnowledgeMotif extends StatelessWidget {
  const KnowledgeMotif({required this.type, super.key, this.size = 96});

  final KnowledgeMotifType type;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.square(size),
          painter: _KnowledgeMotifPainter(
            type: type,
            primary: Theme.of(context).colorScheme.primary,
            accent: Theme.of(context).colorScheme.secondary,
            ochre: context.remora.ochre,
          ),
        ),
      ),
    );
  }
}

class _KnowledgeMotifPainter extends CustomPainter {
  const _KnowledgeMotifPainter({
    required this.type,
    required this.primary,
    required this.accent,
    required this.ochre,
  });

  final KnowledgeMotifType type;
  final Color primary;
  final Color accent;
  final Color ochre;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.shortestSide / 100;
    canvas.save();
    canvas.scale(scale, scale);
    switch (type) {
      case KnowledgeMotifType.books:
        _paintBooks(canvas);
      case KnowledgeMotifType.cards:
        _paintCards(canvas);
      case KnowledgeMotifType.connections:
        _paintConnections(canvas);
    }
    canvas.restore();
  }

  void _paintBooks(Canvas canvas) {
    final line = Paint()
      ..color = primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final page = Path()
      ..moveTo(13, 67)
      ..quadraticBezierTo(31, 58, 49, 68)
      ..lineTo(49, 31)
      ..quadraticBezierTo(31, 21, 13, 31)
      ..close();
    final facingPage = Path()
      ..moveTo(51, 68)
      ..quadraticBezierTo(69, 58, 87, 67)
      ..lineTo(87, 31)
      ..quadraticBezierTo(69, 21, 51, 31)
      ..close();
    canvas.drawPath(page, line);
    canvas.drawPath(facingPage, line);
    canvas.drawLine(const Offset(50, 31), const Offset(50, 72), line);
    canvas.drawLine(const Offset(22, 39), const Offset(41, 36), line);
    canvas.drawLine(const Offset(59, 36), const Offset(78, 39), line);
    canvas.drawCircle(
      const Offset(78, 20),
      5,
      Paint()..color = ochre.withValues(alpha: 0.9),
    );
    canvas.drawLine(
      const Offset(70, 23),
      const Offset(60, 29),
      Paint()
        ..color = accent
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
  }

  void _paintCards(Canvas canvas) {
    final line = Paint()
      ..color = primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeJoin = StrokeJoin.round;
    final back = RRect.fromRectAndRadius(
      const Rect.fromLTWH(27, 18, 52, 62),
      const Radius.circular(8),
    );
    final front = RRect.fromRectAndRadius(
      const Rect.fromLTWH(18, 27, 52, 62),
      const Radius.circular(8),
    );
    canvas.drawRRect(back, line..color = ochre);
    canvas.drawRRect(front, line..color = primary);
    canvas.drawLine(const Offset(31, 48), const Offset(57, 48), line);
    canvas.drawLine(const Offset(31, 58), const Offset(50, 58), line);
    canvas.drawCircle(
      const Offset(70, 29),
      7,
      Paint()..color = accent.withValues(alpha: 0.9),
    );
  }

  void _paintConnections(Canvas canvas) {
    final line = Paint()
      ..color = primary.withValues(alpha: 0.72)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(17, 68)
      ..cubicTo(28, 45, 36, 55, 48, 36)
      ..cubicTo(61, 17, 70, 46, 84, 28);
    canvas.drawPath(path, line);
    for (final node in [
      (const Offset(17, 68), primary),
      (const Offset(48, 36), accent),
      (const Offset(84, 28), ochre),
    ]) {
      canvas.drawCircle(node.$1, 6, Paint()..color = node.$2);
      canvas.drawCircle(
        node.$1,
        10,
        Paint()
          ..color = node.$2.withValues(alpha: 0.22)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _KnowledgeMotifPainter oldDelegate) {
    return oldDelegate.type != type ||
        oldDelegate.primary != primary ||
        oldDelegate.accent != accent ||
        oldDelegate.ochre != ochre;
  }
}
