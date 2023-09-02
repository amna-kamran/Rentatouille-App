import 'package:flutter/material.dart';

class MonthlyRentProvider extends ChangeNotifier {
  String _monthlyRent = '';

  String get monthlyRent => _monthlyRent;

  void setMonthlyRent(String value) {
    _monthlyRent = value;
    notifyListeners();
  }
}
