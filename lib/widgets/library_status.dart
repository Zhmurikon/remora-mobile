import 'package:flutter/material.dart';

import '../app/theme.dart';

class LibraryDownloadIcon extends StatelessWidget {
  const LibraryDownloadIcon({
    required this.downloaded,
    required this.downloading,
    required this.outdated,
    required this.online,
    required this.onDownload,
    super.key,
  });

  final bool downloaded;
  final bool downloading;
  final bool outdated;
  final bool online;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (downloading) {
      return const SizedBox.square(
        dimension: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          semanticsLabel: 'Идёт загрузка',
        ),
      );
    }
    final (icon, label) = outdated
        ? (Icons.sync_rounded, 'Обновить офлайн-копию')
        : downloaded
        ? (Icons.download_done_rounded, 'Доступен офлайн')
        : online
        ? (Icons.download_rounded, 'Скачать для офлайна')
        : (Icons.cloud_outlined, 'Только онлайн');
    if (online && (outdated || !downloaded)) {
      return IconButton(
        onPressed: onDownload,
        tooltip: label,
        iconSize: 18,
        icon: Icon(icon),
        color: outdated ? context.remora.warning : scheme.primary,
      );
    }
    return Icon(
      icon,
      size: 16,
      color: scheme.onSurfaceVariant,
      semanticLabel: label,
    );
  }
}

class LibraryStatusFooter extends StatelessWidget {
  const LibraryStatusFooter({
    required this.savedLabel,
    required this.downloaded,
    required this.outdated,
    required this.hasUpdates,
    super.key,
  });

  final String? savedLabel;
  final bool downloaded;
  final bool outdated;
  final bool hasUpdates;

  @override
  Widget build(BuildContext context) {
    final lines = [
      ?savedLabel,
      if (outdated)
        'Для офлайн-копии доступно обновление.'
      else if (downloaded)
        'Скачано на устройство. Доступно без интернета.',
      if (hasUpdates) 'У автора есть непринятое обновление.',
    ];
    if (lines.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: RemoraSpacing.lg),
      child: Text(
        lines.join('\n'),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
