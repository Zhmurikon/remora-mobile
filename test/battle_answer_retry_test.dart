import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/features/study/battle_answer_retry.dart';

void main() {
  test('повтор после сетевой ошибки сохраняет client_answer_id', () {
    final retry = BattleAnswerRetry();
    final first = retry.prepare(questionId: 'question-1', value: 'Ответ');
    final repeated = retry.prepare(questionId: 'question-1', value: 'Другой');

    expect(repeated.clientAnswerId, first.clientAnswerId);
    expect(repeated.questionId, 'question-1');
    expect(repeated.value, 'Ответ');

    retry.complete();
    final next = retry.prepare(questionId: 'question-2', value: 'Следующий');
    expect(next.clientAnswerId, isNot(first.clientAnswerId));
  });
}
