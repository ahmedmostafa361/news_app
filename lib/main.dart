import 'package:flutter/material.dart';
import 'package:news_app_flutter/ui/home_screen.dart';
import 'package:news_app_flutter/utlis/app_routes.dart';
import 'package:news_app_flutter/utlis/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRoute,
      routes: {AppRoutes.homeScreenRoute: (context) => HomeScreen()},
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
