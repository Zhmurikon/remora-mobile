import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'db/app_database.dart';
import 'db/database_provider.dart';
import 'media_cache.dart';

/// Сверяет файловый медиакэш с актуальными ссылками в пользовательской БД.
class OfflineCacheMaintenance {
  OfflineCacheMaintenance(this._db, this._mediaCache);

  final AppDatabase _db;
  final MediaCache? _mediaCache;

  Future<void> pruneMedia() async {
    final cache = _mediaCache;
    if (cache == null) return;
    final referenced = <String>{};
    for (final card in await _db.select(_db.cards).get()) {
      for (final path in [card.termImageUrl, card.definitionImageUrl]) {
        if (path != null && path.startsWith('/')) referenced.add(path);
      }
    }
    for (final article in await _db.select(_db.courseArticles).get()) {
      try {
        final items = jsonDecode(article.mediaJson) as List;
        for (final item in items.whereType<Map>()) {
          final path = item['local_path'];
          if (path is String && path.startsWith('/')) referenced.add(path);
        }
      } catch (_) {
        // Повреждённая запись не должна блокировать очистку остального кэша.
      }
    }
    await cache.prune(referenced);
  }
}

final offlineCacheMaintenanceProvider = Provider<OfflineCacheMaintenance>((
  ref,
) {
  return OfflineCacheMaintenance(
    ref.watch(databaseProvider),
    ref.watch(mediaCacheProvider),
  );
});
