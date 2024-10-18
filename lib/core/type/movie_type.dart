import 'package:movie_demo/utils/app_languages.dart';

enum MovieType {
  nowPlaying,
  upcomming,
  topRated,
  popular;

  String get title {
    switch (this) {
      case MovieType.nowPlaying:
        return AppLanguages.nowPlaying;
      case MovieType.upcomming:
        return AppLanguages.upcomming;
      case MovieType.topRated:
        return AppLanguages.topRated;
      case MovieType.popular:
        return AppLanguages.popular;
    }
  }
}
