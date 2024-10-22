import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/ui/widgets/custom_appbar.dart';
import 'package:movie_demo/utils/app_languages.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      leading: null,
      title: AppLanguages.search,
      actions: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(Assets.icons.icInfoCircle.path),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
