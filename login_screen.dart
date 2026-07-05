import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/user_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedLanguage = 'ar';
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_nameController.text.trim().isEmpty || _ageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_selectedLanguage == 'ar'
              ? 'من فضلك ادخل اسمك وعمرك يا بطل!'
              : 'Please enter your name and age, hero!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final age = int.tryParse(_ageController.text.trim());
    if (age == null || age < 4 || age > 12) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_selectedLanguage == 'ar'
              ? 'العمر لازم يكون بين 4 و 12 سنة'
              : 'Age must be between 4 and 12'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await context.read<UserProvider>().registerUser(
            _nameController.text.trim(),
            age,
            _selectedLanguage,
          );
      await context.read<LanguageProvider>().setLanguage(_selectedLanguage);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAr = _selectedLanguage == 'ar';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // SuperBoo Image
              Image.asset(
                'assets/images/superboo_idle.png',
                width: 120,
                height: 120,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.emoji_emotions,
                  size: 80,
                  color: Color(0xFF3D6BE8),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isAr ? 'أهلاً يا بطل! 🌟' : 'Welcome, Hero! 🌟',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6BE8),
                ),
              ),
              const SizedBox(height: 30),

              // Language Selector
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedLanguage = 'ar'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedLanguage == 'ar'
                                ? const Color(0xFF3D6BE8)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '🇸🇦 العربية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedLanguage == 'ar'
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedLanguage = 'en'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedLanguage == 'en'
                                ? const Color(0xFF3D6BE8)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '🇬🇧 English',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedLanguage == 'en'
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Name Field
              TextField(
                controller: _nameController,
                textAlign: isAr ? TextAlign.right : TextAlign.left,
                textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: isAr ? 'اسمك يا بطل' : 'Your Name, Hero',
                  prefixIcon: const Icon(Icons.person, color: Color(0xFF3D6BE8)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color(0xFF3D6BE8), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Age Field
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: isAr ? 'عمرك كام سنة؟' : 'How old are you?',
                  prefixIcon: const Icon(Icons.cake, color: Color(0xFF3D6BE8)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color(0xFF3D6BE8), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Start Button
              _isLoading
                  ? const CircularProgressIndicator(
                      color: Color(0xFF3D6BE8))
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3D6BE8),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 6,
                          shadowColor:
                              const Color(0xFF3D6BE8).withOpacity(0.4),
                        ),
                        child: Text(
                          isAr ? 'ابدأ الرحلة! 🚀' : 'Start the Journey! 🚀',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
