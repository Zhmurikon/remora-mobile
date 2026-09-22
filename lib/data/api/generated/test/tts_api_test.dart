import 'package:test/test.dart';
import 'package:remora_api/remora_api.dart';


/// tests for TtsApi
void main() {
  final instance = RemoraApi().getTtsApi();

  group(TtsApi, () {
    // Озвучить сторону карточки
    //
    //Future<SpeakResponse> speakApiV1TtsSpeakPost(SpeakRequest speakRequest) async
    test('test speakApiV1TtsSpeakPost', () async {
      // TODO
    });

    // Доступна ли озвучка
    //
    //Future<TtsStatus> ttsStatusApiV1TtsStatusGet() async
    test('test ttsStatusApiV1TtsStatusGet', () async {
      // TODO
    });

  });
}
