import 'package:flutter/material.dart';
import 'package:simulador_creditos/classes/user.dart';

class ProviderLogin extends ChangeNotifier {
  bool remember = false;

  bool checkIfIsRegistered(
      String emailoruser, String password, List<User> listUsers) {
    for (var user in listUsers) {
      //NO SE REGISTRA CON USUARIO, SINO CON EMAIL, POR ESO SOLO SE VALIDA EMAIL
      if ((user.email == emailoruser /*|| user.nombre == emailoruser*/) &&
          (user.password == password)) {
        return true;
      }
    }
    notifyListeners();
    return false;
  }
}
