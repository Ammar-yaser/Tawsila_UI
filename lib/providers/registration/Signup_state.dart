import 'package:flutter/foundation.dart';

class SignupState with ChangeNotifier {
  String _phone, _errorMessage = '', _email, _phoneCode = "+20";

  // Setters
  set setPhone(String val) => _phone = val;
  set setEmail(String val) => _email = val;
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
  String get email => _email;
  String get errorMessage => _errorMessage;
}
