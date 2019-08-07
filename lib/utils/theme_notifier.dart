import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode;

  bool get isDarkMode => _isDarkMode;

  setdarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}
