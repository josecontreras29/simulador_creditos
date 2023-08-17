import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_creditos/components/checkbox_default.dart';
import 'package:simulador_creditos/providers/provider_register.dart';
import 'package:simulador_creditos/styles/constants.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 357),
        child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
          CheckBoxDefault(
              onAction: (value) =>
                  context.read<ProviderRegister>().termsAndConditions = value),
          Container(
              constraints: const BoxConstraints(maxWidth: 306),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Acepto los ",
                    style: TextStyle(color: AppColors.title, fontSize: 14)),
                TextSpan(
                    text: "Términos y Condiciones ",
                    style: TextStyle(color: AppColors.main, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {/*Términos y Condiciones*/}),
                TextSpan(
                    text: "y la ",
                    style: TextStyle(color: AppColors.title, fontSize: 14)),
                TextSpan(
                    text: "Política de privacidad ",
                    style: TextStyle(color: AppColors.main, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {/*Política de privacidad*/}),
                TextSpan(
                    text: "de Banca créditos",
                    style: TextStyle(color: AppColors.title, fontSize: 14))
              ]))),
          Consumer<ProviderRegister>(builder: (context, provider, _) {
            return Visibility(
                visible: !provider.termsandconditions,
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                        "Por favor acepta los términos y condiciones",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 14))));
          })
        ]));
  }
}
