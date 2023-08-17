import 'package:flutter/material.dart';
import 'package:simulador_creditos/components/button_default.dart';
import 'package:simulador_creditos/components/initial_image.dart';
import 'package:simulador_creditos/components/initial_text.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';
import 'package:simulador_creditos/views/login.dart';
import 'package:simulador_creditos/views/registro.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
      const InitialImage(),
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Expanded(child: SizedBox()),
        const InitialText(),
        ButtonDefault(
            buttonStyle: StylesButtonDefault.defaultButton,
            text: "Ingresar",
            action: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()))),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ButtonDefault(
                buttonStyle: StylesButtonDefault.variantButton,
                text: "Registrarme",
                action: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registro()))))
      ])
    ]));
  }
}
