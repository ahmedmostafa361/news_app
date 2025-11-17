import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/provider/app_language_provider.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/ui/home_screen/home_screen.dart';
import 'package:news_app_flutter/utlis/app_routes.dart';
import 'package:news_app_flutter/utlis/app_theme.dart';
import 'package:provider/provider.dart';

import 'api/bloc_opserver.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProviders()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProviders>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRoute,
      routes: {AppRoutes.homeScreenRoute: (context) => HomeScreen()},
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
