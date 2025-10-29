import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProviders extends ChangeNotifier {
  String appLanguage = 'en';

  AppLanguageProviders() {
    loadLanguage();
  }

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);
  }

  void loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('appLanguage') ?? 'en';

    appLanguage = savedLanguage;
    notifyListeners();
  }

  bool isEnglish() => appLanguage == 'en';

  bool isArabic() => appLanguage == 'ar';
}
