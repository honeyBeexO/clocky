import 'package:flutter/material.dart';

class MyThemeModel extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeThem() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}
