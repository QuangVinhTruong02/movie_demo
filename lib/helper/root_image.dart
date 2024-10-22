import 'package:movie_demo/utils/app_const.dart';

class RootImage {
  String getBackDropPath(String backDropPath) {
    if(backDropPath.isEmpty) return "";
    return "${AppConst.rootImageurl}$backDropPath";
  }
}
