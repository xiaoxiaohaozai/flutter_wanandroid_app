import 'package:flutter/material.dart';

//全局配置
class GlobalConfig {
  static bool dark = false;

  static ThemeData themeDataDark = ThemeData.dark();
  static ThemeData themeDataLight = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.grey[100], //顶部导航栏和状态栏的颜色
  );
  static ThemeData themeData = getThemeData(dark);


  static ThemeData getThemeData(bool dark) {
    if (dark) {
      return themeDataDark;
    } else {
      return themeDataLight;
    }
  }
}
