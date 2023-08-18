import 'package:flutter/material.dart';
import 'package:simulador_creditos/classes/simulacion._credito.dart';

class ProviderHome extends ChangeNotifier {
  String _valueSimulatedHome = "";
  List<Simulaciones> listaSimulaciones = [];

  String get valueSimulatedHome => _valueSimulatedHome;

  set valueSimulatedHome(String value) {
    _valueSimulatedHome = value;
    notifyListeners();
  }


}
