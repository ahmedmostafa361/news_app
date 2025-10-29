import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/provider/app_theme_provider.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/newsResponse.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.news});

  final Articles news;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      // height: height*0.3 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage!,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              news.content ?? '',
              style: themeProvider.isLightMode()
                  ? AppTextStyle.bold14White
                  : AppTextStyle.bold14Black,
            ),
            SizedBox(height: height * 0.02),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.02,
                ),
              ),
              onPressed: () async {
                final url = Uri.parse(news.url ?? '');

                /// todo: Uri.parse(...) → converts that String into a Uri object, which url_launcher needs.
                if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
                  throw Exception('Could not launch $url');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open the article')),
                  );
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'View Full Articles',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
