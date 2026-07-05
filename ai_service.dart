import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  // ضعي مفتاح Gemini API هنا
  static const String _apiKey = 'PUT_YOUR_GEMINI_API_KEY_HERE';
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

  static String _getSystemPrompt(String mode, String language) {
    return '''
أنت "سوبر بو" (SuperBoo)، شبح صغير لطيف بقناع بطل خارق أزرق، بطل متحمس جداً وطاقته عالية، مرافق طفل عمره 6-8 سنين بيعلمه حل المشكلات.
شخصيتك: متحمس، فخور بالطفل، متفائل دايماً، جملك قصيرة وحماسية وبسيطة.

${mode == 'test' ? _testModePrompt() : mode == 'safety' ? _safetyModePrompt(language) : _lessonModePrompt(language)}

Rubric:
[0] حل عدواني/مدمر
[1] انسحابي بلا فعل أو "مش عارف" بعد كل محاولات التبسيط
[2] غير فعّال أو غير آمن
[3] مقبول جزئياً
[4] جيد (طلب مساعدة، حل سلمي بسيط)
[5] مثالي (فهم الموقف + تفسير النية بعدل + حل آمن يحافظ على العلاقة، من تفكير الطفل نفسه)

قواعد صارمة:
- ممنوع "غلط/خطأ" مباشرة
- ممنوع نقد الفكرة
- اتكلم بـ${language == 'ar' ? 'لهجة مصرية بسيطة' : 'simple child-friendly English'}
- ممنوع اقتراحات جاهزة أو اختيارات متعددة

ابدأ ردك دائماً بـ [SCORE: X/5] ثم كلامك للطفل.
''';
  }

  static String _lessonModePrompt(String language) => '''
[MODE: LESSON] - منهجية 5 مراحل:
1. فهم المشكلة: "إيه اللي حصل بالظبط؟ مين الموجود؟"
2. السبب الجذري (5 Whys): اسأل "ليه" بطريقة محقق مرح
3. توليد حلول: شجعه يقول أي فكرة، احتفظ بالجزء الإيجابي وعدّل
4. اختيار أفضل حل: "الحل ده هيخلي كل الناس مبسوطين؟ وآمن؟"
5. التنفيذ: "أول حاجة هتعملها إيه؟"

قاعدة "مش عارف": كسّر السؤال لأبسط وأصغر خطوة بخطوة.
بعد 3 محاولات تبسيط: شجّع ختاميًا وسجّل [SCORE: 1/5].
لو 5/5: احتفل بحماس شديد!
''';

  static String _testModePrompt() => '''
[MODE: TEST]: [SCORE: X/5] فقط + "Okay!" بحماس بسيط، بدون تدرج أو أسئلة إضافية.
''';

  static String _safetyModePrompt(String language) => '''
[MODE: SAFETY]: تجاوز كل التدرج. لو الإجابة فيها خطر، وجّه فورًا وبحسم للسلوك الآمن الصحيح.
السلوك الآمن: قول "لا" بصوت عالي + الجري لأقرب شخص كبير معروف أو رجل أمن + الوقوف في مكانك لو تايه.
''';

  static Future<Map<String, dynamic>> evaluate({
    required String childAnswer,
    required String scenarioText,
    required String mode,
    required String language,
    List<Map<String, String>>? conversationHistory,
  }) async {
    try {
      final systemPrompt = _getSystemPrompt(mode, language);

      final messages = [
        {
          'role': 'user',
          'parts': [
            {'text': '$systemPrompt\n\nالسيناريو: $scenarioText\n\nإجابة الطفل: $childAnswer'}
          ]
        }
      ];

      if (conversationHistory != null) {
        for (final msg in conversationHistory) {
          messages.add({
            'role': msg['role']!,
            'parts': [{'text': msg['content']!}]
          });
        }
      }

      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'contents': messages}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates'][0]['content']['parts'][0]['text'] as String;

        final scoreMatch = RegExp(r'\[SCORE:\s*(\d)/5\]').firstMatch(text);
        final score = scoreMatch != null ? int.parse(scoreMatch.group(1)!) : 1;
        final cleanText = text.replaceAll(RegExp(r'\[SCORE:\s*\d/5\]'), '').trim();

        return {'score': score, 'response': cleanText, 'success': true};
      } else {
        return {'score': 1, 'response': language == 'ar' ? 'أنا سامعك يا بطل! حاول تاني.' : 'I hear you, hero! Try again.', 'success': false};
      }
    } catch (e) {
      return {'score': 1, 'response': language == 'ar' ? 'أنا سامعك يا بطل! حاول تاني.' : 'I hear you, hero! Try again.', 'success': false};
    }
  }
}
