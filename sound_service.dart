import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final AudioPlayer _bgmPlayer = AudioPlayer();
  static final AudioPlayer _sfxPlayer = AudioPlayer();
  static bool isMusicOn = true;

  static Future<void> playWelcomeMusic() async {
    if (!isMusicOn) return;
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgmPlayer.setVolume(0.3);
    await _bgmPlayer.play(AssetSource('sounds/welcome_music.mp3'));
  }

  static Future<void> stopMusic() async {
    await _bgmPlayer.stop();
  }

  static Future<void> toggleMusic(bool status) async {
    isMusicOn = status;
    if (isMusicOn) {
      await playWelcomeMusic();
    } else {
      await stopMusic();
    }
  }

  static Future<void> playStartBoom() async {
    await _sfxPlayer.play(AssetSource('sounds/start_boom.mp3'));
  }

  static Future<void> playMicStart() async {
    await _sfxPlayer.play(AssetSource('sounds/mic_start.mp3'));
  }

  // فقط في الدروس، مش في الاختبارات
  static Future<void> playForScore(int score) async {
    if (score == 5) {
      await _sfxPlayer.play(AssetSource('sounds/applause.mp3'));
    } else if (score >= 2 && score <= 3) {
      await _sfxPlayer.play(AssetSource('sounds/encourage.mp3'));
    } else {
      await _sfxPlayer.play(AssetSource('sounds/try_again.mp3'));
    }
  }

  static void dispose() {
    _bgmPlayer.dispose();
    _sfxPlayer.dispose();
  }
}
