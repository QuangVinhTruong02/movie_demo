import 'package:easy_localization/easy_localization.dart';
import 'package:movie_demo/gen/assets.gen.dart';
import 'package:movie_demo/utils/app_languages.dart';

enum IndexPageType {
  home,
  search,
  setting;

  String get title {
    switch (this) {
      case IndexPageType.home:
        return AppLanguages.home.tr();
      case IndexPageType.search:
        return AppLanguages.search.tr();
      case IndexPageType.setting:
        return AppLanguages.setting.tr();
    }
  }

  String get iconPath {
    switch (this) {
      case IndexPageType.home:
        return Assets.icons.icHome.path;
      case IndexPageType.search:
        return Assets.icons.icSearch.path;
      case IndexPageType.setting:
        return Assets.icons.icBookmark.path;
    }
  }
}
