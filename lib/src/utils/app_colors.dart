import 'package:flutter/material.dart';

class AppColors {
  // static const Color primaryColor = Color(0xFF000096);

  static const Color primaryColor = Color(0xFF5B86E5);

  static const Color primaryAccentColor = Color(0xFF73D5FF);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color disabledColor = Color(0xFF6D6D6D);
  static const Color blackColorWhiteOpacity = Colors.white12;

  // Color From Figma Testing
  static const Color scaffoldBackGroundColor = Color(0xFFEDEDED) ;
  static const Color sectionBackGroundColor = Color(0xFFF2F2F2);
  static const Color primaryTextColor = Color(0xFF3D3D3D);
  static const Color secondaryTextColor = Color(0xFF6C6C6C);
  static const Color buttonColor1 = Color(0xFFC7C7C7);
  static const Color buttonColor2 = Color(0xFFEDEDED);
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;

  static const Gradient headerGradient = LinearGradient(colors: [
    Color(0xff29292B),
    Color(0xff585858),
  ], stops: [
    0.1,
    .8
  ]);
  static Shader linearTextGradient = LinearGradient(
    colors: <Color>[
      Color(0xff36D1DC),
      Color(0xff5B86E5),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static const Gradient blueButtonGradient = LinearGradient(colors: [
    Color(0xff36D1DC),
    Color(0xff5B86E5),
  ], stops: [
    0.1,
    1.8
  ]);
  static const Gradient disabledGradient = LinearGradient(colors: [
    Color(0xffEDEDED),
    Color(0xffEDEDED),
  ], stops: [
    0.1,
    1.8
  ]);

  static const Gradient whiteButtonGradient = LinearGradient(colors: [
    Color(0xffEDEDED),
    Color(0xffEDEDED),
  ], stops: [
    0.1,
    .8
  ]);

  //-----------------------------------------------------------

  static const Gradient normalModeGradient = LinearGradient(colors: [
    Color(0xff36D1DC),
    Color(0xff5B86E5),
  ], stops: [
    0.1,
    .8
  ]);

  static const Gradient darkModeGradient = LinearGradient(colors: [
    whiteColor,
    whiteColor,
  ], stops: [
    0.1,
    .8
  ]);

  /// font Colors
  static const Color fontColorWhite = Colors.white;
  static const Color fontColorBlack = Colors.black;

  /// font Size
  static const double fontSize = 16.0;

}
