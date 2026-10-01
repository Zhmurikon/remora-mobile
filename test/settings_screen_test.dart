import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/home_screen.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/main.dart';

void main() {
  Future<void> pumpSettings(
    WidgetTester tester, {
    ThemeMode brightness = ThemeMode.light,
    double textScale = 1,
    String email = 'konkovyuriy485@gmail.com',
    ValueChanged<AppThemeMode>? onThemeChanged,
    ValueChanged<bool>? onManualOfflineChanged,
    ValueChanged<bool>? onAutoDownloadChanged,
    VoidCallback? onOpenDownloads,
    VoidCallback? onLogout,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: remoraLightTheme(),
        darkTheme: remoraDarkTheme(),
        themeMode: brightness,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: SettingsView(
          displayName: 'yuriy',
          email: email,
          themeMode: AppThemeMode.system,
          manualOffline: false,
          autoDownload: true,
          onThemeChanged: onThemeChanged ?? (_) {},
          onManualOfflineChanged: onManualOfflineChanged ?? (_) {},
          onAutoDownloadChanged: onAutoDownloadChanged ?? (_) {},
          onOpenDownloads: onOpenDownloads ?? () {},
          onLogout: onLogout ?? () {},
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('показывает профиль и все группы настроек', (tester) async {
    await pumpSettings(tester);

    expect(find.text('Настройки'), findsOneWidget);
    expect(find.text('yuriy'), findsOneWidget);
    expect(find.text('Приложение'), findsOneWidget);
    expect(find.byType(SegmentedButton<AppThemeMode>), findsOneWidget);
    expect(find.text('Работать офлайн'), findsOneWidget);
    expect(find.text('Автоматическая загрузка'), findsOneWidget);
    expect(find.text('Уведомления'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Аккаунт'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Данные'), findsOneWidget);
    expect(find.text('Аккаунт'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('длинный email и масштаб 1,3 не ломают экран в обеих темах', (
    tester,
  ) async {
    const longEmail =
        'very.long.account.name.for.mobile.settings@example.remora.com.ru';
    await pumpSettings(tester, email: longEmail, textScale: 1.3);
    expect(find.text(longEmail), findsOneWidget);
    expect(tester.takeException(), isNull);

    await pumpSettings(
      tester,
      email: longEmail,
      textScale: 1.3,
      brightness: ThemeMode.dark,
    );
    expect(find.text('Настройки'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('контролы вызывают действия, уведомления недоступны', (
    tester,
  ) async {
    AppThemeMode? selectedTheme;
    bool? offline;
    bool? autoDownload;
    var downloadsOpened = false;
    var logoutCalled = false;
    await pumpSettings(
      tester,
      onThemeChanged: (value) => selectedTheme = value,
      onManualOfflineChanged: (value) => offline = value,
      onAutoDownloadChanged: (value) => autoDownload = value,
      onOpenDownloads: () => downloadsOpened = true,
      onLogout: () => logoutCalled = true,
    );

    await tester.tap(find.text('Тёмная'));
    expect(selectedTheme, AppThemeMode.dark);

    await tester.tap(find.text('Работать офлайн'));
    expect(offline, isTrue);

    await tester.tap(find.text('Автоматическая загрузка'));
    expect(autoDownload, isFalse);

    await tester.scrollUntilVisible(
      find.text('Скачанные материалы'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Скачанные материалы'));
    expect(downloadsOpened, isTrue);

    await tester.scrollUntilVisible(
      find.text('Выйти из аккаунта'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Выйти из аккаунта'));
    expect(logoutCalled, isTrue);

    final notificationTile = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Уведомления'),
    );
    expect(notificationTile.onChanged, isNull);
  });
}
