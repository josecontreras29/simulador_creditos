import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class TextfieldHome extends StatefulWidget {
  const TextfieldHome(
      {super.key,
      required this.title,
      required this.controller,
      this.action,
      this.hint,
      this.helper});
  final String title;
  final TextEditingController controller;
  final Function(String)? action;
  final String? hint;
  final String? helper;

  @override
  State<TextfieldHome> createState() => _TextfieldHomeState();
}

class _TextfieldHomeState extends State<TextfieldHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 327),
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.title,
              style: TextStyle(
                  color: TextFieldHomeColors.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
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
                      TextStyle(color: TextFieldHomeColors.text, fontSize: 14),
                  onChanged: (value) => widget.action!(value),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      helperText: widget.helper,
                      helperStyle: TextStyle(
                          color: TextFieldHomeColors.helper,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                      hintStyle: TextStyle(
                          color: TextFieldHomeColors.hint,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      fillColor: TextFieldHomeColors.background,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: TextFieldHomeColors.border)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: TextFieldHomeColors.borderError)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: AppColors.main)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: TextFieldHomeColors.borderError))),
                  onSaved: (newValue) => {widget.controller.text = newValue!}))
        ])));
  }
}
