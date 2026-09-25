import 'package:flutter_test/flutter_test.dart';

import 'package:remora_mobile/app/router.dart';
import 'package:remora_mobile/features/auth/auth_provider.dart';

void main() {
  test('до восстановления сессии защищённый экран не открывается', () {
    expect(authRedirect(AuthStatus.unknown, '/'), '/splash');
    expect(authRedirect(AuthStatus.unknown, '/courses'), '/splash');
    expect(authRedirect(AuthStatus.unknown, '/splash'), isNull);
  });

  test('после восстановления splash ведёт в приложение', () {
    expect(authRedirect(AuthStatus.authenticated, '/splash'), '/');
  });

  test('без сохранённой сессии splash ведёт на вход', () {
    expect(authRedirect(AuthStatus.unauthenticated, '/splash'), '/auth/login');
  });
}
