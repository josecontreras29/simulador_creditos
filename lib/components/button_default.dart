import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault(
      {super.key,
      required this.text,
      required this.buttonStyle,
      required this.action});
  final String text;
  final StylesButtonDefault buttonStyle;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () => action(),
          child: Container(
              constraints: const BoxConstraints(maxWidth: 358),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.main),
                  color: buttonStyle.backgroundColor),
              alignment: Alignment.center,
              child: Text(text, style: buttonStyle.textStyle))),
    );
  }
}
