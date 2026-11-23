import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/app/router.dart';
import 'package:remora_mobile/features/auth/auth_provider.dart';

void main() {
  test('до восстановления сессии защищённый экран не открывается', () {
    expect(authRedirect(AuthStatus.unknown, '/'), '/splash');
    expect(
      authRedirect(AuthStatus.unknown, '/courses'),
      '/splash?next=%2Fcourses',
    );
    expect(
      authRedirect(AuthStatus.unknown, '/catalog'),
      '/splash?next=%2Fcatalog',
    );
    expect(authRedirect(AuthStatus.unknown, '/splash'), isNull);
  });

  test('авторизованному пользователю доступны все основные вкладки', () {
    for (final location in [
      '/',
      '/courses',
      '/sets',
      '/catalog',
      '/settings',
      '/assistant',
      '/classes',
      '/achievements',
      '/billing',
    ]) {
      expect(authRedirect(AuthStatus.authenticated, location), isNull);
    }
  });

  test('после восстановления splash ведёт в приложение', () {
    expect(authRedirect(AuthStatus.authenticated, '/splash'), '/');
  });

  test('без сохранённой сессии splash ведёт на вход', () {
    expect(authRedirect(AuthStatus.unauthenticated, '/splash'), '/auth/login');
  });

  test('ссылка на битву возвращает к приглашению после входа', () {
    const invite = '/battle/battle-1?invite=signed-token';
    expect(
      authRedirect(AuthStatus.unauthenticated, invite),
      '/auth/login?next=%2Fbattle%2Fbattle-1%3Finvite%3Dsigned-token',
    );
    expect(authRedirect(AuthStatus.authenticated, invite), isNull);
    expect(
      authRedirect(
        AuthStatus.authenticated,
        '/auth/login?next=%2Fbattle%2Fbattle-1%3Finvite%3Dsigned-token',
      ),
      invite,
    );
  });

  test('холодный запуск сохраняет приглашение до восстановления входа', () {
    const invite = '/app/battles/one?invite=abc';
    final splash = authRedirect(AuthStatus.unknown, invite)!;
    expect(authRedirect(AuthStatus.authenticated, splash), invite);
    final login = authRedirect(AuthStatus.unauthenticated, splash)!;
    expect(authRedirect(AuthStatus.authenticated, login), invite);
  });

  test('внешняя ссылка-приглашение остаётся защищённым маршрутом', () {
    const invite = '/app/battles/battle-1?invite=signed-token';
    expect(
      authRedirect(AuthStatus.unauthenticated, invite),
      '/auth/login?next=%2Fapp%2Fbattles%2Fbattle-1%3Finvite%3Dsigned-token',
    );
  });
}
