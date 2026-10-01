import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/connectivity_controller.dart';
import '../data/preferences.dart';
import '../features/auth/auth_provider.dart';
import '../main.dart';
import 'theme.dart';

/// Настройки приложения и текущего аккаунта.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final manualOffline = ref.watch(
      connectivityControllerProvider.select((state) => state.isManual),
    );
    final autoDownload = ref.watch(autoDownloadEnabledProvider);
    final themeMode = ref.watch(themeModeProvider);
    final user = auth.user;
    final displayName = user?.displayName ?? user?.username ?? 'Пользователь';

    return SettingsView(
      displayName: displayName,
      email: user?.email,
      themeMode: themeMode,
      manualOffline: manualOffline,
      autoDownload: autoDownload,
      onThemeChanged: (mode) =>
          ref.read(themeModeProvider.notifier).state = mode,
      onManualOfflineChanged: ref
          .read(connectivityControllerProvider.notifier)
          .setManualOffline,
      onAutoDownloadChanged: ref.read(autoDownloadEnabledProvider.notifier).set,
      onOpenDownloads: () => _showDownloadsHint(context),
      onLogout: () => _confirmLogout(context, ref),
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выйти из аккаунта?'),
        content: const Text(
          'Скачанные материалы останутся на устройстве, но для входа понадобится сеть.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(authProvider.notifier).logout();
    }
  }

  void _showDownloadsHint(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Скачанные материалы',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                'Статус загрузки показан рядом с каждым набором. Курсы и связанные наборы загружаются автоматически, если включена автозагрузка.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    required this.displayName,
    required this.email,
    required this.themeMode,
    required this.manualOffline,
    required this.autoDownload,
    required this.onThemeChanged,
    required this.onManualOfflineChanged,
    required this.onAutoDownloadChanged,
    required this.onOpenDownloads,
    required this.onLogout,
    super.key,
  });

  final String displayName;
  final String? email;
  final AppThemeMode themeMode;
  final bool manualOffline;
  final bool autoDownload;
  final ValueChanged<AppThemeMode> onThemeChanged;
  final ValueChanged<bool> onManualOfflineChanged;
  final ValueChanged<bool> onAutoDownloadChanged;
  final VoidCallback onOpenDownloads;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            RemoraSpacing.lg,
            RemoraSpacing.sm,
            RemoraSpacing.lg,
            RemoraSpacing.xxl,
          ),
          children: [
            Text('Настройки', style: theme.textTheme.headlineLarge),
            const SizedBox(height: RemoraSpacing.md),
            Semantics(
              container: true,
              label: email == null
                  ? 'Профиль: $displayName'
                  : 'Профиль: $displayName, $email',
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.onPrimaryContainer,
                    child: Text(
                      _initials(displayName),
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: RemoraSpacing.md),
                  Expanded(
                    child: ExcludeSemantics(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium,
                          ),
                          if (email != null)
                            Text(
                              email!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: RemoraSpacing.xl),
            const _SectionTitle('Приложение'),
            Material(
              color: context.remora.surfaceMuted,
              borderRadius: BorderRadius.circular(RemoraRadii.card),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      RemoraSpacing.md,
                      RemoraSpacing.md,
                      RemoraSpacing.md,
                      RemoraSpacing.sm,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _SettingLabel(
                          icon: Icons.contrast_outlined,
                          title: 'Тема оформления',
                        ),
                        const SizedBox(height: RemoraSpacing.sm),
                        SegmentedButton<AppThemeMode>(
                          segments: const [
                            ButtonSegment(
                              value: AppThemeMode.system,
                              label: Text('Система'),
                            ),
                            ButtonSegment(
                              value: AppThemeMode.light,
                              label: Text('Светлая'),
                            ),
                            ButtonSegment(
                              value: AppThemeMode.dark,
                              label: Text('Тёмная'),
                            ),
                          ],
                          selected: {themeMode},
                          showSelectedIcon: false,
                          onSelectionChanged: (selection) =>
                              onThemeChanged(selection.first),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    secondary: const Icon(Icons.flight_outlined),
                    title: const Text('Работать офлайн'),
                    subtitle: const Text(
                      'Не обращаться к серверу — учить только скачанное',
                    ),
                    value: manualOffline,
                    onChanged: onManualOfflineChanged,
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    secondary: const Icon(Icons.download_outlined),
                    title: const Text('Автоматическая загрузка'),
                    subtitle: const Text(
                      'Скачивать новые курсы и наборы для офлайна',
                    ),
                    value: autoDownload,
                    onChanged: onAutoDownloadChanged,
                  ),
                  const Divider(height: 1),
                  const SwitchListTile(
                    secondary: Icon(Icons.notifications_outlined),
                    title: Text('Уведомления'),
                    subtitle: Text('Появятся в следующей версии'),
                    value: false,
                    onChanged: null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: RemoraSpacing.xl),
            const _SectionTitle('Данные'),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: RemoraSpacing.sm,
              ),
              leading: const Icon(Icons.storage_outlined),
              title: const Text('Скачанные материалы'),
              subtitle: const Text(
                'Управляйте загрузками во вкладках «Курсы» и «Наборы»',
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: onOpenDownloads,
            ),
            const SizedBox(height: RemoraSpacing.xl),
            const _SectionTitle('Аккаунт'),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: RemoraSpacing.sm,
              ),
              textColor: theme.colorScheme.error,
              iconColor: theme.colorScheme.error,
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Выйти из аккаунта'),
              onTap: onLogout,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingLabel extends StatelessWidget {
  const _SettingLabel({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: RemoraSpacing.md),
        Expanded(child: Text(title)),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: RemoraSpacing.sm),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

String _initials(String value) {
  final parts = value.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty || parts.first.isEmpty) return 'Р';
  return parts
      .take(2)
      .map((part) => part.characters.first)
      .join()
      .toUpperCase();
}
