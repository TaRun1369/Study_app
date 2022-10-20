import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/sub_theme_data_mixing.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    final ThemeData systemThemeData = ThemeData.dark();
    return systemThemeData.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      )
    );
  }
}