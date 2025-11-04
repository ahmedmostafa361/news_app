import 'package:flutter/material.dart';
import 'package:news_app_flutter/l10n/app_localizations.dart';
import 'package:news_app_flutter/model/category.dart';
import 'package:news_app_flutter/utlis/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});

  final Categoory category;
  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(category.img),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: (index % 2 == 0)
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        child: SizedBox(
          width: width * 0.335,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.012,
              vertical: height * 0.01,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyColor,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.00,
                  vertical: height * 0.001,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: (index % 2 == 0) ? width * 0.022 : 0,
                    ),
                    child: (index % 2 == 1) ? CircleAvatar(
                      backgroundColor: Theme
                          .of(context)
                          .splashColor,
                      child: Icon(
                        (index % 2 == 0)
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        color: Theme
                            .of(context)
                            .cardColor,
                      ),
                    ) :
                    Text(
                      AppLocalizations.of(context)!.viewAll,
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  ),
                  (index % 2 == 0) ? CircleAvatar(
                    backgroundColor: Theme.of(context).splashColor,
                    child: Icon(
                      (index % 2 == 0)
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios,
                      color: Theme.of(context).cardColor,
                    ),
                  ) : Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.viewAll,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium,
                      ),
                      SizedBox(width: width * 0.022,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
