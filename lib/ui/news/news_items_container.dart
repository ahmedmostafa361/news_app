import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/newsResponse.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItemsContainer extends StatelessWidget {
  const NewsItemsContainer({super.key, required this.news});

  final Articles news;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final DateTime? published = DateTime.tryParse(
      news.publishedAt ?? '',
    )?.toLocal();
    String timeAgoText = '';
    if (published != null) {
      timeAgoText = timeago.format(published);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.005,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      // height: height*0.435,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage!,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(news.title ?? '', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Expanded(
                child: Text(
                  'by: ${news.author}',
                  style: AppTextStyle.normal12Grey,
                ),
              ),
              SizedBox(width: width * 0.02),
              Text(timeAgoText, style: AppTextStyle.normal12Grey),
            ],
          ),
        ],
      ),
    );
  }
}
