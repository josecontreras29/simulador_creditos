import 'package:flutter/material.dart';
import 'package:simulador_creditos/classes/user.dart';

class ProviderRegister extends ChangeNotifier {
  ProviderRegister();
  List<User> registeredUsers = [];
  bool _termsandconditions = false;

  bool get termsandconditions => _termsandconditions;

  set termsAndConditions(bool termsandconditions) {
    _termsandconditions = termsandconditions;
    notifyListeners();
  }

  bool checkRequirements(bool fields) {
    if (fields && _termsandconditions) {
      return true;
    }
    notifyListeners();
    return false;
  }
}


