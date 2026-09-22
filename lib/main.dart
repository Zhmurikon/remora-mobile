import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: RemoraApp(),
    ),
  );
}

/// Провайдер текущей темы: system / light / dark.
enum AppThemeMode { system, light, dark }

final themeModeProvider = StateProvider<AppThemeMode>((ref) => AppThemeMode.system);

class RemoraApp extends ConsumerWidget {
  const RemoraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Remora',
      debugShowCheckedModeBanner: false,
      theme: remoraLightTheme(),
      darkTheme: remoraDarkTheme(),
      themeMode: switch (mode) {
        AppThemeMode.system => ThemeMode.system,
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
      },
      home: const HomeScreen(),
    );
  }
}

/// Экран-заглушка M0 — показывает, что приложение работает,
/// тема переключается, знак отображается.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Remora'),
        actions: [
          IconButton(
            tooltip: 'Переключить тему',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? AppThemeMode.light : AppThemeMode.dark;
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Знак Remora — заглушка (будет flutter_svg из remora-mark.svg)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.school,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Remora',
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Заучивание через карточки',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              Text(
                'Каркас приложения (M0)',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Светлая и тёмная тема из токенов',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
