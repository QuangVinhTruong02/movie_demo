import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
      child: Text(
        title,
        style: AppTextstyle().getMediumPoppinTextStyle(context: context, fontSize: 16),
      ),
    );
  }
}
