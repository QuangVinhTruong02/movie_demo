import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:movie_demo/core/type/language_type.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:movie_demo/ui/my_app/my_app_viewmodel.dart';
import 'package:movie_demo/utils/app_shared.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SettingViewModel extends BaseViewModel {
  final BehaviorSubject<LanguageType> _languageTypeSubject = BehaviorSubject<LanguageType>();
  Stream<LanguageType> get languageTypeStream => _languageTypeSubject.stream;

  final BehaviorSubject<bool> _darkModeSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get darkModeStream => _darkModeSubject.stream;

  AppShared appShared = AppShared();

  Future<void> onInit() async {
    String currentLanguage = await appShared.getLanguage();
    LanguageType languageType = LanguageType.convertStringToEnum(currentLanguage);
    _languageTypeSubject.add(languageType);

    bool hasDarkTheme = await appShared.hasDarkTheme();
    _darkModeSubject.add(hasDarkTheme);
  }

  Future<void> onPressedChangeLocale(LanguageType? languageType) async {
    if (languageType == null) return;
    String currentLanguage = await appShared.getLanguage();
    if (currentLanguage == languageType.name) return;
    AppShared().setLanguage(languageType);
    if (context.mounted) Phoenix.rebirth(context);
  }

  Future<void> onSwitchDarkMode(bool value) async {
    _darkModeSubject.add(value);
    context.read<MyAppViewModel>().setDarkMode(value);
  }

  @override
  void dispose() {
    super.dispose();
    _languageTypeSubject.close();
    _darkModeSubject.close();
  }
}
