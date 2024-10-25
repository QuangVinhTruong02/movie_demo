import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:movie_demo/core/type/language_type.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:movie_demo/utils/app_shared.dart';
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
  }

  Future<void> onPressedChangeLocale(LanguageType? languageType) async {
    if (languageType == null) return;
    String currentLanguage = await appShared.getLanguage();
    if (currentLanguage == languageType.name) return;
    AppShared().setLanguage(languageType);
    if (context.mounted) Phoenix.rebirth(context);
  }

  void onSwitchDarkMode(bool value) {
    _darkModeSubject.add(value);
  }

  @override
  void dispose() {
    super.dispose();
    _languageTypeSubject.close();
  }
}
