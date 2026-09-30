import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../features/auth/auth_provider.dart';

/// Управляемый файловый кэш медиа для гарантированного офлайн-доступа.
/// Ключ задаётся идентификатором сущности, поэтому ротация подписанной ссылки
/// не создаёт новую копию файла.
class MediaCache {
  MediaCache(this._dio, this._userId, [this._rootDirectory]);

  final Dio _dio;
  final String _userId;
  final Directory? _rootDirectory;

  Future<String?> download(String url, {required String key}) async {
    if (url.isEmpty) return null;
    try {
      final root = _rootDirectory ?? await getApplicationSupportDirectory();
      final dir = Directory(p.join(root.path, 'media', _safe(_userId)));
      await dir.create(recursive: true);
      final extension = _extension(url);
      final file = File(p.join(dir.path, '${_safe(key)}$extension'));
      if (await file.exists() && await file.length() > 0) return file.path;

      final temporary = File('${file.path}.part');
      await _dio.download(url, temporary.path);
      if (!await temporary.exists() || await temporary.length() == 0) {
        await temporary.delete().catchError((_) => temporary);
        return null;
      }
      await temporary.rename(file.path);
      return file.path;
    } catch (_) {
      return null;
    }
  }

  String _extension(String url) {
    final path = Uri.tryParse(url)?.path.toLowerCase() ?? '';
    for (final extension in const [
      '.svg',
      '.png',
      '.jpg',
      '.jpeg',
      '.webp',
      '.gif',
    ]) {
      if (path.endsWith(extension)) return extension;
    }
    return '.img';
  }

  String _safe(String value) =>
      value.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
}

final mediaCacheProvider = Provider<MediaCache?>((ref) {
  final userId = ref.watch(authProvider.select((state) => state.user?.id));
  if (userId == null) return null;
  return MediaCache(Dio(), userId);
});
