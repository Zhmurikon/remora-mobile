import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../data/connectivity_controller.dart';

/// Оборачивает всё приложение: пока предохранитель открыт — сверху плашка
/// «Офлайн — учим локально». Онлайн — контент не трогаем.
///
/// Когда плашка показана, она сама уводит контент под статус-бар (SafeArea),
/// поэтому у дочерних экранов верхний отступ снимаем, чтобы не задваивать.
class ConnectivityShell extends ConsumerWidget {
  const ConnectivityShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offline = ref.watch(
      connectivityControllerProvider.select((s) => s.isOffline),
    );
    if (!offline) return child;

    return Column(
      children: [
        const _OfflineBanner(),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: child,
          ),
        ),
      ],
    );
  }
}

class _OfflineBanner extends ConsumerWidget {
  const _OfflineBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(connectivityControllerProvider);
    final theme = Theme.of(context);
    final tokens = context.remora;

    return Material(
      color: tokens.warningContainer,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.sm),
          child: Row(
            children: [
              Icon(Icons.cloud_off, size: 18, color: tokens.onWarningContainer),
              const SizedBox(width: RemoraSpacing.xs),
              Expanded(
                child: Text(
                  state.isManual
                      ? 'Офлайн-режим включён'
                      : 'Офлайн — учим локально',
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: tokens.onWarningContainer,
                  ),
                ),
              ),
              _action(context, ref, state),
            ],
          ),
        ),
      ),
    );
  }

  /// Фиксированная высота зоны действия — не скачет между режимами
  /// «выключить», «идёт проверка» и «повторить».
  static const double _actionHeight = RemoraSizes.minTouchTarget;

  Widget _action(BuildContext context, WidgetRef ref, NetState state) {
    final notifier = ref.read(connectivityControllerProvider.notifier);
    final tokens = context.remora;

    late final Widget content;
    if (state.isManual) {
      content = TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: const Size(
            RemoraSizes.minTouchTarget,
            RemoraSizes.minTouchTarget,
          ),
          textStyle: Theme.of(context).textTheme.labelSmall,
        ),
        onPressed: () => notifier.setManualOffline(false),
        child: const Text('Выключить'),
      );
    } else if (state.probing) {
      content = const SizedBox(
        width: 14,
        height: 14,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    } else {
      // Tooltip у IconButton требует Overlay-предка, а эта плашка рендерится
      // в MaterialApp.builder — вне Navigator, где Overlay ещё не создан.
      // Подпись для доступности даём через Semantics, а не tooltip.
      content = Semantics(
        button: true,
        label: 'Повторить',
        child: IconButton(
          icon: Icon(Icons.refresh, size: 20, color: tokens.onWarningContainer),
          onPressed: notifier.retry,
          constraints: const BoxConstraints(
            minWidth: RemoraSizes.minTouchTarget,
            minHeight: RemoraSizes.minTouchTarget,
          ),
          splashRadius: 24,
          visualDensity: VisualDensity.compact,
        ),
      );
    }

    return SizedBox(
      height: _actionHeight,
      child: Center(child: content),
    );
  }
}
