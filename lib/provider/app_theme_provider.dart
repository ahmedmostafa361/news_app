import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    loadTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) return;

    appTheme = newTheme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'themeMode',
      newTheme == ThemeMode.light ? 'light' : 'dark',
    );
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('themeMode') ?? 'light';

    appTheme = savedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool isLightMode() => appTheme == ThemeMode.light;

  bool isDarkMode() => appTheme == ThemeMode.dark;
}
