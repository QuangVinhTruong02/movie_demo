import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:movie_demo/utils/app_shared.dart';

class MyAppViewModel extends BaseViewModel {
  bool isDarkMode = false;

  void onInit() {
    AppShared().hasDarkTheme().then((value) {
      isDarkMode = value;
      notifyListeners();
    });
  }

  void setDarkMode(bool value) {
    AppShared().setDarkTheme(value).whenComplete(
      () {
        isDarkMode = value;
        notifyListeners();
      },
    );
  }
}
