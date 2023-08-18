import 'package:flutter/material.dart';

enum StylesBottomDialog {
  valoresDefault(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
  etiquetasIntereses(
      textStyle: TextStyle(
          color: Color.fromRGBO(82, 91, 100, 1),
          fontSize: 18,
          fontWeight: FontWeight.normal));

  const StylesBottomDialog({required this.textStyle});
  final TextStyle textStyle;
}
