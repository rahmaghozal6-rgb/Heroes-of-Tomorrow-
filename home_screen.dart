import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/user_provider.dart';
import '../data/lessons_data.dart';
import '../data/tests_data.dart';
import '../services/sound_service.dart';
import 'test_screen.dart';
import 'lesson_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageProvider>().languageCode;
    final user = context.watch<UserProvider>();
    final isAr = lang == 'ar';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          isAr ? 'أبطال الغد 🌟' : 'Heroes of Tomorrow 🌟',
          style: const TextStyle(
            color: Color(0xFF3D6BE8),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF3D6BE8)),
            onPressed: () => _showSettings(context, lang, isAr),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3D6BE8), Color(0xFF5B84F0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3D6BE8).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/superboo_idle.png',
                    width: 70,
                    height: 70,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.emoji_emotions, size: 60, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isAr ? 'أهلاً يا بطل ${user.userName ?? ''}! 👋' : 'Hello, Hero ${user.userName ?? ''}! 👋',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isAr ? 'جاهز تتعلم حل المشكلات؟' : 'Ready to learn problem solving?',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Problem Solving Unit
            _buildUnitCard(context, lang, user, isAr),
            const SizedBox(height: 12),

            // Coming Soon
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lock, color: Colors.grey),
                  const SizedBox(width: 12),
                  Text(
                    isAr ? 'مهارة جديدة قريباً...' : 'Another Skill Coming Soon...',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitCard(BuildContext context, String lang, UserProvider user, bool isAr) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF3D6BE8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.lightbulb, color: Color(0xFF3D6BE8)),
          ),
          title: Text(
            isAr ? 'حل المشكلات' : 'Problem Solving',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF2C2C2C),
            ),
          ),
          subtitle: Text(
            isAr ? '8 دروس • شهرين' : '8 Lessons • 2 Months',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TestScreen(
                      scenarios: preTestData,
                      testId: 'preTest',
                      titleAr: 'اختبار القياس الأولي',
                      titleEn: 'Pre-Assessment Test',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                child: Text(isAr ? 'ابدأ' : 'Start'),
              ),
              const Icon(Icons.expand_more),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: List.generate(lessonsData.length, (index) {
                  final lesson = lessonsData[index];
                  final isCompleted = user.isLessonCompleted(lesson.id);
                  return ListTile(
                    leading: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCompleted
                            ? const Color(0xFF3D6BE8)
                            : Colors.grey.shade300,
                        border: Border.all(
                          color: isCompleted
                              ? const Color(0xFF3D6BE8)
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                    ),
                    title: Text(
                      lang == 'ar' ? lesson.titleAr : lesson.titleEn,
                      style: TextStyle(
                        fontSize: 14,
                        color: isCompleted
                            ? const Color(0xFF3D6BE8)
                            : const Color(0xFF2C2C2C),
                        fontWeight: isCompleted
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      isAr ? 'درس ${index + 1}' : 'Lesson ${index + 1}',
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade500),
                    ),
                    trailing: isCompleted
                        ? const Icon(Icons.check_circle,
                            color: Color(0xFF3D6BE8), size: 20)
                        : const Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.grey),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonScreen(scenario: lesson),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettings(BuildContext context, String lang, bool isAr) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isAr ? 'الإعدادات ⚙️' : 'Settings ⚙️',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Text('🇸🇦', style: TextStyle(fontSize: 24)),
              title: const Text('العربية'),
              onTap: () {
                context.read<LanguageProvider>().setLanguage('ar');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
              title: const Text('English'),
              onTap: () {
                context.read<LanguageProvider>().setLanguage('en');
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                SoundService.isMusicOn ? Icons.volume_up : Icons.volume_off,
                color: const Color(0xFF3D6BE8),
              ),
              title: Text(isAr ? 'الموسيقى' : 'Music'),
              trailing: Switch(
                value: SoundService.isMusicOn,
                activeColor: const Color(0xFF3D6BE8),
                onChanged: (val) {
                  SoundService.toggleMusic(val);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
