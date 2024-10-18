import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/utils/app_languages.dart';

enum IndexPageType {
  home,
  search,
  watchList;

  String get title {
    switch (this) {
      case IndexPageType.home:
        return AppLanguages.home;
      case IndexPageType.search:
        return AppLanguages.search;
      case IndexPageType.watchList:
        return AppLanguages.watchList;
    }
  }

  String get iconPath {
    switch (this) {
      case IndexPageType.home:
        return Assets.icons.icHome.path;
      case IndexPageType.search:
        return Assets.icons.icSearch.path;
      case IndexPageType.watchList:
        return Assets.icons.icBookmark.path;
    }
  }
}
