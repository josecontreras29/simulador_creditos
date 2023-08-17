import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_creditos/providers/provider_login.dart';
import 'package:simulador_creditos/providers/provider_register.dart';
import 'package:simulador_creditos/views/home.dart';
import 'package:simulador_creditos/views/initial_page.dart';
import 'package:simulador_creditos/views/login.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProviderRegister()),
    ChangeNotifierProvider(create: (_) => ProviderLogin())
  ], builder: (context, _) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
