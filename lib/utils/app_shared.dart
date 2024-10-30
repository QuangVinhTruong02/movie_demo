import 'dart:ui';
import 'package:movie_demo/core/type/language_type.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AppShared {
  static final RxSharedPreferences _rxPreferences =
      RxSharedPreferences(SharedPreferences.getInstance());

  Future<String> getLanguage() async {
    return await _rxPreferences.getString(AppConst.prefsKeyLanguage) ?? LanguageType.english.name;
  }

  Future<void> setLanguage(LanguageType languageType) async {
    await _rxPreferences.setString(AppConst.prefsKeyLanguage, languageType.name);
  }

  Future<Locale> getLocale() async {
    String currentLanguage = await getLanguage();
    if (currentLanguage == LanguageType.english.name) {
      return AppConst.enLocale;
    } else {
      return AppConst.viLocale;
    }
  }

  Future<bool> hasDarkTheme() async {
    return await _rxPreferences.getBool(AppConst.prefsKeyTheme) ?? false;
  }

  Stream<bool> watchDarkTheme() {
    return _rxPreferences.getBool(AppConst.prefsKeyTheme).asStream().map((value) => value ?? false);
  }

  Future<void> setDarkTheme(bool value) async {
    await _rxPreferences.setBool(AppConst.prefsKeyTheme, value);
  }
}
