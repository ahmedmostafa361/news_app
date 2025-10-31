import 'package:flutter/material.dart';
import 'package:news_app_flutter/provider/app_language_provider.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/ui/home_screen/widget/IconTextWidget.dart';
import 'package:news_app_flutter/ui/home_screen/widget/custom_drop_down.dart';
import 'package:news_app_flutter/utlis/app_assets.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class DrawerItem extends StatefulWidget {
  final VoidCallback onClickHome;

  const DrawerItem({super.key, required this.onClickHome});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProviders>(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.whiteColor,
          height: height * 0.3,
          child: Center(
            child: Text(AppLocalizations.of(context)!.newsApp,
                style: AppTextStyle.bold24Black),
          ),
        ),
        SizedBox(height: height * 0.02),
        GestureDetector(
          onTap: () => widget.onClickHome(),
          child: IconTextWidget(
            text: AppLocalizations.of(context)!.goToHome,
            widget: Image.asset(AppAssets.homeIcon),
          ),
        ),
        SizedBox(height: height * 0.02),
        Divider(
          color: AppColors.whiteColor,
          endIndent: width * 0.032,
          indent: width * 0.032,
        ),
        SizedBox(height: height * 0.02),
        IconTextWidget(text: AppLocalizations.of(context)!.theme,
            widget: Image.asset(AppAssets.themeIcon)),
        SizedBox(height: height * 0.02),
        CustomDropdown<ThemeMode>(
          key: ValueKey(AppLocalizations.of(context)!.localeName),
          initialValue: themeProvider.appTheme,
          entries: [
            DropdownMenuEntry(
              value: ThemeMode.light,
              label: AppLocalizations.of(context)!.light,
            ),
            DropdownMenuEntry(
              value: ThemeMode.dark,
              label: AppLocalizations.of(context)!.dark,
            ),
          ],
          onSelected: (value) {
            if (value != null) themeProvider.changeTheme(value);
          },
        ),
        SizedBox(height: height * 0.02),
        Divider(
          color: AppColors.whiteColor,
          endIndent: width * 0.032,
          indent: width * 0.032,
        ),
        SizedBox(height: height * 0.02),
        IconTextWidget(
          text: AppLocalizations.of(context)!.language,
          widget: Image.asset(AppAssets.earthIcon),
        ),
        SizedBox(height: height * 0.02),
        CustomDropdown<String>(
          initialValue: languageProvider.appLanguage,
          entries: [
            DropdownMenuEntry(
              value: 'en',
              label: AppLocalizations.of(context)!.english,
            ),
            DropdownMenuEntry(
              value: 'ar',
              label: AppLocalizations.of(context)!.arabic,
            ),
          ],
          onSelected: (value) {
            if (value != null) languageProvider.changeLanguage(value);
          },
        ),
      ],
    );
  }
}
