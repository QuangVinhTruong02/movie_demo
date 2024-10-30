import 'package:flutter/material.dart';
import 'package:movie_demo/utils/app_colors.dart';

class AppTheme {
  ThemeData getApplicationTheme() {
    return ThemeData().copyWith(
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  static final ThemeData lightTheme = AppTheme().getApplicationTheme().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackGroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightBackGroundColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.grey2.withOpacity(0.3),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(24, 13, 13, 13),
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
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      );

  static final ThemeData darkTheme = AppTheme().getApplicationTheme().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackGroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkBackGroundColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.grey2,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(24, 13, 13, 13),
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
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      );
}
