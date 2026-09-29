import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/connectivity_controller.dart';
import '../data/preferences.dart';
import '../features/auth/auth_provider.dart';
import '../main.dart';

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

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 26,
                child: Text(_initials(displayName)),
              ),
              title: Text(
                displayName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: user?.email == null ? null : Text(user!.email!),
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle('Приложение'),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.contrast_outlined),
                          SizedBox(width: 16),
                          Text('Тема оформления'),
                        ],
                      ),
                      const SizedBox(height: 12),
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
                        onSelectionChanged: (selection) {
                          ref.read(themeModeProvider.notifier).state =
                              selection.first;
                        },
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
                  onChanged: (value) => ref
                      .read(connectivityControllerProvider.notifier)
                      .setManualOffline(value),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.download_outlined),
                  title: const Text('Автоматическая загрузка'),
                  subtitle: const Text(
                    'Скачивать новые курсы и наборы для офлайна',
                  ),
                  value: autoDownload,
                  onChanged: (value) =>
                      ref.read(autoDownloadEnabledProvider.notifier).set(value),
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
          const SizedBox(height: 22),
          const _SectionTitle('Данные'),
          Card(
            child: ListTile(
              leading: const Icon(Icons.storage_outlined),
              title: const Text('Скачанные материалы'),
              subtitle: const Text(
                'Управляйте загрузками во вкладках «Курсы» и «Наборы»',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showDownloadsHint(context),
            ),
          ),
          const SizedBox(height: 22),
          const _SectionTitle('Аккаунт'),
          Card(
            child: ListTile(
              textColor: Theme.of(context).colorScheme.error,
              iconColor: Theme.of(context).colorScheme.error,
              leading: const Icon(Icons.logout),
              title: const Text('Выйти из аккаунта'),
              onTap: () => _confirmLogout(context, ref),
            ),
          ),
        ],
      ),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
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
