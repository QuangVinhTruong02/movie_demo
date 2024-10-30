import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';

class ApplicationNavItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final Function() onTap;
  const ApplicationNavItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.blue : AppColors.grey1,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextstyle().getMediumRobotoTextStyle(
              context: context,
              fontSize: 12,
              color: isSelected ? AppColors.blue : AppColors.grey1,
            ),
          )
        ],
      ),
    );
  }
}
