import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';

/// Держит один не подтверждённый ответ, чтобы повтор не создал второй ответ
/// при неизвестном результате сетевого запроса.
class BattleAnswerRetry {
  BattleAnswerIn? _pending;

  BattleAnswerIn? get pending => _pending;

  BattleAnswerIn prepare({required String questionId, required String value}) {
    return _pending ??= BattleAnswerIn(
      clientAnswerId: const Uuid().v4(),
      questionId: questionId,
      value: value,
    );
  }

  void complete() {
    _pending = null;
  }
}
