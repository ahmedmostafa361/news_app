import 'package:flutter/material.dart';
import 'package:news_app_flutter/utlis/app_text_style.dart';

class IconTextWidget extends StatelessWidget {
  final Widget widget;
  final String text;

  const IconTextWidget({super.key, required this.widget, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: width * 0.03),
        widget,
        SizedBox(width: width * 0.04),
        Text(text, style: AppTextStyle.bold20White),
      ],
    );
  }
}
