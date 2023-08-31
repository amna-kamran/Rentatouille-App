import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool _isProprietorMode = false;

  bool get isProprietorMode => _isProprietorMode;

  void toggleMode() {
    _isProprietorMode = !_isProprietorMode;
    notifyListeners();
  }

  void setToRenterMode() {
    _isProprietorMode = false;
    notifyListeners();
  }

  void setToProprietorMode() {
    _isProprietorMode = true;
    notifyListeners();
  }
}
