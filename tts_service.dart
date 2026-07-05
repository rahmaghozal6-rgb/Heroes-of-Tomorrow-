import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;
  static Function? onStart;
  static Function? onComplete;

  static Future<void> init() async {
    if (_isInitialized) return;
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.1);
    await _tts.setSpeechRate(0.5);
    _tts.setStartHandler(() => onStart?.call());
    _tts.setCompletionHandler(() => onComplete?.call());
    _isInitialized = true;
  }

  static Future<void> speak(String text, String language) async {
    await init();
    if (language == 'ar') {
      await _tts.setLanguage('ar-SA');
    } else {
      await _tts.setLanguage('en-US');
    }
    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }

  static void dispose() {
    _tts.stop();
  }
}
