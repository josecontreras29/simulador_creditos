import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_creditos/classes/simulacion._credito.dart';
import 'package:simulador_creditos/classes/validate_form.dart';
import 'package:simulador_creditos/components/dialog_bottom_info_credito.dart';
import 'package:simulador_creditos/components/button_default.dart';
import 'package:simulador_creditos/components/dropdown_home.dart';
import 'package:simulador_creditos/components/textfield_home.dart';
import 'package:simulador_creditos/providers/provider_home.dart';
import 'package:simulador_creditos/styles/constants.dart';
import 'package:simulador_creditos/styles/style_button_default.dart';
import 'package:simulador_creditos/views/home/resultado_simulador_credito.dart';

class SimulacionCredito extends StatelessWidget {
  SimulacionCredito({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProviderHome providerHome =
        Provider.of<ProviderHome>(context, listen: false);
    TextEditingController salarioBase = TextEditingController();
    TextEditingController meses = TextEditingController();
    String? valueDropDownCredit;

    return Form(
        key: _formKey,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                  constraints: const BoxConstraints(maxWidth: 358),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text("Hola Jesús G.",
                                      style: TextStyle(
                                          color: AppColors.title,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      child: Image.asset(AppPictures.handHome))
                                ])),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text("Simulador de crédito",
                                      style: TextStyle(
                                          color: AppColors.main,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      child: Icon(Icons.info_outline,
                                          size: 24, color: AppColors.main))
                                ])),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Text(
                                "Ingresa los datos para tu crédito según lo que necesites.",
                                style: TextStyle(
                                    color: AppColors.title,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500)))
                      ])),
              DropDownHome(
                  title: "¿Qué tipo de créditos deseas realizar?",
                  hint: "Selecciona el tipo de créditos",
                  action: (value) {
                    valueDropDownCredit = value;
                  }),
              TextfieldHome(
                  title: "¿Cuánto es tu salario base?",
                  controller: salarioBase,
                  hint: "\$10'000.000,00",
                  helper:
                      "Digíta tu salario para calcular el préstamo que necesitas",
                  action: (value) {
                    try {
                      providerHome.valueSimulatedHome =
                          ((int.parse(value) * 7) / 0.15).round().toString();
                    } catch (e) {
                      value.isEmpty
                          ? providerHome.valueSimulatedHome = ""
                          : providerHome.valueSimulatedHome = "Error";
                    }
                  }),
              Consumer<ProviderHome>(
                  builder: (context, provider, child) => Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(224, 224, 224, 1),
                          borderRadius: BorderRadius.circular(6)),
                      height: 50,
                      constraints: const BoxConstraints(maxWidth: 327),
                      child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: "\$ ${provider.valueSimulatedHome}"),
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(
                              color: TextFieldHomeColors.text, fontSize: 14),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              border: InputBorder.none,
                              hintText: "\$0",
                              hintStyle: TextStyle(
                                  color: TextFieldHomeColors.title,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                      color: TextFieldHomeColors.border)),
                              fillColor:
                                  const Color.fromRGBO(224, 224, 224, 1))))),
              TextfieldHome(
                  action: (value) {},
                  title: "¿A cuántos meses?",
                  controller: meses,
                  hint: "48",
                  helper: "Elije un plazo desde 12 hasta 84 meses"),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ButtonDefault(
                      text: "Simular",
                      buttonStyle: StylesButtonDefault.variantButton,
                      action: () {
                        final validator = ValidateForm();
                        if (validator.validateAndSave(_formKey)) {
                          Simulaciones simulacion = Simulaciones(
                              credito: valueDropDownCredit!,
                              salario: salarioBase.text,
                              meses: meses.text);
                          providerHome.listaSimulaciones.add(simulacion);
                          bottomDialogInfoCredit(context, simulacion);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoadingSimulandoCredito()));
                        }
                      }))
            ])));
  }
}
