import 'package:flutter/material.dart';

import '../../../utlis/app_colors.dart';
import '../../../utlis/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color BorderSideColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String obscuringCharacter;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLines,
    this.BorderSideColor = AppColors.greyColor,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.labelStyle,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.obscuringCharacter = '.',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headlineMedium,
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        // border: outlineInputBorder(BorderSideColor: BorderSideColor),
        // enabledBorder: outlineInputBorder(BorderSideColor: BorderSideColor),
        // focusedBorder: outlineInputBorder(BorderSideColor: BorderSideColor),
        errorBorder: outlineInputBorder(BorderSideColor: AppColors.redColor),
        focusedErrorBorder: outlineInputBorder(
          BorderSideColor: AppColors.redColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyle.normal16Grey,
        labelText: labelText,
        labelStyle: labelStyle,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color BorderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: BorderSideColor,
        width: 1,
        style: BorderStyle.solid,
      ),
    );
  }
}
