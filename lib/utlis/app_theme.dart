import 'package:flutter/material.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.blackColor,
    cardColor: AppColors.whiteColor,
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bold16Black,
      labelMedium: AppTextStyle.normal14Black,
      labelLarge: AppTextStyle.normal16black,
      headlineMedium: AppTextStyle.normal20black,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      titleTextStyle: AppTextStyle.normal20black,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.whiteColor,
    cardColor: AppColors.blackColor,
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bold16White,
      labelMedium: AppTextStyle.normal14White,
      labelLarge: AppTextStyle.normal16White,
      headlineMedium: AppTextStyle.normal20White,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: AppTextStyle.normal20White,
    ),
  );
}
