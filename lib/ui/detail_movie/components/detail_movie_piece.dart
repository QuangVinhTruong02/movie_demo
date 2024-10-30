import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';

class DetailMoviePiece extends StatelessWidget {
  final String title;
  final String subTitle;
  const DetailMoviePiece({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title:",
              style: AppTextstyle().getSemiBoldPoppinTextStyle(context: context, fontSize: 16),
            ),
            const WidgetSpan(
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: subTitle,
              style: AppTextstyle().getRegularPoppinTextStyle(
                context: context,
                fontSize: 16,
                color: AppColors.grey1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
