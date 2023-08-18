// PICTURES

import 'package:flutter/material.dart';

abstract class AppPictures {
  static String onBoarding1 = "photos/onboarding_1.png";
  static String onBoarding2 = "photos/onboarding_2.png";
  static String logoRegistroExitoso = "photos/logo_registroexitoso.png";
  static String splitLinesLogin = "photos/detail_login_3rd.png";
  static String handHome = "photos/waving_hand.png";
  static String closeBottonDialog = "photos/cerrar_icon.png";
}

abstract class AppIcons {
  static String companyLogo = "photos/spinner-two.svg";
  static String googleLogo = "photos/LogoGoogle.svg";
  static String appleLogo = "photos/LogoApple.svg";
}

abstract class AppColors {
  static Color main = const Color.fromRGBO(84, 40, 241, 1);
  static Color title = const Color.fromRGBO(12, 16, 34, 1);
  static Color subtitleGrey = const Color.fromRGBO(145, 161, 178, 1);
  static Color backgroundLogin = const Color.fromRGBO(247, 247, 247, 1);
}

abstract class TextFieldLoginColors {
  static Color background = Colors.white;
  static Color title = const Color.fromRGBO(128, 138, 147, 1);
  static Color text = Colors.black;
  static Color hint = const Color.fromRGBO(177, 181, 187, 1);
  static Color border = const Color.fromRGBO(177, 181, 187, 1);
  static Color borderError = Colors.red;
  static Color icon = const Color.fromRGBO(158, 159, 167, 1);
}

abstract class TextFieldHomeColors {
  static Color background = Colors.white;
  static Color title = const Color.fromRGBO(12, 16, 34, 1);
  static Color text = Colors.black;
  static Color hint = const Color.fromRGBO(177, 181, 187, 1);
  static Color helper = const Color.fromRGBO(82, 91, 100, 1);
  static Color border = const Color.fromRGBO(200, 208, 217, 1);
  static Color borderError = Colors.red;
}

abstract class CheckBoxColors {
  static Color background = Colors.white;
  static Color border = const Color.fromRGBO(208, 213, 221, 1);
}

abstract class DropDownColors {
  static Color background = Colors.white;
  static Color title = const Color.fromRGBO(12, 16, 34, 1);
  static Color text = Colors.black;
  static Color hint = const Color.fromRGBO(177, 181, 187, 1);
  static Color borderAndIcon = const Color.fromRGBO(200, 208, 217, 1);
  static Color borderError = Colors.red;
}



abstract class AppTextStyles {
  static TextStyle textLogin = const TextStyle(
      letterSpacing: 0.24,
      wordSpacing: 3,
      fontSize: 26,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      shadows: <Shadow>[
        Shadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
            color: Color.fromARGB(255, 0, 0, 0))
      ]);
  static TextStyle hintGreyTextField =
      const TextStyle(fontSize: 14, color: Color.fromRGBO(128, 138, 147, 1));
}

abstract class TextLogin {
  static String text1 =
      "Accede a créditos con un solo toque y sin complicaciones.";
  static String text2 =
      "Toma el control de tus finanzas con confianza y accede a ellas sin restricciones.";
}
