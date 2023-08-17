import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_creditos/components/button_default.dart';
import 'package:simulador_creditos/components/button_login_3rd_person.dart';
import 'package:simulador_creditos/components/checkbox_default.dart';
import 'package:simulador_creditos/components/company_name.dart';
import 'package:simulador_creditos/components/dialog_error_confirmation.dart';
import 'package:simulador_creditos/components/textfield_login_register.dart';
import 'package:simulador_creditos/providers/provider_login.dart';
import 'package:simulador_creditos/providers/provider_register.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';
import 'package:simulador_creditos/views/home.dart';
import 'package:simulador_creditos/views/registro.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailorusuario = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CompanyName(),
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 30, left: 20, right: 20),
                              constraints: const BoxConstraints(maxWidth: 303),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Inicia sesión o continua, ",
                                        style: TextStyle(
                                            color: AppColors.title,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: "solo te tomará unos minutos.",
                                        style: TextStyle(
                                            color: AppColors.title,
                                            fontSize: 16))
                                  ]))),
                          TextfieldLoginRegister(
                              hint: "Uname@mail.com",
                              icon: Icons.lock_outline_rounded,
                              title: "Email or Usuario",
                              controller: emailorusuario),
                          TextfieldLoginRegister(
                              hint: "Password",
                              icon: Icons.person_outline,
                              title: "Contraseña",
                              controller: password),
                          Container(
                              width: 327,
                              margin: const EdgeInsets.all(20),
                              child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CheckBoxDefault(onAction: (value) {}),
                                          Text("Recordarme",
                                              style: TextStyle(
                                                  color: AppColors.title,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500))
                                        ]),
                                    const SizedBox(width: 20),
                                    SizedBox(
                                        width: 145,
                                        child: RichText(
                                            text: TextSpan(
                                                text: "¿Olvide mi contraseña?",
                                                style: TextStyle(
                                                    color: AppColors.main,
                                                    fontSize: 14),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        /*Olvide mi contraseña*/
                                                      })))
                                  ])),
                          ButtonDefault(
                              text: "Iniciar sesión",
                              buttonStyle: StylesButtonDefault.variantButton,
                              action: () {
                                ProviderLogin provider =
                                    context.read<ProviderLogin>();
                                if (_validateAndSave()) {
                                  if (provider.checkIfIsRegistered(
                                      emailorusuario.text,
                                      password.text,
                                      context
                                          .read<ProviderRegister>()
                                          .registeredUsers)) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  } else {
                                    dialogWithOk(context,
                                        "Usuario o contraseña inválidos");
                                  }
                                }
                              }),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Image(
                                  image:
                                      AssetImage(AppPictures.splitLinesLogin))),
                          LoginWith3rd(
                              text: "Ingresa con Google",
                              icon: AppIcons.googleLogo),
                          LoginWith3rd(
                              text: "Ingresa con Apple",
                              icon: AppIcons.appleLogo),
                          Container(
                              constraints: const BoxConstraints(maxWidth: 306),
                              margin: const EdgeInsets.only(
                                  top: 20, bottom: 100, left: 20, right: 20),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "¿No tienes una cuenta? ",
                                    style: TextStyle(
                                        color: AppColors.title, fontSize: 14)),
                                TextSpan(
                                    text: "Regístrate",
                                    style: TextStyle(
                                        color: AppColors.main, fontSize: 14),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registro())))
                              ])))
                        ])))));
  }
}

