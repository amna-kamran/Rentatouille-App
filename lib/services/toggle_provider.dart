import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool _isProprietorMode = false;

  bool get isProprietorMode => _isProprietorMode;

  void toggleMode() {
    _isProprietorMode == false
        ? _isProprietorMode = true
        : _isProprietorMode = false;
    notifyListeners();
  }
}
