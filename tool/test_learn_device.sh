#!/usr/bin/env bash
set -euo pipefail
device_id=${1:?Укажите Android-устройство из adb devices}
cd "$(dirname "$0")/.."
project_dir=$(pwd)
test_dir=$(mktemp -d)
trap 'rm -rf -- "$test_dir"' EXIT

# На чистом дереве Flutter определяет удаляемый пакет по namespace до сборки APK.
# Изолируем оба идентификатора и Kotlin-классы лаунчера до первого вызова Flutter.
git ls-files --cached --others --exclude-standard -z -- android/app/src android/app/build.gradle.kts \
  android/build.gradle.kts android/settings.gradle.kts android/gradle.properties android/gradle/wrapper/gradle-wrapper.properties \
  assets lib integration_test pubspec.yaml pubspec.lock |
  tar --null -T - -cf - | tar -C "$test_dir" -xf -
cd "$test_dir"
test_package=ru.eduremora.learn_round_check
sed -i "s/ru\.eduremora\.remora_mobile/$test_package/g" android/app/build.gradle.kts
sed -i "s/^package ru\.eduremora\.remora_mobile$/package $test_package/" android/app/src/main/kotlin/ru/eduremora/remora_mobile/*.kt
sed -i 's/android:label="Запоминальня"/android:label="Проверка заучивания"/' android/app/src/main/AndroidManifest.xml
grep -Fq "namespace = \"$test_package\"" android/app/build.gradle.kts
grep -Fq "applicationId = \"$test_package\"" android/app/build.gradle.kts
# Обёртка Gradle может быть создана SDK только локально.
for file in android/gradlew android/gradle/wrapper/gradle-wrapper.jar; do
  if [[ -f "$project_dir/$file" ]]; then cp "$project_dir/$file" "$file"; fi
done
export NO_PROXY="127.0.0.1,localhost${NO_PROXY:+,$NO_PROXY}"
export no_proxy="$NO_PROXY"
flutter test -d "$device_id" --no-uninstall integration_test/learn_round_test.dart
adb -s "$device_id" uninstall "$test_package"
