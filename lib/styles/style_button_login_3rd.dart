import 'package:flutter/material.dart';

enum StylesButtonLogin3rd {
  defaultButton(
      backgroundColor: Colors.white,
      borderColor: Color.fromRGBO(200, 208, 217, 1),
      textStyle: TextStyle(
          color: Color.fromRGBO(29, 28, 43, 1),
          fontSize: 14,
          fontWeight: FontWeight.w500));

  const StylesButtonLogin3rd(
      {required this.backgroundColor,
      required this.borderColor,
      required this.textStyle});
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle textStyle;
}
