import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  Locale get locale => _locale;
  String get languageCode => _locale.languageCode;

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('language') ?? 'ar';
    _locale = Locale(saved);
    notifyListeners();
  }

  Future<void> setLanguage(String code) async {
    _locale = Locale(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', code);
    notifyListeners();
  }
}
