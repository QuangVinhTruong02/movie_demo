import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final bool readOnly;
  final String hintText;
  const CustomTextfield({
    super.key,
    this.controller,
    this.suffixWidget,
    this.onTap,
    this.readOnly = false,
    required this.hintText,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      style: AppTextstyle().getRegularPoppinTextStyle(context: context),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintStyle: AppTextstyle().getRegularPoppinTextStyle(
          context: context,
          color: AppColors.grey1,
        ),
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: suffixWidget,
        ),
      ),
      onFieldSubmitted: onSubmitted,
    );
  }
}
