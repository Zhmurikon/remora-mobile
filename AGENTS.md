# AGENTS.md — работа над мобильным приложением Remora

Практический гид для агентов и разработчиков по `apps/mobile` (Flutter). Продуктовая
спецификация и решения — в [`docs/12-mobile.md`](../../docs/12-mobile.md). Общие правила
проекта — в корневом [`CLAUDE.md`](../../CLAUDE.md). Прогресс задач — в корневом `TODO.md`.

`apps/mobile` — **отдельный git-сабмодуль** (ветка `main`), а не часть основного репозитория.
Коммитить приходится дважды: сначала в сабмодуле, потом сдвиг указателя в родителе.

## Команды

```bash
flutter pub get                     # зависимости
flutter analyze                     # линт (см. «Известные info» ниже)
flutter test                        # тесты — СНАЧАЛА выставить NO_PROXY, см. ниже
dart run build_runner build --delete-conflicting-outputs   # кодоген Drift (*.g.dart)
flutter build apk --release         # APK → build/app/outputs/flutter-apk/app-release.apk
```

**Прогон тестов — обязательный костыль окружения.** В системе заданы прокси
(`HTTP_PROXY=http://127.0.0.1:3128`, `ALL_PROXY=socks5://127.0.0.1:9998`), которые перехватывают
localhost-вебсокет тест-раннера Flutter и роняют его (502 + segfault на загрузке). Перед каждым
`flutter test`:

```bash
export NO_PROXY="127.0.0.1,localhost" no_proxy="127.0.0.1,localhost"
flutter test
```

## Архитектура

Offline-first: экраны читают из локальной БД (Drift), сеть — фоном. Слои:

- **UI** — экраны в `lib/features/*`, Riverpod для состояния (`StateNotifierProvider`,
  `StateProvider`, `family`). Навигация — `go_router` (`lib/app/router.dart`).
- **Данные** — `lib/data`: `RemoraApiClient` (ручной dio-клиент, `api_client.dart`),
  репозитории (`lib/data/repositories`), БД (`lib/data/db`).
- **Доменное ядро** — `lib/core`: Dart-порт FSRS (`fsrs.dart`), нормализация ответов,
  доменные типы (`domain.dart`). Обязаны совпадать с сервером (см. ниже).

**Серверное состояние** — TanStack-подобных нет; свои репозитории + Riverpod. Локальное
состояние сессии обучения — в `StudySessionNotifier`.

### Ключевые правила

- **Ручной API-клиент.** Приложение ходит через `RemoraApiClient` в `lib/data/api_client.dart`.
  Есть сгенерированный dart-dio клиент в `lib/data/api/generated/` — он **не используется**
  экранами, не трогать его как источник правды.
- **Контракт клиент↔сервер.** Dart-модели зеркалят Pydantic-схемы из `apps/api/app/schemas/`.
  Меняешь эндпоинт — сверяй обе стороны, не угадывай поля.
- **FSRS-порт совпадает с сервером до миллисекунды.** `lib/core/fsrs.dart` проверяется золотыми
  фикстурами `packages/core/src/fsrs-cases.json` в `test/fsrs_test.dart`. Параметры/шаги менять
  только вместе с сервером (`app/services/scheduler.py`) и перегенерацией фикстур.
- **Ответы нельзя терять.** Ответы сперва пишутся в Drift (`review_outbox`), потом батчами
  идемпотентно по `client_review_id`. Очередь не чистится до подтверждения сервером.
- **Цвета — через токены/тему**, тёмная тема обязана работать. Тексты интерфейса — на русском.
  Комментарии — на русском, объясняют «почему».

## Офлайн-подсистема (что где лежит)

- **Outbox.** `lib/data/repositories/outbox_service.dart` + `study_repository.dart`. Enqueue
  локально, flush батчами; при сбое — bump попыток, остаёмся в очереди. На успехе сервер
  возвращает состояния — перезаписываем локальные (`step` не трогаем — он локальный для
  офлайн-планировщика learning).
- **Офлайн-очередь.** `StudyRepository.buildOfflineQueue` — собирает очередь из `cards` +
  `card_states` через Dart-порт FSRS, зеркаля серверный `get_queue` (scope=due, интерливинг
  новых с просроченными, `_separate_neighbours`). `StudySessionNotifier.begin` при сбое сети
  падает в неё вместо ошибки. Онлайн-сессия кэширует набор (`cacheQueueCards`,
  `persistQueueStates`, `saveStudySettings` в `sync_meta`), каждый ответ — `applyLocalReview`.
- **Предохранитель связи (circuit breaker).** `lib/data/connectivity_controller.dart` +
  `circuit_breaker_interceptor.dart`. Единый источник правды `online`/`offline`/ручной. После
  двух сетевых сбоев подряд размыкается → интерцептор замыкает чтения мгновенно (0 мс). Проба
  `GET /api/v1/health` (отдельный Dio без интерцепторов, короткий таймаут) с бэкоффом 30с→1м→2м,
  событие `connectivity_plus`, кнопка «Повторить». На возврат в онлайн — флаш outbox (listener в
  `main.dart`). UI: `features/connectivity/offline_banner.dart` (плашка + `builder` у
  `MaterialApp.router`) и тумблер в профиле (`app/home_screen.dart`).
