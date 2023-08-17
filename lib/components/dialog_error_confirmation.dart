import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';

dialogWithOk(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) => Center(
              child: SingleChildScrollView(
                  child: AlertDialog(
                      content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                Text(text, style: StylesButtonDefault.defaultButton.textStyle),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: StylesButtonDefault
                                .variantButton.backgroundColor,
                            border: Border.all(color: AppColors.main)),
                        child: Text("Ok",
                            textAlign: TextAlign.center,
                            style:
                                StylesButtonDefault.variantButton.textStyle)))
              ])))));
}
