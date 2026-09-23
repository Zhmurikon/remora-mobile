import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/connectivity_controller.dart';
import '../data/preferences.dart';
import '../features/auth/auth_provider.dart';
import '../main.dart';
import 'brand_logo.dart';

/// Экран-заглушка M1 — показывает профиль авторизованного пользователя.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final manualOffline = ref.watch(
      connectivityControllerProvider.select((s) => s.isManual),
    );
    final autoDownload = ref.watch(autoDownloadEnabledProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const RemoraLogo(width: 112),
        actions: [
          IconButton(
            tooltip: 'Переключить тему',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state = isDark
                  ? AppThemeMode.light
                  : AppThemeMode.dark;
            },
          ),
          IconButton(
            tooltip: 'Выйти',
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RemoraMark(),
              const SizedBox(height: 24),
              Text('Remora', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              if (auth.user != null) ...[
                Text(auth.user!.username, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  auth.user!.email ?? '',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              const SizedBox(height: 32),
              Text(
                'Авторизация работает (M1)',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Библиотека и обучение — на следующих этапах',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Работать офлайн'),
                      subtitle: const Text(
                        'Не обращаться к серверу — учить только локально',
                      ),
                      value: manualOffline,
                      onChanged: (value) => ref
                          .read(connectivityControllerProvider.notifier)
                          .setManualOffline(value),
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Автоматически скачивать для офлайна'),
                      subtitle: const Text(
                        'Курсы и наборы будут сами загружаться в фоне при '
                        'запуске приложения',
                      ),
                      value: autoDownload,
                      onChanged: (value) => ref
                          .read(autoDownloadEnabledProvider.notifier)
                          .set(value),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
