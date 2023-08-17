import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simulador_creditos/styles/constants.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Wrap(alignment: WrapAlignment.center, children: [
          SvgPicture.asset(AppIcons.companyLogo,
              semanticsLabel: 'Company logo'),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text("Banca créditos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.title,
                      fontSize: 28,
                      fontWeight: FontWeight.w500)))
        ]));
  }
}
