import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:movie_demo/utils/app_languages.dart';

@JsonEnum()
enum LanguageType {
  english,
  vietnamese;

  String get title {
    switch (this) {
      case LanguageType.english:
        return AppLanguages.english.tr();
      case LanguageType.vietnamese:
        return AppLanguages.vienamese.tr();
    }
  }

  Locale get getLocal {
    switch (this) {
      case LanguageType.english:
        return AppConst.enLocale;
      case LanguageType.vietnamese:
        return AppConst.viLocale;
    }
  }

  static LanguageType convertStringToEnum(String value) {
    if (value == LanguageType.english.name) {
      return LanguageType.english;
    } else {
      return LanguageType.vietnamese;
    }
  }
}
