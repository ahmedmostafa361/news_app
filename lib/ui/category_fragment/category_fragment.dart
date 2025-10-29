import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/ui/category_fragment/category_item.dart';
import 'package:news_app_flutter/utlis/app_assets.dart';

typedef OnCategoryClick = void Function(Categoory);

class CategoryFragment extends StatelessWidget {
  final OnCategoryClick onCategoryClick;

  CategoryFragment({super.key, required this.onCategoryClick});

  ///business entertainment general health science sports technology
  final List<Categoory> categoryList = [
    Categoory(title: 'general', id: 'general', img: AppAssets.general),
    Categoory(title: 'business', id: 'business', img: AppAssets.busniess),
    Categoory(title: 'sports', id: 'sports', img: AppAssets.sport),
    Categoory(title: 'health', id: 'health', img: AppAssets.health),
    Categoory(
      title: 'entertainment',
      id: 'entertainment',
      img: AppAssets.entertainment,
    ),
    Categoory(title: 'technology', id: 'technology', img: AppAssets.technology),
    Categoory(title: 'science', id: 'science', img: AppAssets.science),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
