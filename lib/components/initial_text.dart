import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class InitialText extends StatefulWidget {
  const InitialText({super.key});

  @override
  State<InitialText> createState() => _InitialTextState();
}

class _InitialTextState extends State<InitialText>
    with TickerProviderStateMixin {
  String text = TextLogin.text1;
  late Timer timer;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    timer = Timer.periodic(const Duration(seconds: 6), (_) async {
      setState(() {
        if (text == TextLogin.text2) {
          text = TextLogin.text1;
        } else {
          text = TextLogin.text2;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.reset();
    controller.forward();
    return FadeTransition(
        opacity: animation,
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) => Container(
                margin: const EdgeInsets.all(20),
                constraints: const BoxConstraints(maxWidth: 358),
                child: Text(text, style: AppTextStyles.textLogin))));
  }
}
