import 'package:flutter/material.dart';
import 'package:simulador_creditos/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          ButtonDefault(
              buttonStyle: StylesButtonDefault.defaultButton,
              text: "Ingresar",
              action: () {}),
          ButtonDefault(
              buttonStyle: StylesButtonDefault.variantButton,
              text: "Registrarme",
              action: () {})
        ])));
  }
}

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
    return InkWell(
        onTap: () => action,
        child: Container(
            width: 358,
            height: 50,
            decoration: BoxDecoration(
                // image: DecorationImage(),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.principalColor),
                color: buttonStyle.backgroundColor),
            alignment: Alignment.center,
            child: Text(text, style: buttonStyle.textStyle)));
  }
}

enum StylesButtonDefault {
  defaultButton(
      backgroundColor: Colors.transparent,
      textStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
  variantButton(
      backgroundColor: Color.fromRGBO(84, 40, 241, 1),
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));

  const StylesButtonDefault(
      {required this.backgroundColor, required this.textStyle});
  final Color backgroundColor;
  final TextStyle textStyle;
}
