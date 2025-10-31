import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/ui/category_details/category_screen.dart';
import 'package:news_app_flutter/ui/category_fragment/category_fragment.dart';
import 'package:news_app_flutter/ui/home_screen/drawer_item.dart';
import 'package:news_app_flutter/ui/home_screen/widget/custom_text_form_field .dart';
import 'package:news_app_flutter/utlis/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textSearchController = TextEditingController();
  bool isSearching = false;

  Categoory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? CustomTextFormField(
          controller: textSearchController,
          onChanged: (p0) {
            setState(() {});
          },
          labelStyle: Theme
              .of(context)
              .textTheme
              .titleMedium,
          BorderSideColor: Theme
              .of(context)
              .primaryColor,
        )
            : Text(selectedCategory == null ? 'Home' : selectedCategory!.title),
        centerTitle: true,
        actions: [
          selectedCategory != null
              ? IconButton(
            onPressed: () {
              if (isSearching) {
                textSearchController.clear();
              }
              isSearching = !isSearching;
              setState(() {});
            },
            icon: isSearching
                ? Icon(Icons.close)
                : Icon(Icons.search_outlined),
          )
              : SizedBox(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: DrawerItem(
          onClickHome: onClickHome,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryClick: onCategoryClick)
          : CategoryScreen(
        categoryId: selectedCategory!,
        searchQuery: textSearchController.text,
      ),
    );
  }

  void onCategoryClick(Categoory newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  void onClickHome() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
