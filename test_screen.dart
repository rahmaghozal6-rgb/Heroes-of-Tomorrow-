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

class TestScreen extends StatefulWidget {
  final List<ScenarioModel> scenarios;
  final String testId;
  final String titleAr;
  final String titleEn;

  const TestScreen({
    super.key,
    required this.scenarios,
    required this.testId,
    required this.titleAr,
    required this.titleEn,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final SpeechToText _stt = SpeechToText();
  bool _isListening = false;
  bool _isTalking = false;
  bool _isLoading = false;
  bool _micReady = false;
  int _currentIndex = 0;
  String _childAnswer = '';
  String _superbooText = '';
  final List<int> _scores = [];

  @override
  void initState() {
    super.initState();
    _initSpeech();
    WidgetsBinding.instance.addPostFrameCallback((_) => _speakCurrentQuestion());
  }

  Future<void> _initSpeech() async {
    _micReady = await _stt.initialize();
    setState(() {});
  }

  Future<void> _speakCurrentQuestion() async {
    final lang = context.read<LanguageProvider>().languageCode;
    final text = widget.scenarios[_currentIndex].scenes.last.getText(lang);
    await _speak(text);
  }

  Future<void> _speak(String text) async {
    final lang = context.read<LanguageProvider>().languageCode;
    setState(() { _isTalking = true; _superbooText = text; });
    TTSService.onStart = () => setState(() => _isTalking = true);
    TTSService.onComplete = () => setState(() => _isTalking = false);
    await TTSService.speak(text, lang);
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
        onResult: (r) => setState(() => _childAnswer = r.recognizedWords),
        localeId: lang == 'ar' ? 'ar_SA' : 'en_US',
      );
    }
  }

  Future<void> _evaluate() async {
    setState(() => _isLoading = true);
    final lang = context.read<LanguageProvider>().languageCode;
    final scenarioText = widget.scenarios[_currentIndex].scenes.last.getText(lang);

    final result = await AIService.evaluate(
      childAnswer: _childAnswer,
      scenarioText: scenarioText,
      mode: 'test',
      language: lang,
    );

    final score = result['score'] as int;
    _scores.add(score);

    // في الاختبار سوبر بو يقول "Okay" بس
    final okayText = lang == 'ar' ? 'أوكي!' : 'Okay!';
    setState(() => _isLoading = false);
    await _speak(okayText);

    await Future.delayed(const Duration(milliseconds: 800));

    if (_currentIndex < widget.scenarios.length - 1) {
      setState(() {
        _currentIndex++;
        _childAnswer = '';
      });
      await _speakCurrentQuestion();
    } else {
      await _finishTest();
    }
  }

  Future<void> _finishTest() async {
    final totalScore = _scores.isNotEmpty
        ? _scores.reduce((a, b) => a + b) / _scores.length
        : 0.0;

    final user = context.read<UserProvider>();
    final lang = context.read<LanguageProvider>().languageCode;
    final isAr = lang == 'ar';

    if (widget.testId == 'preTest') {
      await user.updatePreTestScore(totalScore.toDouble());
    } else if (widget.testId == 'postTest') {
      await user.updatePostTestScore(totalScore.toDouble());
    } else {
      await user.updateQuizScore(widget.testId, totalScore.toDouble());
    }

    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🏆', style: TextStyle(fontSize: 60)),
              const SizedBox(height: 12),
              Text(
                isAr ? 'خلصت الاختبار!' : 'Test Complete!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                isAr
                    ? 'درجتك: ${totalScore.toStringAsFixed(1)} / 5'
                    : 'Your Score: ${totalScore.toStringAsFixed(1)} / 5',
                style: const TextStyle(fontSize: 18, color: Color(0xFF3D6BE8)),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); Navigator.pop(context); },
              child: Text(
                isAr ? 'تمام!' : 'Great!',
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
    final current = widget.scenarios[_currentIndex];
    final currentScene = current.scenes.last;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          isAr ? widget.titleAr : widget.titleEn,
          style: const TextStyle(
              color: Color(0xFF2C2C2C),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.scenarios.length,
            backgroundColor: Colors.grey.shade200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(Color(0xFF3D6BE8)),
            minHeight: 6,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Question counter
              Text(
                isAr
                    ? 'السؤال ${_currentIndex + 1} من ${widget.scenarios.length}'
                    : 'Question ${_currentIndex + 1} of ${widget.scenarios.length}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
              const SizedBox(height: 12),

              // Scene image
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
                        child: const Icon(Icons.image,
                            size: 80, color: Colors.grey),
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
                    SuperBooWidget(
                        isTalking: _isTalking, isListening: _isListening),
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
                          border: Border.all(
                              color: const Color(0xFF3D6BE8).withOpacity(0.2)),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            _superbooText.isNotEmpty
                                ? _superbooText
                                : (isAr
                                    ? 'سوبر بو بيفكر...'
                                    : 'SuperBoo is thinking...'),
                            textDirection:
                                isAr ? TextDirection.rtl : TextDirection.ltr,
                            style:
                                const TextStyle(fontSize: 15, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Child answer
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
                    style: TextStyle(
                        color: Colors.green.shade800, fontSize: 14),
                  ),
                ),

              const SizedBox(height: 16),

              // Mic button
              _isLoading
                  ? const CircularProgressIndicator(
                      color: Color(0xFF3D6BE8))
                  : Column(
                      children: [
                        Text(
                          _isListening
                              ? (isAr
                                  ? 'سوبر بو بيسمعك...'
                                  : 'SuperBoo is listening...')
                              : (isAr
                                  ? 'اضغط وتكلم'
                                  : 'Tap and talk'),
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
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
                              color: _isListening
                                  ? Colors.red
                                  : const Color(0xFF3D6BE8),
                              boxShadow: [
                                BoxShadow(
                                  color: (_isListening
                                          ? Colors.red
                                          : const Color(0xFF3D6BE8))
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
    );
  }
}
