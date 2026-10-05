import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/study/battle_screen.dart';

void main() {
  test('приглашение открывает защищённый маршрут комнаты в веб-клиенте', () {
    final invite = battleInviteUrl('battle-1', 'signed-token');

    expect(
      invite.toString(),
      'https://remora.com.ru/app/battles/battle-1?invite=signed-token',
    );
  });
}
