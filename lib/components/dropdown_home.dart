import 'package:flutter/material.dart';
import 'package:simulador_creditos/styles/constants.dart';

class DropDownHome extends StatefulWidget {
  DropDownHome(
      {super.key,
      required this.title,
      required this.hint,
      this.dropDownValue,
      this.action});
  final String title;
  final String hint;
  String? dropDownValue;
  Function(String)? action;

  @override
  State<DropDownHome> createState() => _DropDownHomeState();
}

class _DropDownHomeState extends State<DropDownHome> {
  List<String> list = [
    'Vehicular',
    'Hipotecario',
    'Libre inversión',
  ];

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
                  color: DropDownColors.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          Container(
              margin: const EdgeInsets.only(top: 15),
              constraints: const BoxConstraints(maxWidth: 327),
              child: DropdownButtonFormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null) {
                      return 'Selecciona una opción';
                    } else {
                      return null;
                    }
                  },
                  hint: Text("Selecciona el tipo de créditos",
                      style: TextStyle(
                          color: DropDownColors.hint,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                  focusColor: Colors.white,
                  decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: TextStyle(
                          color: DropDownColors.hint,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      fillColor: DropDownColors.background,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: DropDownColors.borderAndIcon)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: DropDownColors.borderError)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: DropDownColors.borderAndIcon)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: TextFieldHomeColors.borderError))),
                  isDense: true,
                  borderRadius: BorderRadius.circular(6),
                  dropdownColor: DropDownColors.background,
                  iconSize: 20,
                  value: widget.dropDownValue,
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: DropDownColors.borderAndIcon),
                  elevation: 16,
                  style: TextStyle(color: DropDownColors.text),
                  onSaved: (newValue) => {
                        widget.dropDownValue = newValue!,
                        widget.action!(newValue)
                      },
                  onChanged: (String? value) {
                    setState(() {
                      widget.dropDownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList()))
        ])));
  }
}
