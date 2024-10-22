import 'package:flutter/material.dart';

class AppColors {
  static Color backGroundColor = HexColor.hexColor("#242A32");
  static Color white = HexColor.hexColor("#FFFFFF");
  static Color grey1 = HexColor.hexColor("#67686D");
  static Color grey2 = HexColor.hexColor("#3A3F47");
  static Color blue = HexColor.hexColor("#0296E5");
  static Color orange = HexColor.hexColor("#FF8700");
  

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
