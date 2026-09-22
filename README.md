# Remora Mobile

Мобильный клиент [Remora](https://github.com/Zhmurikon/remora) — платформы для заучивания через карточки.

**Стек:** Flutter (Dart), Android-first, offline-first.

**Статус:** M0 — каркас. Этапы — [`docs/12-mobile.md`](https://github.com/Zhmurikon/remora/blob/main/docs/12-mobile.md).

## Разработка

```bash
flutter pub get
flutter run           # на подключённом устройстве или эмуляторе
flutter test          # тесты
flutter build apk     # debug APK
```

## Структура

```
lib/
├── app/         точка входа, тема, роутинг
├── core/        Dart-порт ядра: answers, fsrs, distractors, format
├── data/        Drift-схема, репозитории, API-клиент, secure storage
├── features/    auth, library, study, courses, settings
└── shared/      рендер контента, общие виджеты
```

## Требования

- Flutter 3.44+ (Dart 3.12+)
- Android SDK 36, minSdk 24
- Java JDK 17+

## Подключение к основному репозиторию

Этот репозиторий подключается как git-submodule в `apps/mobile` основного репозитория `remora`.
