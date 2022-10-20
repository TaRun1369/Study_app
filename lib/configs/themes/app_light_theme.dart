import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/sub_theme_data_mixing.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
// with use kiya to inherit mixin ke kuch kam ki cheeze
class LightTheme  with SubThemeData{
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme:getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      )
    );
  }

}