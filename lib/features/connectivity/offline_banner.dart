import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final scheme = theme.colorScheme;

    return Material(
      color: scheme.secondaryContainer,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Row(
            children: [
              Icon(Icons.cloud_off, size: 14, color: scheme.onSecondaryContainer),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  state.isManual
                      ? 'Офлайн-режим включён'
                      : 'Офлайн — учим локально',
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: scheme.onSecondaryContainer),
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
  static const double _actionHeight = 24;

  Widget _action(BuildContext context, WidgetRef ref, NetState state) {
    final notifier = ref.read(connectivityControllerProvider.notifier);
    final scheme = Theme.of(context).colorScheme;

    late final Widget content;
    if (state.isManual) {
      content = TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
          icon:
              Icon(Icons.refresh, size: 16, color: scheme.onSecondaryContainer),
          onPressed: notifier.retry,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 28, minHeight: 24),
          splashRadius: 16,
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
