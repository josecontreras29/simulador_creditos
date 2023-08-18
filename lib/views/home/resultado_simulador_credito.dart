import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class LoadingSimulandoCredito extends StatelessWidget {
  const LoadingSimulandoCredito({super.key});
  Future loading() {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: FutureBuilder(
                future: loading(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                            width: 113,
                            height: 113,
                            child: CircularProgressIndicator(
                                color: AppColors.main, strokeWidth: 8)),
                        Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Text("Simulando Crédito",
                                style: TextStyle(
                                    color: AppColors.main,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)))
                      ]);
                    default:
                      return const Home2();
                  }
                })));
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: const Text("Home2"));
  }
}
