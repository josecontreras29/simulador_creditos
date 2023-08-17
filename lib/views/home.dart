import 'package:flutter/material.dart';
import 'package:simulador_creditos/components/textfield_home.dart';
import 'package:simulador_creditos/styles/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController salarioBase = TextEditingController();
  TextEditingController meses = TextEditingController();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("Hola Jesús G.",
                          style: TextStyle(
                              color: AppColors.title,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Image.asset(AppPictures.handHome))
                    ])),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("Simulador de crédito",
                          style: TextStyle(
                              color: AppColors.main,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.info_outline,
                              size: 24, color: AppColors.main))
                    ])),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                    "Ingresa los datos para tu crédito según lo que necesites.",
                    style: TextStyle(
                        color: AppColors.title,
                        fontSize: 22,
                        fontWeight: FontWeight.w500))),
          ]),
          TextfieldHome(
              title: "¿Qué tipo de créditos deseas realizar?",
              controller: salarioBase,
              hint: "\$10'000.000,00",
              helper:
                  "Digíta tu salario para calcular el préstamo que necesitas"),
          TextfieldHome(
              title: "¿A cuántos meses?",
              controller: meses,
              hint: "4",
              helper: "Elije un plazo desde 12 hasta 84 meses")
        ]),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: SizedBox(
                height: 100,
                child: BottomNavigationBar(
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_filled), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.wallet_sharp),
                          label: 'Historial créditos')
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: AppColors.main,
                    unselectedItemColor:
                        BottomNavigationBarColors.unselectedIcon,
                    onTap: _onItemTapped))));
  }
}
