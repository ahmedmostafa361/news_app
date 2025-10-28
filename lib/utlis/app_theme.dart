import 'package:flutter/material.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.blackColor,
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.normal14Black,
      labelMedium: AppTextStyle.normal14Black,
      labelLarge: AppTextStyle.normal16black,
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
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.normal16White,
      labelMedium: AppTextStyle.normal14White,
      labelLarge: AppTextStyle.normal16White,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: AppTextStyle.normal20White,
    ),
  );
}
