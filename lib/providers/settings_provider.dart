import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  SettingsProvider() {
    loadPreferences();
  }

  Future<void> changeCurrentTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newTheme == currentTheme) return;
    if (newTheme == ThemeMode.light) {
      currentTheme = ThemeMode.light;
      await prefs.setBool('isLightTheme', true);
    } else {
      currentTheme = ThemeMode.dark;
      await prefs.setBool('isLightTheme', false);
    }
    notifyListeners();
  }

  String getBackgroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/main_background_dark.png';
  }

  bool isLightEnabled() {
    return currentTheme == ThemeMode.light;
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLightTheme = prefs.getBool('isLightTheme') ?? true ;
    currentTheme = isLightTheme ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

}
