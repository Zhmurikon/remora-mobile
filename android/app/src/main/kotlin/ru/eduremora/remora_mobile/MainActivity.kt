package ru.eduremora.remora_mobile

import android.media.MediaMetadataRetriever
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(engine: FlutterEngine) {
        super.configureFlutterEngine(engine)
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
