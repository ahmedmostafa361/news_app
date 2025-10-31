import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/ui/category_fragment/category_item.dart';
import 'package:news_app_flutter/utlis/app_assets.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

typedef OnCategoryClick = void Function(Categoory);

class CategoryFragment extends StatelessWidget {
  final OnCategoryClick onCategoryClick;

  CategoryFragment({super.key, required this.onCategoryClick});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    ///business entertainment general health science sports technology
    final List<Categoory> categoryList = [
      Categoory(title: AppLocalizations.of(context)!.general,
          id: 'general',
          img: themeProvider.isDarkMode() ? AppAssets.general : AppAssets
              .generalD),
      Categoory(title: AppLocalizations.of(context)!.business,
          id: 'business',
          img: themeProvider.isDarkMode() ? AppAssets.busniess : AppAssets
              .bussD),
      Categoory(title: AppLocalizations.of(context)!.sports,
          id: 'sports',
          img: themeProvider.isDarkMode() ? AppAssets.sport : AppAssets
              .darkSports),
      Categoory(title: AppLocalizations.of(context)!.health,
          id: 'health',
          img: themeProvider.isDarkMode() ? AppAssets.health : AppAssets
              .healthD),
      Categoory(
        title: AppLocalizations.of(context)!.entertainment,
        id: 'entertainment',
        img: themeProvider.isDarkMode() ? AppAssets.entertainment : AppAssets
            .fsharD,
      ),
      Categoory(title: AppLocalizations.of(context)!.technology,
          id: 'technology',
          img: themeProvider.isDarkMode() ? AppAssets.technology : AppAssets
              .techD),
      Categoory(title: AppLocalizations.of(context)!.science,
          id: 'science',
          img: themeProvider.isDarkMode() ? AppAssets.science : AppAssets
              .scienceD),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.005),
          Text(
            AppLocalizations.of(context)!.goodMorning,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoryList.length,
              cacheExtent: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
