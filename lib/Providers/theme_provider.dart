import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this provider to save the theme app status in device memory using shared pref
class ThemeProvider with ChangeNotifier {
  static const themeStatus = 'Theme_status';
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;
  // the app will open on the theme that user choose before
  ThemeProvider() {
    getTheme();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(themeStatus, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _darkTheme = preferences.getBool(themeStatus) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
