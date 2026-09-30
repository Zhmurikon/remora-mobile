import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/auth_provider.dart';
import 'app_database.dart';

/// Отдельная база для каждого аккаунта. Смена пользователя пересоздаёт все
/// зависящие репозитории и исключает чтение/отправку чужого локального кэша.
final databaseProvider = Provider<AppDatabase>((ref) {
  final userId = ref.watch(authProvider.select((state) => state.user?.id));
  final db = userId == null
      ? AppDatabase.anonymous()
      : AppDatabase.forUser(userId);
  ref.onDispose(() => db.close());
  return db;
});
