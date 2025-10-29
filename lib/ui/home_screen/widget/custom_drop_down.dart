import 'package:flutter/material.dart';

import '../../../utlis/app_colors.dart';
import '../../../utlis/app_text_style.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? initialValue;
  final List<DropdownMenuEntry<T>> entries;
  final void Function(T?) onSelected;

  const CustomDropdown({
    super.key,
    required this.initialValue,
    required this.entries,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.whiteColor, width: 2),
          ),
          child: DropdownMenu<T>(
            initialSelection: initialValue,
            onSelected: onSelected,
            dropdownMenuEntries: entries,
            width: double.infinity,
            textStyle: AppTextStyle.normal20White,
            menuStyle: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              elevation: const WidgetStatePropertyAll(4),
              surfaceTintColor: const WidgetStatePropertyAll(
                Colors.transparent,
              ),
              shadowColor: const WidgetStatePropertyAll(Colors.black54),
              fixedSize: WidgetStatePropertyAll(
                Size.fromWidth(
                  MediaQuery.of(context).size.width - (width * 0.275),
                ),
              ),
              shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.02,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
