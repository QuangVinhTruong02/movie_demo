import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/utils/app_colors.dart';

class LeadingBackIcon extends StatelessWidget {
  final Function() onPressed;
  const LeadingBackIcon({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.white.withOpacity(0.2),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        Assets.icons.icArrowLeft.path,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color ?? AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
