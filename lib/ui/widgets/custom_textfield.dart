import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Function()? onTap;
  final bool readOnly;
  final String hintText;
  const CustomTextfield({
    super.key,
    this.controller,
    this.suffixWidget,
    this.onTap,
    this.readOnly = false,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: suffixWidget,
        ),
      ),
    );
  }
}
