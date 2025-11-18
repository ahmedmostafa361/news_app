import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/ui/category_details/widget/source_name_in_tab.dart';
import 'package:news_app_flutter/ui/news/news_widget.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';

import '../../../model/sourceResponse.dart';

class SourceTabWidget extends StatefulWidget {
  const SourceTabWidget(
      {super.key, required this.sourcesList, required this.category, required this.searchQuery, required this.language});

  final List<Sources> sourcesList;
  final Categoory category;
  final String searchQuery;
  final String language;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme
                .of(context)
                .splashColor,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList.map((source) {
              return SourceNameInTab(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),

            /// todo: we can use also list generate instead of map == List
            /// List.generate(sourcesList.length, (index) {
            //   final source = sourcesList[index];
            //   return SourceName(
            //     source: source,
            //     isSelected: selectedIndex == index,
            //   );
            // }),
          ),
          Expanded(
              child: NewsWidget(
                key: UniqueKey(),
                source: widget.sourcesList[selectedIndex],
            category: widget.category,
            searchQuery: widget.searchQuery,))
        ],
      ),
    );
  }
}
