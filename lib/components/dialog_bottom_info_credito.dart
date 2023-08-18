import 'package:flutter/material.dart';
import 'package:simulador_creditos/classes/simulacion._credito.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_bottom_dialog.dart';

Future bottomDialogInfoCredit(BuildContext context, Simulaciones simulaciones) {
  String obtenerMaxAmount() {
    try {
      return ((int.parse(simulaciones.salario) * 7) / 0.15).round().toString();
    } catch (e) {
      return "Error";
    }
  }

  double obtenerInteres() {
    switch (simulaciones.credito) {
      case "Vehicular":
        return 3.0;
      case "Hipotecario":
        return 1.0;
      case "Libre inversión":
        return 3.5;
      default:
        return 0;
    }
  }

  return showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(maxWidth: 430),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 390,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              Positioned(
                  top: 20,
                  right: 0,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AppPictures.closeBottonDialog))),
              Column(children: [
                Container(
                    margin: const EdgeInsets.only(right: 70, top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cuota máxima de préstamo',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text("\$${obtenerMaxAmount()},00",
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              '*Este valor suele cambiar con respecto a tu salario',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.main,
                                  fontWeight: FontWeight.normal)),
                        ])),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: const RowIntereses(
                        text: 'Tasa Efectiva Anual desde', value: '43.26%')),
                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: RowIntereses(
                        text: 'Tasa Mensual Vencida desde',
                        value: '${obtenerInteres()}%')),
                const RowIntereses(
                    text: 'Valor total del prestamo', value: '\$950'),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: const Divider(
                        color: Color.fromRGBO(223, 234, 251, 1), height: 1)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: const Text(
                            'Valor total a pagar \n(capital + intereses + seguro)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Text('\$1.112.501',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ])
              ])
            ]));
      });
}

class RowIntereses extends StatelessWidget {
  const RowIntereses({super.key, required this.text, required this.value});
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text, style: StylesBottomDialog.etiquetasIntereses.textStyle),
      Text(value, style: StylesBottomDialog.valoresDefault.textStyle)
    ]);
  }
}
