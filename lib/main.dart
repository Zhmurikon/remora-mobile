import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'data/auto_download_service.dart';
import 'data/connectivity_controller.dart';
import 'data/preferences.dart';
import 'data/repositories/outbox_service.dart';
import 'features/auth/auth_provider.dart';
import 'features/connectivity/offline_banner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const RemoraApp(),
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

    // Связь восстановилась — досылаем накопленные ответы из outbox и
    // подхватываем автоскачивание, если оно не успело пройти офлайн.
    ref.listen(connectivityControllerProvider, (prev, next) {
      final recovered = (prev?.isOffline ?? false) && !next.isOffline;
      if (recovered) {
        ref.read(outboxServiceProvider).flush();
        if (ref.read(autoDownloadEnabledProvider)) {
          unawaited(ref.read(autoDownloadServiceProvider).run());
        }
      }
    });

    // Вход выполнен (в т.ч. восстановлен из хранилища при запуске) —
    // фоном подтягиваем всё новое для офлайна, если тумблер включён.
    ref.listen(authProvider, (prev, next) {
      final justAuthenticated = next.status == AuthStatus.authenticated &&
          prev?.status != AuthStatus.authenticated;
      if (justAuthenticated && ref.read(autoDownloadEnabledProvider)) {
        unawaited(ref.read(autoDownloadServiceProvider).run());
      }
    });

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
      builder: (context, child) =>
          ConnectivityShell(child: child ?? const SizedBox.shrink()),
    );
  }
}
