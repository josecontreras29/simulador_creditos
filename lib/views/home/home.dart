import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/views/home/historial_credito.dart';
import 'package:simulador_creditos/views/home/simulador_credito.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  Widget _selectedWidget = SimulacionCredito();

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _selectedWidget = SimulacionCredito();
      } else {
        _selectedWidget = const HistorialCredito();
      }
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: _selectedWidget),
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
                    unselectedItemColor: const Color.fromRGBO(199, 199, 199, 1),
                    onTap: _onItemTapped))));
  }
}
