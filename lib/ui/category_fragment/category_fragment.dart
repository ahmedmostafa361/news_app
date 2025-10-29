import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/ui/category_fragment/category_item.dart';
import 'package:news_app_flutter/utlis/app_assets.dart';
import 'package:provider/provider.dart';

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
      Categoory(title: 'general',
          id: 'general',
          img: themeProvider.isDarkMode() ? AppAssets.general : AppAssets
              .generalD),
      Categoory(title: 'business',
          id: 'business',
          img: themeProvider.isDarkMode() ? AppAssets.busniess : AppAssets
              .bussD),
      Categoory(title: 'sports',
          id: 'sports',
          img: themeProvider.isDarkMode() ? AppAssets.sport : AppAssets
              .darkSports),
      Categoory(title: 'health',
          id: 'health',
          img: themeProvider.isDarkMode() ? AppAssets.health : AppAssets
              .healthD),
      Categoory(
        title: 'entertainment',
        id: 'entertainment',
        img: themeProvider.isDarkMode() ? AppAssets.entertainment : AppAssets
            .fsharD,
      ),
      Categoory(title: 'technology',
          id: 'technology',
          img: themeProvider.isDarkMode() ? AppAssets.technology : AppAssets
              .techD),
      Categoory(title: 'science',
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
            'Good Morning \nHere is Some News For You',
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
