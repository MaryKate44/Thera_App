import 'package:flutter/material.dart';
import 'package:thera_app/theme/colors.dart';
// import '../constants/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        foregroundColor: Colors.white,
      ),
    ),
    // backgroundColor: AppColors.background,
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: AppColors.textPrimary),
    //   bodyText2: TextStyle(color: AppColors.textPrimary),
    // ),
  );
}
