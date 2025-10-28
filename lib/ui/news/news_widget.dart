import 'package:flutter/material.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/model/newsResponse.dart';

import '../../model/sourceResponse.dart';
import '../../utlis/app_colors.dart';
import '../../utlis/app_text_style.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key, required this.source});

  Sources source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(source.id!),
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
                  ApiManager.getSources();
                },
                child: Text('try again', style: AppTextStyle.bold16Red),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlueColor,
                ),
              ),
            ],
          );
        }
        ///todo: in case of server response error
        else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources();
                },
                child: Text('try again', style: AppTextStyle.bold16Red),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlueColor,
                ),
              ),
            ],
          );
        }

        /// todo: success
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(newsList[index].title!);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
