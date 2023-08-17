import 'package:flutter/material.dart';
import 'package:simulador_creditos/components/button_default.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';
import 'package:simulador_creditos/views/login.dart';

class RegistroExitoso extends StatelessWidget {
  const RegistroExitoso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    constraints: const BoxConstraints(maxWidth: 358),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppPictures.logoRegistroExitoso),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Text("Registro exitoso",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.title,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              constraints: const BoxConstraints(maxWidth: 317),
                              child: Text(
                                  "Hemos guardado tus credenciales de forma exitosa, Presiona continuar para seguir adelante.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.subtitleGrey))),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ButtonDefault(
                                  text: "Continuar",
                                  buttonStyle:
                                      StylesButtonDefault.variantButton,
                                  action: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()))))
                        ])))));
  }
}


