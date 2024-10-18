import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final String title;
  final List<Widget>? actions;
  final double? heightBottomAppBar;
  final Widget? bottomAppBar;
  const CustomAppbar({
    super.key,
    this.leadingWidget,
    required this.title,
    this.actions,
    this.heightBottomAppBar,
    this.bottomAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leadingWidget,
      title: Text(
        title,
        style: AppTextstyle().getSemiBoldMontserratTextStyle(fontSize: 16),
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
