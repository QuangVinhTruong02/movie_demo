import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_demo/gen/assets.gen.dart';

class LeadingBackIcon extends StatelessWidget {
  final Function() onTap;
  const LeadingBackIcon({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: SvgPicture.asset(Assets.icons.icHome.path),
    );
  }
}
