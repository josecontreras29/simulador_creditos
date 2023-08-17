import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class CheckBoxDefault extends StatefulWidget {
  const CheckBoxDefault({super.key, required this.onAction});

  final Function(bool) onAction;

  @override
  State<CheckBoxDefault> createState() => _CheckBoxDefaultState();
}

class _CheckBoxDefaultState extends State<CheckBoxDefault> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.0, color: CheckBoxColors.border)),
        fillColor: MaterialStateProperty.all(CheckBoxColors.background),
        checkColor: AppColors.main,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        activeColor: Colors.red,
        value: isActive,
        onChanged: (value) {
          isActive = value!;
          widget.onAction(value);
          setState(() {});
        });
  }
}
