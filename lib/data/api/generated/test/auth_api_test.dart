import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for AuthApi
void main() {
  final instance = RemoraApi().getAuthApi();

  group(AuthApi, () {
    // Смена пароля
    //
    //Future changePasswordApiV1AuthChangePasswordPost(PasswordChangeRequest passwordChangeRequest) async
    test('test changePasswordApiV1AuthChangePasswordPost', () async {
      // TODO
    });

    // Сброс пароля
    //
    //Future<TokenResponse> confirmPasswordResetApiV1AuthPasswordResetConfirmPost(PasswordResetConfirmRequest passwordResetConfirmRequest) async
    test('test confirmPasswordResetApiV1AuthPasswordResetConfirmPost', () async {
      // TODO
    });

    // Текущий пользователь
    //
    //Future<UserPublic> getMeApiV1AuthMeGet() async
    test('test getMeApiV1AuthMeGet', () async {
      // TODO
    });

    // Активные сессии
    //
    //Future<BuiltList<SessionPublic>> listSessionsApiV1AuthSessionsGet() async
    test('test listSessionsApiV1AuthSessionsGet', () async {
      // TODO
    });

    // Вход
    //
    //Future<TokenResponse> loginApiV1AuthLoginPost(LoginRequest loginRequest) async
    test('test loginApiV1AuthLoginPost', () async {
      // TODO
    });

    // Выход
    //
    //Future logoutApiV1AuthLogoutPost({ RefreshRequest refreshRequest }) async
    test('test logoutApiV1AuthLogoutPost', () async {
      // TODO
    });

    // Обновление токена
    //
    //Future<RefreshResponse> refreshApiV1AuthRefreshPost({ RefreshRequest refreshRequest }) async
    test('test refreshApiV1AuthRefreshPost', () async {
      // TODO
    });

    // Регистрация
    //
    //Future<TokenResponse> registerApiV1AuthRegisterPost(RegisterRequest registerRequest) async
    test('test registerApiV1AuthRegisterPost', () async {
      // TODO
    });

    // Запрос сброса пароля
    //
    //Future requestPasswordResetApiV1AuthPasswordResetPost(PasswordResetRequest passwordResetRequest) async
    test('test requestPasswordResetApiV1AuthPasswordResetPost', () async {
      // TODO
    });

    // Отзыв сессии
    //
    //Future revokeSessionApiV1AuthSessionsSessionIdDelete(String sessionId) async
    test('test revokeSessionApiV1AuthSessionsSessionIdDelete', () async {
      // TODO
    });

    // Обновление профиля
    //
    //Future<UserPublic> updateMeApiV1AuthMePatch(ProfileUpdateRequest profileUpdateRequest) async
    test('test updateMeApiV1AuthMePatch', () async {
      // TODO
    });

    // Подтверждение email
    //
    //Future<TokenResponse> verifyEmailApiV1AuthVerifyEmailPost(VerifyEmailRequest verifyEmailRequest) async
    test('test verifyEmailApiV1AuthVerifyEmailPost', () async {
      // TODO
    });

  });
}
