package ru.eduremora.remora_mobile

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.speech.tts.TextToSpeech
import android.speech.tts.UtteranceProgressListener
import io.flutter.plugin.common.MethodChannel
import java.util.Locale
import java.util.UUID

class LearnSpeech(private val context: Context) {
    private val main = Handler(Looper.getMainLooper())
    private var engine: TextToSpeech? = null
    private var ready = false
    private var pending: (() -> Unit)? = null
    private var active: MethodChannel.Result? = null
    private var request = ""
    private var last = ""

    // Движок сообщает о завершении с другого потока, иногда уже после смены карточки.
    private val listener = object : UtteranceProgressListener() {
        override fun onStart(id: String) {}
        override fun onDone(id: String) { main.post { if (id == last) complete(true) } }
        @Deprecated("Android до API 21")
        override fun onError(id: String) { main.post { if (id.startsWith(request)) complete(false) } }
    }

    private fun complete(ok: Boolean) {
        val result = active
        active = null
        pending = null
        last = ""
        result?.success(ok)
    }

    fun speak(parts: List<Map<String, String>>, result: MethodChannel.Result) {
        stop()
        active = result
        request = UUID.randomUUID().toString()
        val start = {
            val voice = engine
            var ok = ready && voice != null
            var count = 0
            for (part in parts) {
                if (!ok || voice == null) break
                val value = part["text"].orEmpty().trim()
                if (value.isEmpty()) continue
                ok = voice.setLanguage(Locale.forLanguageTag(part["lang"].orEmpty())) >= TextToSpeech.LANG_AVAILABLE
                if (!ok) break
                for (chunk in value.chunked(TextToSpeech.getMaxSpeechInputLength())) {
                    last = "$request-${count++}"
                    if (voice.speak(chunk, TextToSpeech.QUEUE_ADD, null, last) == TextToSpeech.ERROR) {
                        ok = false
                        break
                    }
                }
            }
            if (!ok) voice?.stop()
            if (!ok || count == 0) complete(ok)
        }
        if (ready) { start(); return }
        pending = start
        if (engine == null) {
            engine = TextToSpeech(context.applicationContext) { status ->
                main.post {
                    ready = status == TextToSpeech.SUCCESS
                    if (ready) engine?.setOnUtteranceProgressListener(listener)
                    val action = pending
                    pending = null
                    action?.invoke()
                    if (!ready) { engine?.shutdown(); engine = null }
                }
            }
        }
    }

    fun stop() {
        complete(true)
        engine?.stop()
    }

    fun close() { stop(); engine?.shutdown(); engine = null; ready = false }
}
