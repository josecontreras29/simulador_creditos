import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class TextfieldLoginRegister extends StatefulWidget {
  const TextfieldLoginRegister(
      {super.key,
      required this.title,
      this.hint,
      this.icon,
      required this.controller});
  final String title;
  final String? hint;
  final IconData? icon;
  final TextEditingController controller;
  @override
  State<TextfieldLoginRegister> createState() => _TextfieldLoginRegisterState();
}

class _TextfieldLoginRegisterState extends State<TextfieldLoginRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 327),
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.title, style: AppTextStyles.hintGreyTextField),
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Completa el campo';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.controller,
                  textAlignVertical: TextAlignVertical.center,
                  style:
                      TextStyle(color: TextFieldLoginColors.text, fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    prefixIcon:
                        Icon(widget.icon, color: TextFieldLoginColors.icon),
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        color: TextFieldLoginColors.hint,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    fillColor: TextFieldLoginColors.background,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: TextFieldLoginColors.border)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: TextFieldLoginColors.borderError)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.main)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: TextFieldLoginColors.borderError)),
                  ),
                  onSaved: (newValue) => {widget.controller.text = newValue!}))
        ])));
  }
}
