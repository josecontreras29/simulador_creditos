import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_creditos/classes/user.dart';
import 'package:simulador_creditos/classes/validate_form.dart';
import 'package:simulador_creditos/components/button_default.dart';
import 'package:simulador_creditos/components/company_name.dart';
import 'package:simulador_creditos/components/terms_and_conditions.dart';
import 'package:simulador_creditos/components/textfield_login_register.dart';
import 'package:simulador_creditos/providers/provider_register.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';
import 'package:simulador_creditos/views/login.dart';
import 'package:simulador_creditos/views/registro_exitoso.dart';

class Registro extends StatelessWidget {
  Registro({super.key});

  TextEditingController nombre = TextEditingController();
  TextEditingController identificacion = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLogin,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      const CompanyName(),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text("Regístrate",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.title,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700))),
                      Text("Solo te tomará unos minutos.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.subtitleGrey, fontSize: 16)),
                      TextfieldLoginRegister(
                          controller: nombre,
                          title: "Nombre completo",
                          icon: Icons.person_outline,
                          hint: "Escribe tu nombre"),
                      TextfieldLoginRegister(
                          controller: identificacion,
                          title: "Identificación",
                          hint: "Escribe tu número de identificación"),
                      TextfieldLoginRegister(
                          controller: email,
                          title: "Email",
                          icon: Icons.person_outline,
                          hint: "Uname@mail.com"),
                      TextfieldLoginRegister(
                          controller: password,
                          title: "Contraseña",
                          icon: Icons.lock_outline_rounded,
                          hint: "Password"),
                      const TermsAndConditions(),
                      ButtonDefault(
                          text: "Continuar",
                          buttonStyle: StylesButtonDefault.variantButton,
                          action: () {
                            ProviderRegister provider =
                                context.read<ProviderRegister>();
                            final validator = ValidateForm();
                            if (provider.checkRequirements(
                                validator.validateAndSave(_formKey))) {
                              provider.registeredUsers.add(User(
                                  nombre: nombre.text,
                                  identificacion: identificacion.text,
                                  email: email.text,
                                  password: password.text));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistroExitoso()));
                            }
                          }),
                      Container(
                          constraints: const BoxConstraints(maxWidth: 306),
                          margin: const EdgeInsets.only(top: 20, bottom: 100),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "¿Ya tienes una cuenta? ",
                                style: TextStyle(
                                    color: AppColors.title, fontSize: 14)),
                            TextSpan(
                                text: "Inicia sesión",
                                style: TextStyle(
                                    color: AppColors.main, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login())))
                          ])))
                    ])))));
  }
}
