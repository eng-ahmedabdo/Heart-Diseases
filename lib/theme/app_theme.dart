// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_diseases/constant/colors.dart';

class MyThemes {
  final lightTheme = ThemeData(
    primaryColor: mainColor,
    backgroundColor: whiteColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData(
    primaryColor: darkModeColor,
    backgroundColor: darkModeColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
