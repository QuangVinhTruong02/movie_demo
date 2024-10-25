import 'package:easy_localization/easy_localization.dart';
import 'package:movie_demo/utils/app_languages.dart';

enum MovieType {
  nowPlaying,
  upcomming,
  topRated,
  popular;

  String get title {
    switch (this) {
      case MovieType.nowPlaying:
        return AppLanguages.nowPlaying.tr();
      case MovieType.upcomming:
        return AppLanguages.upcomming.tr();
      case MovieType.topRated:
        return AppLanguages.topRated.tr();
      case MovieType.popular:
        return AppLanguages.popular.tr();
    }
  }
}
