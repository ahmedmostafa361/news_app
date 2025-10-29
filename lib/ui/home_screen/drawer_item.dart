import 'package:flutter/material.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/ui/home_screen/widget/IconTextWidget.dart';
import 'package:news_app_flutter/ui/home_screen/widget/custom_drop_down.dart';
import 'package:news_app_flutter/utlis/app_assets.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  final VoidCallback onClickHome;

  const DrawerItem({super.key, required this.onClickHome});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.whiteColor,
          height: height * 0.3,
          child: Center(
            child: Text('News App', style: AppTextStyle.bold24Black),
          ),
        ),
        SizedBox(height: height * 0.02),
        GestureDetector(
          onTap: () => onClickHome(),
          child: IconTextWidget(
            text: 'Go to home',
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
        IconTextWidget(text: 'Theme', widget: Image.asset(AppAssets.themeIcon)),
        SizedBox(height: height * 0.02),
        CustomDropdown<ThemeMode>(
          key: const ValueKey("theme_dropdown"),
          initialValue: themeProvider.appTheme,
          entries: [
            DropdownMenuEntry(value: ThemeMode.light, label: 'light'),
            DropdownMenuEntry(value: ThemeMode.dark, label: 'dark'),
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
          text: 'Language',
          widget: Image.asset(AppAssets.earthIcon),
        ),
        SizedBox(height: height * 0.02),
        CustomDropdown<ThemeMode>(
          key: const ValueKey("theme_dropdown2"),
          initialValue: themeProvider.appTheme,
          entries: [
            DropdownMenuEntry(value: ThemeMode.light, label: 'English'),
            DropdownMenuEntry(value: ThemeMode.dark, label: 'Arabic'),
          ],
          onSelected: (value) {
            if (value != null) themeProvider.changeTheme(value);
          },
        ),
      ],
    );
  }
}
