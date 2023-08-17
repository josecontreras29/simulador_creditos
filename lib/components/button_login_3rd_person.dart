import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simulador_creditos/styles/style_button_login_3rd.dart';

class LoginWith3rd extends StatelessWidget {
  const LoginWith3rd({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 327),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: StylesButtonLogin3rd.defaultButton.backgroundColor,
            border: Border.all(
                color: StylesButtonLogin3rd.defaultButton.borderColor)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 17,
                  width: 17,
                  margin: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(icon)),
              Text(text, style: StylesButtonLogin3rd.defaultButton.textStyle)
            ]));
  }
}
