import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/ui/category_details/cubit/category_view_model.dart';
import 'package:news_app_flutter/ui/category_details/cubit/news_category_states.dart';
import 'package:news_app_flutter/ui/category_details/widget/source_tab_widget.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen(
      {super.key, required this.categoryId, required this.searchQuery, required this.language});

  final Categoory categoryId;
  final String searchQuery;
  final String language;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryId.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<CategoryViewModel, NewsStates>(
        builder: (context, state) {
          if (state is NewsLoadingStates) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.darkBlueColor,
              ),
            );
          } else if (state is NewsErrorStates) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(
                        categoryId: widget.categoryId
                            .id); /////////////*****************
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlueColor,
                  ),
                  child: Text('try again', style: AppTextStyle.bold16Red),
                ),
              ],
            );
          } else if (state is NewsSuccessStates) {
            return SourceTabWidget(
              sourcesList: state.sourcesList,
              category: widget.categoryId,
              searchQuery: widget.searchQuery,
              language: widget.language,
            );
          }
          return Container();
        },
      ),
    );
  }
}
