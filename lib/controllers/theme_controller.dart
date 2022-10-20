import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_study_app/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';
class ThemeController extends GetxController{

  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  //onInit app boot up hone se pehle initialize karega aur memory allocate karega
  //isliye onReady se alah hai ye
  void onInit(){
    initializedThemeData();
    super.onInit();
  }
  initializedThemeData(){
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  //get controller
  ThemeData get darkTheme=> _darkTheme;
  ThemeData get lightTheme=> _lightTheme;
}