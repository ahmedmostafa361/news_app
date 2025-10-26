import 'package:flutter/material.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/ui/category_details/widget/source_tab_widget.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
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
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
