import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';

class ItemPiece extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color? colorsTitle;
  const ItemPiece({
    super.key,
    required this.iconPath,
    required this.title,
    this.colorsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppTextstyle().getRegularPoppinTextStyle(
            context: context,
            fontSize: 12,
            color: colorsTitle,
          ),
        )
      ],
    );
  }
}
