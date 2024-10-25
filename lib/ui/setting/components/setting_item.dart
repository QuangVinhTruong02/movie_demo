import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget suffixWidget;
  const SettingItem({super.key, required this.title, required this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextstyle().getMediumPoppinTextStyle(fontSize: 16),
        ),
        suffixWidget,
      ],
    );
  }
}
