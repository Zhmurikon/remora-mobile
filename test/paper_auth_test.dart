import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/router.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/data/api_client.dart';

class _RegistrationApi extends Fake implements RemoraApiClient {
  @override
  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {}
}

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('Вход и регистрация в ${brightness.name} теме', (tester) async {
      FlutterSecureStorage.setMockInitialValues({});
      final container = ProviderContainer(
        overrides: [apiClientProvider.overrideWithValue(_RegistrationApi())],
      );
      addTearDown(container.dispose);
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            theme: remoraLightTheme(),
            darkTheme: remoraDarkTheme(),
            themeMode: brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            routerConfig: container.read(routerProvider),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final signIn = find.widgetWithText(FilledButton, 'Войти');
      final scheme = Theme.of(tester.element(signIn)).colorScheme;
      expect(
        scheme.primary,
        brightness == Brightness.dark
            ? const Color(0xFFAAC1FF)
            : const Color(0xFF284BB2),
      );
      for (final (ink, background) in [
        (scheme.onSurface, scheme.surface),
        (scheme.onSurfaceVariant, scheme.surface),
        (scheme.onPrimary, scheme.primary),
        (scheme.error, scheme.surfaceContainerLowest),
      ]) {
        final values = [ink.computeLuminance(), background.computeLuminance()]
          ..sort();
        expect(
          (values.last + 0.05) / (values.first + 0.05),
          greaterThanOrEqualTo(4.5),
        );
      }
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      expect(find.text('Введите email'), findsOneWidget);
      expect(find.text('Введите пароль'), findsOneWidget);

      await tester.tap(find.text('Нет аккаунта? Зарегистрироваться'));
      await tester.pumpAndSettle();
      final fields = find.byType(TextFormField);
      for (final (index, value) in [
        'test@example.com',
        'reader',
        'password123',
        'password123',
      ].indexed) {
        await tester.enterText(fields.at(index), value);
      }
      final register = find.widgetWithText(FilledButton, 'Зарегистрироваться');
      await tester.ensureVisible(register);
      await tester.tap(register);
      await tester.pumpAndSettle();
      final notice = find.text(
        'Проверьте почту и подтвердите email, затем войдите.',
      );
      expect(tester.widget<Text>(notice).style?.color, scheme.primary);
      expect(tester.takeException(), isNull);
    });
  }
}
