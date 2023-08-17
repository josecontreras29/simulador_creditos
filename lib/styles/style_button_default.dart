import 'package:flutter/material.dart';

enum StylesButtonDefault {
  defaultButton(
      backgroundColor: Colors.white,
      textStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
  variantButton(
      backgroundColor: Color.fromRGBO(84, 40, 241, 1),
      textStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500));

  const StylesButtonDefault(
      {required this.backgroundColor, required this.textStyle});
  final Color backgroundColor;
  final TextStyle textStyle;
}
