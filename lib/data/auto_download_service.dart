import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/log.dart';
import '../features/courses/courses_provider.dart';
import '../features/library/library_provider.dart';
import 'db/app_database.dart';
import 'repositories/course_repository.dart';
import 'repositories/set_repository.dart';

/// Фоновое автоскачивание библиотеки для офлайна.
///
/// Раньше нужно было зайти в каждый набор и курс (или нажать «Скачать» в
/// библиотеке) вручную. Теперь при запуске приложения и при восстановлении
/// связи сервис сам подтягивает новое и изменившееся содержимое: новые
/// наборы, новые курсы вместе с их разделами/статьями и наборы карточек,
/// на которые ссылаются статьи курса (иначе встроенный квиз в статье не
/// откроется офлайн). Неизменившееся содержимое повторно не скачиваем.
///
/// Тихий и best-effort: одна неудача (сеть пропала на середине) не должна
/// ронять весь проход — следующий набор или курс всё равно попробуем.
class AutoDownloadService {
  AutoDownloadService(this._sets, this._courses);

  final SetRepository _sets;
  final CourseRepository _courses;

  bool _running = false;

  /// Скачать всё новое. Безопасно вызывать повторно — параллельные вызовы
  /// схлопываются в один проход.
  Future<void> run() async {
    if (_running) return;
    _running = true;
    try {
      await _downloadNewSets();
      await _downloadNewCourses();
    } catch (e) {
      logRemora('autodownload', 'проход прерван: $e');
    } finally {
      _running = false;
    }
  }

  Future<void> _downloadNewSets() async {
    final List<SetRecord> sets;
    try {
      sets = await _sets.syncMySets();
    } catch (_) {
      return; // сети нет — фоновое скачивание просто ждёт следующего триггера
    }

    final downloaded = await _sets.getDownloadedSetIds();
    final outdated = await _sets.getOutdatedDownloadedSetIds();
    var added = 0;
    for (final set in sets) {
      if (downloaded.contains(set.id) && !outdated.contains(set.id)) continue;
      if (await _downloadSetSafely(set.id)) added++;
    }
    if (added > 0) logRemora('autodownload', 'наборы: скачано $added новых');
  }

  Future<void> _downloadNewCourses() async {
    final List<CourseRecord> courses;
    try {
      courses = await _courses.syncMyCourses();
    } catch (_) {
      return;
    }

    final outdated = await _courses.getOutdatedDownloadedCourseIds();
    var added = 0;
    for (final course in courses) {
      final id = course.id;
      if (await _courses.hasDownloadedContent(id) && !outdated.contains(id)) {
        continue;
      }

      try {
        final detail = await _courses.downloadCourse(id);
        added++;
        // Наборы карточек, на которые ссылаются статьи курса — без них
        // встроенный квиз в статье не откроется офлайн.
        final setIds = <String>{
          for (final section in detail.sections)
            for (final article in section.articles) article.setId,
        };
        for (final setId in setIds) {
          await _downloadSetSafely(setId);
        }
      } catch (_) {
        // Пропускаем курс, следующий проход попробует снова.
      }
    }
    if (added > 0) logRemora('autodownload', 'курсы: скачано $added новых');
  }

  Future<bool> _downloadSetSafely(String setId) async {
    try {
      await _sets.downloadSet(setId);
      return true;
    } catch (_) {
      return false;
    }
  }
}

final autoDownloadServiceProvider = Provider<AutoDownloadService>((ref) {
  return AutoDownloadService(
    ref.watch(setRepositoryProvider),
    ref.watch(courseRepositoryProvider),
  );
});
