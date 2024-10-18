import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/custom_textfield.dart';
import 'package:movie_demo/utils/app_languages.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  final double height = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Text(
          AppLanguages.whatDoYouWantToWatch,
          style: AppTextstyle().getSemiBoldPoppinTextStyle(
            fontSize: 18,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
          child: CustomTextfield(
            hintText: AppLanguages.search,
            readOnly: true,
            suffixWidget: SvgPicture.asset(Assets.icons.icSearchSuffix.path),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 2);
}
