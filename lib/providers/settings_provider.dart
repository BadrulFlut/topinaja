import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  static const String _scaleFactorKey = 'textScaleFactor';
  static const String _themeModeKey = 'themeMode';

  double _textScaleFactor = 1.0; // Default scale factor
  ThemeMode _themeMode = ThemeMode.system; // Default theme mode

  double get textScaleFactor => _textScaleFactor;
  ThemeMode get themeMode => _themeMode;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Load text scale factor
    _textScaleFactor = prefs.getDouble(_scaleFactorKey) ?? 1.0;

    // Load theme mode (0: system, 1: light, 2: dark)
    final themeModeIndex = prefs.getInt(_themeModeKey) ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];

    notifyListeners();
  }

  Future<void> updateTextScaleFactor(double newFactor) async {
    if (_textScaleFactor != newFactor) {
      _textScaleFactor = newFactor;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_scaleFactorKey, newFactor);
      notifyListeners();
    }
  }

  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    if (_themeMode != newThemeMode) {
      _themeMode = newThemeMode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeModeKey, newThemeMode.index);
      notifyListeners();
    }
  }
}
