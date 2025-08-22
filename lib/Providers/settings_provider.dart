import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  String _currency = 'USD';
  String _language = 'en';

  String get currency => _currency;
  String get language => _language;

  void setCurrency(String newCurrency) {
    _currency = newCurrency;
    notifyListeners();
  }

  void setLanguage(String newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}