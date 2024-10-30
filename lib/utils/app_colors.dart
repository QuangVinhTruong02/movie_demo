import 'package:flutter/material.dart';

class AppColors {
  static Color darkBackGroundColor = HexColor.hexColor("#242A32");
  static Color lightBackGroundColor = HexColor.hexColor("#F0F0F0");

  static Color white = HexColor.hexColor("#FFFFFF");
  static Color black = HexColor.hexColor("#1E1E1E");
  static Color grey1 = HexColor.hexColor("#67686D");
  static Color grey2 = HexColor.hexColor("#3A3F47");
  static Color blue = HexColor.hexColor("#0296E5");
  static Color orange = HexColor.hexColor("#FF8700");
  static Color red = HexColor.hexColor("#FF4C4C");
}

extension HexColor on Color {
  static Color hexColor(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
