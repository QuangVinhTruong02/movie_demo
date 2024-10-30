import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final double? heightBottomAppBar;
  final Widget? bottomAppBar;
  const CustomAppbar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.heightBottomAppBar,
    this.bottomAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leading,
      title: Text(
        title,
        style: AppTextstyle().getSemiBoldMontserratTextStyle(context: context, fontSize: 16),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(heightBottomAppBar ?? 0),
        child: bottomAppBar ?? const SizedBox.shrink(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
