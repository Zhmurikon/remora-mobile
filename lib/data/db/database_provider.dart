import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';

/// Синглтон базы данных.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});
