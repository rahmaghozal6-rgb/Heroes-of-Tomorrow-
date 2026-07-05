import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../models/scenario_model.dart';
import '../providers/language_provider.dart';
import '../providers/user_provider.dart';
import '../services/ai_service.dart';
import '../services/sound_service.dart';
import '../services/tts_service.dart';
import '../widgets/superboo_widget.dart';

class LessonScreen extends StatefulWidget {
  final ScenarioModel scenario;
  const LessonScreen({super.key, required this.scenario});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final SpeechToText _stt = SpeechToText();
  bool _isListening = false;
  bool _isTalking = false;
  bool _isLoading = false;
  int _currentScene = 0;
  String _childAnswer = '';
  String _superbooText = '';
  bool _micReady = false;
  bool _showMic = false;
  int _currentScore = 0;
  List<Map<String, String>> _conversationHistory = [];

  @override
  void initState() {
    super.initState();
    _initSpeech();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScenes());
  }

  Future<void> _initSpeech() async {
    _micReady = await _stt.initialize();
    setState(() {});
  }

  Future<void> _startScenes() async {
    for (int i = 0; i < widget.scenario.scenes.length; i++) {
      if (!mounted) return;
      setState(() => _currentScene = i);
      final scene = widget.scenario.scenes[i];
      final lang = context.read<LanguageProvider>().languageCode;
      await _speak(scene.getText(lang));
      if (i < widget.scenario.scenes.length - 1) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
    if (mounted) setState(() => _showMic = true);
  }

  Future<void> _speak(String text) async {
    setState(() { _isTalking = true; _superbooText = text; });
    final lang = context.read<LanguageProvider>().languageCode;
    TTSService.onStart = () => setState(() => _isTalking = true);
    TTSService.onComplete = () => setState(() => _isTalking = false);
    await TTSService.speak(text, lang);
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => _isTalking = false);
  }

  Future<void> _toggleListening() async {
    if (!_micReady) return;
    await SoundService.playMicStart();
    if (_isListening) {
      await _stt.stop();
      setState(() => _isListening = false);
      if (_childAnswer.isNotEmpty) await _evaluate();
    } else {
      setState(() { _isListening = true; _childAnswer = ''; });
      final lang = context.read<LanguageProvider>().languageCode;
      await _stt.listen(
        onResult: (result) => setState(() => _childAnswer = result.recognizedWords),
        localeId: lang == 'ar' ? 'ar_SA' : 'en_US',
      );
    }
  }

  Future<void> _evaluate() async {
    setState(() => _isLoading = true);
    final lang = context.read<LanguageProvider>().languageCode;
    final scenarioText = widget.scenario.scenes.last.getText(lang);

    final result = await AIService.evaluate(
      childAnswer: _childAnswer,
      scenarioText: scenarioText,
      mode: widget.scenario.mode,
      language: lang,
      conversationHistory: _conversationHistory,
    );

    final score = result['score'] as int;
    final response = result['response'] as String;

    _conversationHistory.add({'role': 'user', 'content': _childAnswer});
    _conversationHistory.add({'role': 'model', 'content': response});

    setState(() { _currentScore = score; _isLoading = false; });

    // الصوتيات في الدروس فقط
    if (widget.scenario.mode != 'test') {
      await SoundService.playForScore(score);
    }

    await _speak(response);

    if (score >= 5) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) await _completLesson();
    }
  }

  Future<void> _completLesson() async {
    await context.read<UserProvider>().updateLessonCompleted(widget.scenario.id);
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🎉', style: TextStyle(fontSize: 60)),
              const SizedBox(height: 12),
              Text(
                context.read<LanguageProvider>().languageCode == 'ar'
                    ? 'برافو يا بطل! خلصت الدرس!' : 'Amazing, Hero! Lesson Complete!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); Navigator.pop(context); },
              child: Text(
                context.read<LanguageProvider>().languageCode == 'ar' ? 'تمام!' : 'Great!',
                style: const TextStyle(color: Color(0xFF3D6BE8), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _stt.stop();
    TTSService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageProvider>().languageCode;
    final isAr = lang == 'ar';
    final currentScene = widget.scenario.scenes[_currentScene];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.scenario.getTitle(lang),
          style: const TextStyle(color: Color(0xFF2C2C2C), fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (_currentScene + 1) / widget.scenario.scenes.length,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF3D6BE8)),
              minHeight: 6,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Scene Image
                    if (currentScene.image != null)
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            currentScene.image!,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF3D6BE8).withOpacity(0.05),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.image, size: 80, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 12),

                    // SuperBoo + speech bubble
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SuperBooWidget(isTalking: _isTalking, isListening: _isListening),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF3FF),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                border: Border.all(color: const Color(0xFF3D6BE8).withOpacity(0.2)),
                              ),
                              child: SingleChildScrollView(
                                child: Text(
                                  _superbooText.isNotEmpty
                                      ? _superbooText
                                      : (isAr ? 'سوبر بو بيفكر...' : 'SuperBoo is thinking...'),
                                  textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                                  style: const TextStyle(fontSize: 15, height: 1.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Child answer display
                    if (_childAnswer.isNotEmpty && !_isListening)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Text(
                          _childAnswer,
                          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                          style: TextStyle(color: Colors.green.shade800, fontSize: 14),
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Microphone Button
                    if (_showMic)
                      _isLoading
                          ? Column(
                              children: [
                                const CircularProgressIndicator(color: Color(0xFF3D6BE8)),
                                const SizedBox(height: 8),
                                Text(
                                  isAr ? 'سوبر بو بيفكر...' : 'SuperBoo is thinking...',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  _isListening
                                      ? (isAr ? 'سوبر بو بيسمعك... اضغط للإيقاف' : 'SuperBoo is listening... tap to stop')
                                      : (isAr ? 'اضغط وتكلم مع سوبر بو' : 'Tap and talk to SuperBoo'),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: _toggleListening,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _isListening ? Colors.red : const Color(0xFF3D6BE8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: (_isListening ? Colors.red : const Color(0xFF3D6BE8))
                                              .withOpacity(0.4),
                                          blurRadius: 20,
                                          spreadRadius: _isListening ? 8 : 2,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      _isListening ? Icons.mic : Icons.mic_none,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
