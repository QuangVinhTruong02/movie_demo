import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_demo/gen/fonts.gen.dart';
import 'package:movie_demo/utils/app_colors.dart';

class AppTextstyle {
  TextStyle _getTextStyle({
    required FontWeight fontWeight,
    required String fontFamily,
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color ?? AppColors.white,
    );
  }

  TextStyle getRegularPoppinTextStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getMediumPoppinTextStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getSemiBoldPoppinTextStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.poppins,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getMediumRobotoTextStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.roboto,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle getSemiBoldMontserratTextStyle({double fontSize = 14, Color? color}) {
    return _getTextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.montserrat,
      fontSize: fontSize,
      color: color,
    );
  }
}
