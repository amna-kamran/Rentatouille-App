import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool _isProprietorMode = false;
  bool _hasLounge = false;

  bool get isProprietorMode => _isProprietorMode;
  bool get hasLounge => _hasLounge;

  void toggleProprieterMode() {
    _isProprietorMode == false
        ? _isProprietorMode = true
        : _isProprietorMode = false;
    notifyListeners();
  }

  void toggleLounge() {
    _hasLounge == false ? _hasLounge = true : _hasLounge = false;
    notifyListeners();
  }
}
