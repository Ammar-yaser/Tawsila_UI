import 'package:flutter/foundation.dart';

class LoginState with ChangeNotifier {
  String _phone, _errorMessage = '', _phoneCode = "+20";

  // Setters
  set setPhone(String val) => _phone = val;
  set phoneCode(String val) { // country phone code 
    _phoneCode = val;
    notifyListeners();
  }
  // phone validation error message
  set errorMessage(String val) {
    if (val == null) {
      _errorMessage = '';
      notifyListeners();
    } else {
      _errorMessage = val;
      notifyListeners();
    }
  }
  // Getters
  String get phoneCode => _phoneCode;
  String get phone => "$_phoneCode$_phone";
  String get errorMessage => _errorMessage;
}
