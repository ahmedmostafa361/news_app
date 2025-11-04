import 'package:flutter/material.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/model/newsResponse.dart';
import 'package:news_app_flutter/ui/news/news_items_container.dart';
import 'package:news_app_flutter/ui/news/widget/bottom_sheet_widget.dart';

import '../../model/sourceResponse.dart';
import '../../utlis/app_colors.dart';
import '../../utlis/app_text_style.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.source,
    required this.category,
    required this.searchQuery,
  });

  final Categoory category;
  final Sources source;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(source.id!, searchQuery),
      builder: (context, snapshot) {
        ///todo: waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.darkBlueColor,
            ),
          );
        }
        ///TODO: in case of client error
        else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(
                    categoryId: category.id,); ////////////////**************
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlueColor,
                ),
                child: Text('try again', style: AppTextStyle.bold16Red),
              ),
            ],
          );
        }
        ///todo: in case of server response error
        else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? 'Error'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(
                      categoryId: category.id); ///////////********
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlueColor,
                ),
                child: Text('try again', style: AppTextStyle.bold16Red),
              ),
            ],
          );
        }

        /// todo: success
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          padding: EdgeInsets.only(
            top: height * 0.02,
          ),
          separatorBuilder: (context, index) {
            return SizedBox(height: height * 0.02);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Theme
                      .of(context)
                      .splashColor,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: BottomSheetWidget(news: newsList[index]),
                    );
                  },
                );
              },
              child: NewsItemsContainer(
                news: newsList[index],
              ),
            );
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
