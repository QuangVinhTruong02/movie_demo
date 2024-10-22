import 'package:movie_demo/gen/assets.gen.dart';

enum StateRerenderType {
  loadingState,
  errorState,
  successState;

  String get animatedImage {
    switch (this) {
      case StateRerenderType.loadingState:
        return Assets.jsonAnim.animLoading;
      case StateRerenderType.errorState:
        return Assets.jsonAnim.animError;
      case StateRerenderType.successState:
        return "";
    }
  }
}
