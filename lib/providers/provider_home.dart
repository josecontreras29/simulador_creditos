import 'package:flutter/material.dart';

class ProviderHome extends ChangeNotifier {
  String _valueSimulatedHome = "";

  String get valueSimulatedHome => _valueSimulatedHome;

  set valueSimulatedHome(String value) {
    _valueSimulatedHome = value;
    notifyListeners();
  }
}
