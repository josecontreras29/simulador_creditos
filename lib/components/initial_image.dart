import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class InitialImage extends StatefulWidget {
  const InitialImage({super.key});

  @override
  State<InitialImage> createState() => _InitialImageState();
}

class _InitialImageState extends State<InitialImage> {
  String image = AppPictures.onBoarding1;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(
        const Duration(seconds: 6),
        (_) async => setState(() {
              if (image == AppPictures.onBoarding2) {
                image = AppPictures.onBoarding1;
              } else {
                image = AppPictures.onBoarding2;
              }
            }));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(110, 0, 0, 0), BlendMode.darken),
                image: AssetImage(image),
                fit: BoxFit.fitWidth)),
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.1, 0.3]))));
  }
}
