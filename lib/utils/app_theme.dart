import 'package:flutter/material.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/utils/app_colors.dart';

class AppTheme {
  ThemeData getApplicationTheme() {
    return ThemeData().copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.blue,
      ),
      // scaffoldBackgroundColor: AppColors.darkBackGroundColor,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBackGroundColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.grey2,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(24, 13, 13, 13),
        hintStyle: AppTextstyle().getRegularPoppinTextStyle(color: AppColors.grey1),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTextstyle().getMediumPoppinTextStyle(fontSize: 16),
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}
