package ru.eduremora.remora_mobile

import android.media.MediaMetadataRetriever
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val speech by lazy { LearnSpeech(this) }

    override fun onStop() { speech.stop(); super.onStop() }
    override fun onDestroy() { speech.close(); super.onDestroy() }

    override fun configureFlutterEngine(engine: FlutterEngine) {
        super.configureFlutterEngine(engine)
        MethodChannel(engine.dartExecutor.binaryMessenger, "remora/learn-speech")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "speak" -> speech.speak(call.arguments<List<Map<String, String>>>().orEmpty(), result)
                    "stop" -> { speech.stop(); result.success(null) }
                    else -> result.notImplemented()
                }
            }
        MethodChannel(engine.dartExecutor.binaryMessenger, "remora/media")
            .setMethodCallHandler { call, result ->
                if (call.method != "duration") {
                    result.notImplemented()
                    return@setMethodCallHandler
                }
                Thread {
                    val seconds = runCatching {
                        val reader = MediaMetadataRetriever()
                        try {
                            reader.setDataSource(call.arguments as String)
                            val duration = reader.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                            duration?.toLongOrNull()?.let { (it + 999) / 1000 }
                        } finally {
                            reader.release()
                        }
                    }.getOrNull()
                    runOnUiThread { result.success(seconds) }
                }.start()
            }
    }
}
