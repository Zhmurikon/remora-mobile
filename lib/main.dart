import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
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

final themeModeProvider =
    StateProvider<AppThemeMode>((ref) => AppThemeMode.system);

class RemoraApp extends ConsumerWidget {
  const RemoraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Remora',
      debugShowCheckedModeBanner: false,
      theme: remoraLightTheme(),
      darkTheme: remoraDarkTheme(),
      themeMode: switch (mode) {
        AppThemeMode.system => ThemeMode.system,
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
      },
      routerConfig: router,
    );
  }
}
