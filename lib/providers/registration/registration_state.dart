import 'package:flutter/foundation.dart';

class RegistrationState with ChangeNotifier {
  int _selectedForm = 0;

  set selectedForm(int val) {
    _selectedForm = val;
    notifyListeners();
  }
  int get selectedForm => _selectedForm;
}