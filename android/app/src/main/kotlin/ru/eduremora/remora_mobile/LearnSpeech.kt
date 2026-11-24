package ru.eduremora.remora_mobile

import android.content.Context
import android.speech.tts.TextToSpeech
import io.flutter.plugin.common.MethodChannel
import java.util.Locale
import java.util.UUID

class LearnSpeech(private val context: Context) {
    private var engine: TextToSpeech? = null
    private var ready = false
    private var pending: (() -> Unit)? = null
    private var pendingResult: MethodChannel.Result? = null

    fun speak(parts: List<Map<String, String>>, result: MethodChannel.Result) {
        stop()
        val start = {
            val voice = engine
            var ok = ready && voice != null
            for (part in parts) {
                if (!ok || voice == null) break
                val lang = Locale.forLanguageTag(part["lang"].orEmpty())
                val value = part["text"].orEmpty().trim()
                if (value.isEmpty()) continue
                ok = voice.setLanguage(lang) >= TextToSpeech.LANG_AVAILABLE
                if (ok) {
                    for (chunk in value.chunked(TextToSpeech.getMaxSpeechInputLength())) {
                        if (voice.speak(chunk, TextToSpeech.QUEUE_ADD, null, UUID.randomUUID().toString()) == TextToSpeech.ERROR) {
                            ok = false
                            break
                        }
                    }
                }
            }
            if (!ok) voice?.stop()
            result.success(ok)
        }
        if (ready) { start(); return }
        pending = start
        pendingResult = result
        if (engine == null) {
            engine = TextToSpeech(context.applicationContext) { status ->
                ready = status == TextToSpeech.SUCCESS
                pendingResult = null
                val action = pending
                pending = null
                action?.invoke()
                if (!ready) { engine?.shutdown(); engine = null }
            }
        }
    }

    fun stop() {
        pending = null
        // Отменённый запрос штатно завершён переходом между карточками.
        pendingResult?.success(true)
        pendingResult = null
        engine?.stop()
    }

    fun close() { stop(); engine?.shutdown(); engine = null; ready = false }
}
