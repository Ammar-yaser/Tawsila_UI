import 'package:flutter/widgets.dart';
import 'RegExp.dart';

class FormsValidation {
  void saveFormData({FormState formKey,String phoneData,Function sendData}) {
    if (formKey.validate() && phoneValidate(phoneData) == null) {
      formKey.save();
      sendData();
    }
  }

  // String nameValidate(String fieldVal) {
  //   if (fieldVal.length < 3) {
  //     return 'This is not a name';
  //   } else if (!usernameRegExp.hasMatch(fieldVal)) {
  //     return 'Username is not valid';
  //   } else {
  //     return null;
  //   }
  // }

  String phoneValidate(String fieldVal) {
    if (fieldVal.isEmpty) {
      return 'Phone number is required';
    } else if (!phoneRegExp.hasMatch(fieldVal)) {
      return 'Invalid Phone number';
    } else {
      return null;
    }
  }

  String emailValidate(String fieldVal) {
    if (fieldVal.isEmpty) {
      return 'Email is required';
    } else if (!emailRegExp.hasMatch(fieldVal)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  // String passValidate(String fieldVal) {
  //   if (!passwordRegExp.hasMatch(fieldVal)) {
  //     return 'Must contain Capital letter and one number';
  //   } else {
  //     return null;
  //   }
  // }

  // String confirmPassValidate(String fieldVal, String pass) {
  //   if (fieldVal != pass) {
  //     return 'Passwords are not the same';
  //   } else {
  //     return null;
  //   }
  // }
}
