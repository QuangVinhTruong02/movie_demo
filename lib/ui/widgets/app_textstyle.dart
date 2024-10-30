import 'package:flutter/material.dart';
import 'package:movie_demo/gen/fonts.gen.dart';
import 'package:movie_demo/utils/app_colors.dart';

class AppTextstyle {
  TextStyle _getTextStyle({
    required BuildContext context,
    required FontWeight fontWeight,
    required String fontFamily,
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color ??
          (Theme.of(context).brightness == Brightness.dark ? AppColors.white : AppColors.black),
    );
  }

  TextStyle getRegularPoppinTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getMediumPoppinTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getSemiBoldPoppinTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getMediumRobotoTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.roboto,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getMediumMontserratTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.montserrat,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getSemiBoldMontserratTextStyle({
    required BuildContext context,
    double fontSize = 14,
    Color? color,
  }) {
    return _getTextStyle(
      context: context,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.montserrat,
      fontSize: fontSize,
      color: color,
    );
  }
}
