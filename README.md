# «Запоминальня» для Android

Мобильный клиент «Запоминальни» — платформы для заучивания через карточки.

**Стек:** Flutter (Dart), Android-first, offline-first.

В версии 0.2.0 на главной доступно меню «Разделы кабинета». Оно открывает ИИ-помощник, классы, достижения, подписку и сохранённые статьи. Оплату подтверждает ЮKassa. Скачанные наборы и режимы офлайн-обучения доступны через прежние вкладки. Этапы разработки — [`docs/12-mobile.md`](https://github.com/Zhmurikon/remora/blob/main/docs/12-mobile.md).

В версии 0.2.1 у приложения синий знак из шапки сайта. Он виден на рабочем столе, при запуске, на главной и в формах входа и регистрации. Поддерживаются тематические иконки Android.

## Разработка

```bash
flutter pub get
flutter run           # на подключённом устройстве или эмуляторе
flutter test          # тесты
flutter build apk --release
```

Для проверки с локальным Docker Compose выполните `adb reverse tcp:3000 tcp:3000`, `adb reverse tcp:9100 tcp:9100` и `flutter run --dart-define=REMORA_API_URL=http://127.0.0.1:3000`. Обычная сборка использует `https://zapominalnya.ru`.

## Структура

```
lib/
├── app/         точка входа, тема, роутинг
├── core/        Dart-порт ядра: answers, fsrs, distractors, format
├── data/        Drift-схема, репозитории, API-клиент, secure storage
├── features/    учебные экраны, авторизация и разделы кабинета
└── widgets/      рендер контента, общие виджеты
```

## Требования

- Flutter 3.44+ (Dart 3.12+)
- Android SDK 36, minSdk 24
- Java JDK 17+

## Подключение к основному репозиторию

Этот репозиторий подключается как git-submodule в `apps/mobile` основного репозитория `remora`.