- **Офлайн-авторизация.** `lib/features/auth/auth_provider.dart` +
  `auth_interceptor.dart` + `auth_errors.dart`. `isSessionRejection(error)` отличает отказ
  сервера (401/403 → выход, чистим токен) от сетевого сбоя (остаёмся в сессии, токен и
  кэш-профиль сохраняем). Профиль кэшируется в secure storage (`token_storage.dart`).

## Диагностический лог

`lib/core/log.dart` — `logRemora(area, message)` через `debugPrint` (виден и в release).
Префиксы: `remora.auth`, `remora.net`, `remora.study`. Сетевые запросы логирует
`lib/data/logging_interceptor.dart`: `METHOD путь → статус (N мс)` — на медленной сети таймауты
видны как большие числа (`✗ connectionTimeout (10002 мс)`).

## Отладка на физическом телефоне (Android)

Реальное устройство — главный способ проверить сетевые сценарии (офлайн, дропы пакетов).
Проверенное устройство — Pixel 7 Pro (id и прочее — в `secrets.md`).

**1. Подключение.** На телефоне: «Режим разработчика» (7 тапов по «Номер сборки») → «Отладка по
USB». Подключить кабель. `adb` — в `~/Android/Sdk/platform-tools/` (в PATH пользователя, но НЕ
root: `sudo adb` не найдёт команду).

**2. Права adb на Linux (udev).** Если `adb devices` показывает `no permissions`:

```bash
lsusb   # найти телефон, взять idVendor (Pixel/Google = 18d1)
sudo tee /etc/udev/rules.d/51-android.rules >/dev/null <<'EOF'
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
EOF
sudo udevadm control --reload-rules && sudo udevadm trigger
# переткнуть кабель; на телефоне подтвердить «Разрешить отладку по USB?»
adb kill-server && adb start-server && adb devices   # → должно быть "<id>  device"
```

**3. Установка/обновление сборки.**

```bash
flutter build apk --release
adb install -r build/app/outputs/flutter-apk/app-release.apk   # -r сохраняет данные
```

APK подписан отладочным ключом (`CN=Android Debug`) → ставится сайдлоадом. applicationId —
`ru.eduremora.remora_mobile`. Обновлять на устройстве обязательно перед проверкой логов: старая
сборка не содержит нового кода/логов.

**4. Логи.**

```bash
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
flutter logs                                  # поток; либо:
adb logcat -d -s flutter:I | grep remora      # дамп + фильтр по нашему логу
```

**5. Перезапуск и скриншот.**

```bash
adb shell am force-stop ru.eduremora.remora_mobile
adb shell monkey -p ru.eduremora.remora_mobile -c android.intent.category.LAUNCHER 1
adb exec-out screencap -p > screen.png
```

**Проверка предохранителя вживую.** Чистый старт в деградированной сети → в логах два таймаута
(~10 с каждый) → `[remora.net] два сбоя подряд — уходим в офлайн` → плашка «Офлайн — учим
локально», сессия и офлайн-обучение работают, из аккаунта не выкидывает.

## Карта ключевых файлов

```
lib/main.dart                         корень: MaterialApp.router, плашка офлайна, флаш outbox
lib/app/router.dart                   маршруты go_router
lib/app/home_screen.dart              профиль (заглушка) + тумблер «Работать офлайн»
lib/core/fsrs.dart                    Dart-порт FSRS (совпадает с сервером)
lib/core/domain.dart                  доменные типы (Rating, CardState, константы)
lib/core/log.dart                     logRemora — диагностический лог
lib/data/api_client.dart              RemoraApiClient + dioProvider (порядок интерцепторов)
lib/data/connectivity_controller.dart предохранитель связи (машина состояний)
lib/data/circuit_breaker_interceptor.dart  короткое замыкание чтений
lib/data/logging_interceptor.dart     лог сетевых запросов
lib/data/db/app_database.dart         Drift-схема (sets, cards, card_states, review_outbox,
                                      sync_meta, courses/sections/articles), миграции
lib/data/repositories/                set/study/course/outbox репозитории
lib/features/auth/                    auth_provider, auth_interceptor, auth_errors, token_storage
lib/features/study/                   режимы, тест, результаты, study_provider (begin/answer)
lib/features/courses/                 чтение теории (рендер markdown-whitelist)
lib/features/connectivity/offline_banner.dart  плашка офлайна + shell
test/                                 fsrs, answers, offline_queue, connectivity_controller,
                                      auth_errors, course, api_models, article_content, study
```

## Известные info в analyze (осознанно оставлены)

`prefer_initializing_formals` в `auth_interceptor.dart` и `connectivity_controller.dart` —
на именованных приватных полях-колбэках. Автофикс (`this._x`) невозможен: именованный параметр не
может начинаться с `_`. Это не баги.

## Гайдлайны при изменениях

- Меняешь схему Drift → подними `schemaVersion`, добавь миграцию в `onUpgrade`, прогони
  `build_runner`.
- Меняешь эндпоинты/модели → сверь с `apps/api/app/schemas/`, при изменении OpenAPI —
  перегенерация и коммит схемы (правило проекта).
- Трогаешь FSRS-параметры → только вместе с сервером + перегенерация фикстур, иначе `fsrs_test`
  красный.
- Любой новый ресурс → тест на права доступа (чужой пользователь не получает чужое).
- После задачи — предложить коммит (сабмодуль + указатель в родителе), не коммитить без явного
  согласия. Автор коммита — только пользователь, без упоминаний ИИ; сообщение — русское, одной
  строкой (см. корневой `CLAUDE.md`).
